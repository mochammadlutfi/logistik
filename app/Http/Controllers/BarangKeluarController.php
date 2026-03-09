<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
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
        }, 'supplier', 'permintaan'])
        ->where('jenis', 'keluar')
        ->orderByDesc('created_at')->get();


        return view('keluar.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();
        // Tampilkan permintaan yang disetujui atau partial (belum selesai)
        $permintaan = PermintaanBarang::whereIn('status', ['disetujui', 'partial'])->orderBy('id', 'DESC')->get();
        return view('keluar.form', compact('isEdit', 'permintaan', 'barang'));
    }
    
    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'permintaan_id' => ['required', 'integer', 'exists:permintaan_barang,id'],
            'tanggal' => ['required'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
            'catatan' => ['nullable', 'string'],
            'detail' => ['required', 'array', 'min:1'],
            'detail.*.permintaan_detail_id' => ['nullable', 'integer', 'exists:permintaan_barang_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['required', 'integer', 'min:1'],
            'detail.*.catatan' => ['nullable', 'string']
        ]);

        // Validasi tambahan untuk memastikan tidak ada qty 0
        foreach($validated['detail'] as $index => $detail) {
            if ($detail['jml'] <= 0) {
                return back()->withErrors([
                    "detail.{$index}.jml" => "Jumlah tidak boleh 0. Silakan hapus baris ini jika tidak diperlukan."
                ])->withInput();
            }
        }

        $maxId = PencatatanBarang::where('jenis', 'keluar')->max('id') ?? 0;
        $validated['kode'] = 'WH-OUT/' . date('Ym').'/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['jenis'] = 'keluar';
        $validated['user_id'] = auth()->user()->id;

        \Illuminate\Support\Facades\DB::transaction(function () use ($validated) {
            $data = PencatatanBarang::create($validated);

            foreach($validated['detail'] as $d){
                // Get stok tersedia dari StokGudang
                $stokGudang = \App\Models\StokGudang::where('barang_id', $d['barang_id'])->first();
                $stokTersedia = $stokGudang ? $stokGudang->stok_tersedia : 0;

                // Tentukan jumlah yang akan dikeluarkan (maksimal sesuai stok tersedia)
                $jmlKeluar = min($d['jml'], $stokTersedia);

                if ($jmlKeluar == 0) {
                    throw \Illuminate\Validation\ValidationException::withMessages([
                        'detail' => "Stok tidak tersedia untuk barang ID {$d['barang_id']}."
                    ]);
                }

                // Simpan detail barang keluar
                $data->detail()->create([
                    'barang_id' => $d['barang_id'],
                    'jml' => $jmlKeluar,
                    'catatan' => $d['catatan'] ?? null,
                ]);

                // Update Stok Gudang
                if ($stokGudang) {
                    $stokGudang->decrement('stok_tersedia', $jmlKeluar);
                }

                // Update Total Stok Barang
                \App\Models\Barang::where('id', $d['barang_id'])->decrement('stok_total', $jmlKeluar);

                // Update jml_terpenuhi di permintaan_barang_detail
                if (isset($d['permintaan_detail_id'])) {
                    $permintaanDetail = \App\Models\PermintaanBarangDetail::find($d['permintaan_detail_id']);
                    if ($permintaanDetail) {
                        $permintaanDetail->increment('jml_terpenuhi', $jmlKeluar);
                    }
                }
            }
        });

        // Update status permintaan berdasarkan pemenuhan
        $permintaan = PermintaanBarang::with('detail')->findOrFail($validated['permintaan_id']);
        $permintaan->updateStatusBerdasarkanPemenuhan();

        return redirect()->route('barang-keluar.show', $data->id)->with('status', 'Barang Keluar berhasil disimpan');
    }

    public function show($id){
        $item = PencatatanBarang::with(['supplier', 'permintaan', 'detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        // dd($item->toArray());
        // dd($item->toArray());
        return view('keluar.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PencatatanBarang::with(['supplier', 'permintaan', 'detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();

        $permintaan = PermintaanBarang::orderBy('id', 'DESC')->get();
        return view('keluar.form', compact('item', 'barang', 'suppliers', 'isEdit', 'permintaan'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PencatatanBarang::findOrFail($id);
        $validated = $request->validate([
            'tanggal' => ['required'],
            'permintaan_id' => ['required', 'integer', 'exists:permintaan_barang,id'],
            'tujuan_barang' => ['nullable'],
            'catatan' => ['nullable', 'string'],
            'detail' => ['required', 'array', 'min:1'],
            'detail.*.id' => ['nullable', 'integer', 'exists:pencatatan_barang_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.catatan' => ['nullable', 'string'],
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
                'catatan' => $d['catatan'],
            ]);
        }
        // dd($validated['detail_hapus']);
        if($validated['detail_hapus']){
            $barang->detail()->whereIn('id', explode(',', $validated['detail_hapus']))->delete();
        }
        
        return redirect()->route('barang-keluar.show', $barang->id)->with('status', 'Barang Keluar berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PencatatanBarang::findOrFail($id);
        $barang->delete();
        return redirect()->route('barang-keluar.index')->with('status', 'Barang Keluar berhasil dihapus');
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

    public function getStokBarang($barangId)
    {
        $stokGudang = \App\Models\StokGudang::where('barang_id', $barangId)->first();
        $barang = \App\Models\Barang::find($barangId);

        return response()->json([
            'success' => true,
            'stok_tersedia' => $stokGudang ? $stokGudang->stok_tersedia : 0,
            'stok_total' => $barang ? $barang->stok_total : 0,
        ]);
    }
}