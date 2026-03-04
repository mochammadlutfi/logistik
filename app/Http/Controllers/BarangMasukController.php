<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Barryvdh\DomPDF\Facade\Pdf;
use PDO;

class BarangMasukController extends Controller
{
    public function index(Request $request)
    {
        $items = PencatatanBarang::with([ 'detail' => function($query){
            $query->with(['barang']);
        }, 'supplier'])
        ->where('jenis', 'masuk')
        ->orderByDesc('created_at')->get();


        return view('masuk.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $barang = Barang::orderBy('nama_barang')->get();
        
        $user = auth()->user();

        return view('masuk.form', compact('isEdit', 'suppliers', 'barang'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'tanggal' => ['required'],
            'supplier_id' => ['required', 'integer', 'exists:suppliers,id'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
            'catatan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);
        
        $maxId = PencatatanBarang::where('jenis', 'masuk')->max('id') ?? 0;
        $validated['kode'] = 'WH-IN/' . date('Ym').'/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['jenis'] = 'masuk';
        $validated['user_id'] = auth()->user()->id;
        
        \Illuminate\Support\Facades\DB::transaction(function () use ($validated) {
            $data = PencatatanBarang::create($validated);

            foreach($validated['detail'] as $d){
                $data->detail()->create([
                    'barang_id' => $d['barang_id'],
                    'jml' => $d['jml'],
                    'keterangan' => $d['keterangan'],
                ]);

                // Update Stok Gudang
                $stokGudang = \App\Models\StokGudang::firstOrCreate(
                    ['barang_id' => $d['barang_id']],
                    ['stok_tersedia' => 0, 'baik' => 0, 'rusak_ringan' => 0, 'rusak_berat' => 0]
                );
                $stokGudang->increment('stok_tersedia', $d['jml']);

                // Update Total Stok Barang
                \App\Models\Barang::where('id', $d['barang_id'])->increment('stok_total', $d['jml']);
            }
        });

        return redirect()->route('barang-masuk.index')->with('status', 'Barang berhasil dibuat');
    }

    public function show($id){
        $item = PencatatanBarang::with(['supplier', 'detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        // dd($item->toArray());
        // dd($item->toArray());
        return view('masuk.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PencatatanBarang::with(['supplier', 'detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        
        $user = auth()->user();

        return view('masuk.form', compact('item', 'barang', 'suppliers', 'isEdit'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PencatatanBarang::findOrFail($id);
        $validated = $request->validate([
            'tanggal' => ['required'],
            'supplier_id' => ['required', 'integer', 'exists:suppliers,id'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
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
        
        return redirect()->route('barang-masuk.index')->with('status', 'Barang berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PencatatanBarang::findOrFail($id);
        $barang->delete();
        return redirect()->route('barang-masuk.index')->with('status', 'Barang berhasil dihapus');
    }

    public function exportPdf($id)
    {
        $item = PencatatanBarang::with(['supplier', 'user', 'detail' => function($q){
            return $q->with(['barang.satuan', 'barang.kategori']);
        }])->findOrFail($id);

        $pdf = Pdf::loadView('masuk.pdf.reservation-slip', compact('item'));
        $pdf->setPaper('A4', 'portrait');

        $filename = 'reservation-slip-' . str_replace('/', '-', $item->kode) . '.pdf';
        return $pdf->download($filename);
    }
}