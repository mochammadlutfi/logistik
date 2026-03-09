<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\PermintaanBarang;
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
        }, 'supplier', 'permintaan'])
        ->where('jenis', 'masuk')
        ->orderByDesc('created_at')->get();


        return view('masuk.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();
        // Tampilkan permintaan yang disetujui atau partial (belum selesai)
        $permintaan = PermintaanBarang::whereIn('status', ['disetujui', 'partial'])->orderBy('id', 'DESC')->get();

        $user = auth()->user();

        return view('masuk.form', compact('isEdit', 'suppliers', 'barang', 'permintaan'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'permintaan_id' => ['nullable', 'integer', 'exists:permintaan_barang,id'],
            'tanggal' => ['required'],
            'supplier_id' => ['nullable', 'integer', 'exists:suppliers,id'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
            'catatan' => ['nullable', 'string'],
            'auto_fulfill' => ['nullable', 'boolean'],
            'detail' => ['required', 'array', 'min:1'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string'],
            'detail.*.permintaan_detail_id' => ['nullable', 'integer', 'exists:permintaan_barang_detail,id']
        ]);
        
        $maxId = PencatatanBarang::where('jenis', 'masuk')->max('id') ?? 0;
        $validated['kode'] = 'WH-IN/' . date('Ym').'/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['jenis'] = 'masuk';
        $validated['user_id'] = auth()->user()->id;
        
        $barangMasukId = null;

        \Illuminate\Support\Facades\DB::transaction(function () use ($validated, &$barangMasukId) {
            $data = PencatatanBarang::create($validated);
            $barangMasukId = $data->id;

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

            // Auto-create Barang Keluar jika auto_fulfill dicentang dan ada permintaan_id
            if (!empty($validated['auto_fulfill']) && !empty($validated['permintaan_id'])) {
                $this->autoCreateBarangKeluar($validated, $data);
            }
        });

        $message = 'Barang Masuk berhasil disimpan';
        if (!empty($validated['auto_fulfill']) && !empty($validated['permintaan_id'])) {
            $message .= ' dan Barang Keluar otomatis dibuat untuk memenuhi permintaan';
        }

        return redirect()->route('barang-masuk.index')->with('status', $message);
    }

    public function show($id){
        $item = PencatatanBarang::with(['supplier', 'permintaan', 'detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        // dd($item->toArray());
        // dd($item->toArray());
        return view('masuk.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PencatatanBarang::with(['supplier', 'permintaan', 'detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $permintaan = PermintaanBarang::orderBy('id', 'DESC')->get();

        $user = auth()->user();

        return view('masuk.form', compact('item', 'barang', 'suppliers', 'isEdit', 'permintaan'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PencatatanBarang::findOrFail($id);
        $validated = $request->validate([
            'permintaan_id' => ['nullable', 'integer', 'exists:permintaan_barang,id'],
            'tanggal' => ['required'],
            'supplier_id' => ['nullable', 'integer', 'exists:suppliers,id'],
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
        
        return redirect()->route('barang-masuk.index')->with('status', 'Barang Masuk berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PencatatanBarang::findOrFail($id);
        $barang->delete();
        return redirect()->route('barang-masuk.index')->with('status', 'Barang Masuk berhasil dihapus');
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

    /**
     * Auto-create Barang Keluar setelah Barang Masuk untuk memenuhi permintaan
     */
    private function autoCreateBarangKeluar($validated, $barangMasuk)
    {
        // Generate kode untuk barang keluar
        $maxId = PencatatanBarang::where('jenis', 'keluar')->max('id') ?? 0;
        $kodeBarangKeluar = 'WH-OUT/' . date('Ym').'/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);

        // Buat transaksi barang keluar
        $barangKeluar = PencatatanBarang::create([
            'kode' => $kodeBarangKeluar,
            'jenis' => 'keluar',
            'permintaan_id' => $validated['permintaan_id'],
            'tanggal' => $validated['tanggal'],
            'tujuan_barang' => $validated['tujuan_barang'] ?? null,
            'catatan' => 'Otomatis dibuat dari Barang Masuk: ' . $barangMasuk->kode,
            'user_id' => auth()->user()->id,
        ]);

        // Proses setiap detail barang masuk
        foreach($validated['detail'] as $d){
            // Jika ada permintaan_detail_id, ambil sisa yang belum terpenuhi
            if (!empty($d['permintaan_detail_id'])) {
                $permintaanDetail = \App\Models\PermintaanBarangDetail::find($d['permintaan_detail_id']);

                if ($permintaanDetail) {
                    // Hitung sisa yang belum terpenuhi
                    $sisaPermintaan = $permintaanDetail->jml - ($permintaanDetail->jml_terpenuhi ?? 0);

                    // Tentukan jumlah yang akan dikeluarkan (maksimal sesuai sisa permintaan)
                    $jmlKeluar = min($d['jml'], $sisaPermintaan);

                    if ($jmlKeluar > 0) {
                        // Simpan detail barang keluar
                        $barangKeluar->detail()->create([
                            'barang_id' => $d['barang_id'],
                            'jml' => $jmlKeluar,
                            'catatan' => 'Auto-fulfill dari Barang Masuk',
                        ]);

                        // Kurangi Stok Gudang
                        $stokGudang = \App\Models\StokGudang::where('barang_id', $d['barang_id'])->first();
                        if ($stokGudang) {
                            $stokGudang->decrement('stok_tersedia', $jmlKeluar);
                        }

                        // Kurangi Total Stok Barang
                        \App\Models\Barang::where('id', $d['barang_id'])->decrement('stok_total', $jmlKeluar);

                        // Update jml_terpenuhi di permintaan_barang_detail
                        $permintaanDetail->increment('jml_terpenuhi', $jmlKeluar);
                    }
                }
            }
        }

        // Update status permintaan berdasarkan pemenuhan
        if (!empty($validated['permintaan_id'])) {
            $permintaan = PermintaanBarang::with('detail')->findOrFail($validated['permintaan_id']);
            $permintaan->updateStatusBerdasarkanPemenuhan();
        }

        return $barangKeluar;
    }
}