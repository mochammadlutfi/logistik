<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\Gudang; // Added this line
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Models\PermintaanBarang;
use Barryvdh\DomPDF\Facade\Pdf;
use PDO;

class BarangKeluarController extends Controller
{
    public function index(Request $request)
    {
        $items = PencatatanBarang::with([ 'detail' => function($query){
            $query->with(['barang']);
        }, 'supplier'])
        ->where('jenis', 'keluar')
        ->orderByDesc('created_at')->get();


        return view('keluar.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $barang = Barang::orderBy('nama_barang')->get();
        $permintaan = PermintaanBarang::orderBy('id', 'DESC')->where('status', 'disetujui')->get();
        $gudang = Gudang::where('is_active', true)->orderBy('nama_gudang')->get();
        return view('keluar.form', compact('isEdit', 'permintaan', 'barang', 'gudang'));
    }
    
    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'permintaan_id' => ['required', 'integer', 'exists:permintaan_barang,id'],
            'gudang_id' => ['required', 'exists:gudang,id'],
            'tanggal' => ['required'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
            'catatan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);
        
        $validated['kode'] = 'WH-OUT/' . date('Ym').'/' .str_pad(PencatatanBarang::where('jenis', 'keluar')->count() + 1, 4, '0', STR_PAD_LEFT);
        $validated['jenis'] = 'keluar';
        $validated['user_id'] = auth()->user()->id;
        
        \Illuminate\Support\Facades\DB::transaction(function () use ($validated) {
            $data = PencatatanBarang::create($validated);

            foreach($validated['detail'] as $d){
                // Check Stock Availability at Gudang
                $stokGudang = \App\Models\StokGudang::where('gudang_id', $validated['gudang_id'])
                    ->where('barang_id', $d['barang_id'])
                    ->first();

                if (!$stokGudang || $stokGudang->stok_tersedia < $d['jml']) {
                    $barangName = \App\Models\Barang::find($d['barang_id'])->nama_barang ?? 'Unknown';
                    throw new \Illuminate\Validation\ValidationException(\Illuminate\Support\Facades\Validator::make([], []), [
                        'detail' => "Stok tidak cukup untuk barang {$barangName} di gudang yang dipilih."
                    ]);
                }

                $data->detail()->create([
                    'barang_id' => $d['barang_id'],
                    'jml' => $d['jml'],
                    'keterangan' => $d['keterangan'],
                ]);

                // Update Stok
                $stokGudang->decrement('stok_tersedia', $d['jml']);
                \App\Models\Barang::where('id', $d['barang_id'])->decrement('stok_total', $d['jml']);
            }
        });

        $permintaan = PermintaanBarang::findOrFail($validated['permintaan_id']);
        $permintaan->status = 'selesai';
        $permintaan->save();

        return redirect()->route('barang-keluar.index')->with('status', 'Barang berhasil dibuat');
    }

    public function show($id){
        $item = PencatatanBarang::with(['supplier', 'detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        // dd($item->toArray());
        // dd($item->toArray());
        return view('keluar.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PencatatanBarang::with(['supplier', 'detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $gudang = Gudang::where('is_active', true)->orderBy('nama_gudang')->get();

        return view('keluar.form', compact('item', 'barang', 'suppliers', 'isEdit', 'gudang'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PencatatanBarang::findOrFail($id);
        $validated = $request->validate([
            'tanggal' => ['required'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'catatan' => ['nullable', 'string'],
            'detail.*.id' => ['nullable', 'integer', 'exists:pencatatan_barang_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string'],
            'detail_hapus' => ['nullable', 'string'],
        ]);

        $barang->update($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $barang->detail()->updateOrCreate([
                'id' => $d['id'],
            ],[
                'barang_id' => $d['barang_id'],
                'jml' => $d['jml'],
                'keterangan' => $d['keterangan'],
            ]);
        }
        // dd($validated['detail_hapus']);
        if($validated['detail_hapus']){
            $barang->detail()->whereIn('id', explode(',', $validated['detail_hapus']))->delete();
        }
        
        return redirect()->route('barang-keluar.index')->with('status', 'Barang berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PencatatanBarang::findOrFail($id);
        $barang->delete();
        return redirect()->route('barang-keluar.index')->with('status', 'Barang berhasil dihapus');
    }

    public function exportPdf($id)
    {
        $item = PencatatanBarang::with(['supplier', 'detail' => function($q){
            return $q->with(['barang.satuan']);
        }])->findOrFail($id);

        $pdf = Pdf::loadView('keluar.pdf.surat-pengeluaran', compact('item'));
        $pdf->setPaper('A4', 'portrait');

        $filename = 'surat-pengeluaran-' . str_replace('/', '-', $item->kode) . '.pdf';
        return $pdf->download($filename);
    }
}