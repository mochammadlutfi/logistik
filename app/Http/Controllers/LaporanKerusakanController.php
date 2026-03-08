<?php

namespace App\Http\Controllers;

use App\Models\LaporanKerusakan;
use App\Models\PemeliharaanBarang;
use App\Models\Barang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class LaporanKerusakanController extends Controller
{
    public function index(Request $request)
    {
        $items = LaporanKerusakan::with(['pemeliharaan', 'petugas', 'detail' => function($query){
            $query->with(['barang.satuan']);
        }])
        ->orderByDesc('created_at')
        ->get();

        return view('laporan-kerusakan.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $pemeliharaan = PemeliharaanBarang::with(['detail.barang'])
            ->orderByDesc('tanggal')
            ->get();
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();

        return view('laporan-kerusakan.form', compact('isEdit', 'pemeliharaan', 'barang'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'pemeliharaan_id' => ['required', 'integer', 'exists:pemeliharaan_barang,id'],
            'tanggal' => ['required', 'date'],
            'catatan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.rusak_ringan' => ['nullable', 'integer', 'min:0'],
            'detail.*.tindakan_rusak_ringan' => ['nullable', 'string', Rule::in(['diganti', 'masih_bisa_dipakai', ''])],
            'detail.*.rusak_berat' => ['nullable', 'integer', 'min:0'],
            'detail.*.tindakan_rusak_berat' => ['nullable', 'string', Rule::in(['diprovinsiin', 'dimusnahkan', 'diganti_baru', ''])],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);

        $maxId = LaporanKerusakan::max('id') ?? 0;
        $validated['kode'] = 'LP-KRS/' . date('Ym') . '/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['petugas_id'] = auth()->user()->id;
        $validated['status'] = 'pending';

        \Illuminate\Support\Facades\DB::transaction(function () use ($validated) {
            $laporan = LaporanKerusakan::create($validated);

            foreach($validated['detail'] as $d){
                $laporan->detail()->create([
                    'barang_id' => $d['barang_id'],
                    'rusak_ringan' => $d['rusak_ringan'] ?? 0,
                    'tindakan_rusak_ringan' => $d['tindakan_rusak_ringan'] ?? '',
                    'rusak_berat' => $d['rusak_berat'] ?? 0,
                    'tindakan_rusak_berat' => $d['tindakan_rusak_berat'] ?? '',
                    'keterangan' => $d['keterangan'] ?? null,
                ]);
            }
        });

        return redirect()->route('laporan-kerusakan.index')->with('status', 'Laporan Kerusakan berhasil dibuat');
    }

    public function show($id)
    {
        $item = LaporanKerusakan::with(['pemeliharaan', 'petugas', 'detail' => function($q){
            return $q->with(['barang.satuan', 'barang.kategori']);
        }])->findOrFail($id);

        return view('laporan-kerusakan.show', compact('item'));
    }

    public function edit($id)
    {
        $isEdit = true;
        $item = LaporanKerusakan::with(['pemeliharaan', 'petugas', 'detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);

        $pemeliharaan = PemeliharaanBarang::with(['detail.barang'])
            ->orderByDesc('tanggal')
            ->get();
        $barang = Barang::with('satuan')->orderBy('nama_barang')->get();

        return view('laporan-kerusakan.form', compact('item', 'barang', 'pemeliharaan', 'isEdit'));
    }

    public function update(Request $request, $id)
    {
        $laporan = LaporanKerusakan::findOrFail($id);

        $validated = $request->validate([
            'pemeliharaan_id' => ['required', 'integer', 'exists:pemeliharaan_barang,id'],
            'tanggal' => ['required', 'date'],
            'status' => ['required', 'string', Rule::in(['pending', 'diproses', 'selesai'])],
            'catatan' => ['nullable', 'string'],
            'detail.*.id' => ['nullable', 'integer', 'exists:laporan_kerusakan_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.rusak_ringan' => ['nullable', 'integer', 'min:0'],
            'detail.*.tindakan_rusak_ringan' => ['nullable', 'string', Rule::in(['diganti', 'masih_bisa_dipakai', ''])],
            'detail.*.rusak_berat' => ['nullable', 'integer', 'min:0'],
            'detail.*.tindakan_rusak_berat' => ['nullable', 'string', Rule::in(['diprovinsiin', 'dimusnahkan', 'diganti_baru', ''])],
            'detail.*.keterangan' => ['nullable', 'string'],
            'detail_hapus' => ['nullable', 'string'],
        ]);

        $laporan->update($validated);

        foreach($validated['detail'] as $d){
            $laporan->detail()->updateOrCreate([
                'id' => $d['id'] ?? null,
            ],[
                'barang_id' => $d['barang_id'],
                'rusak_ringan' => $d['rusak_ringan'] ?? 0,
                'tindakan_rusak_ringan' => $d['tindakan_rusak_ringan'] ?? '',
                'rusak_berat' => $d['rusak_berat'] ?? 0,
                'tindakan_rusak_berat' => $d['tindakan_rusak_berat'] ?? '',
                'keterangan' => $d['keterangan'] ?? null,
            ]);
        }

        if($validated['detail_hapus'] ?? null){
            $laporan->detail()->whereIn('id', explode(',', $validated['detail_hapus']))->delete();
        }

        return redirect()->route('laporan-kerusakan.index')->with('status', 'Laporan Kerusakan berhasil diperbarui');
    }

    public function destroy($id)
    {
        $laporan = LaporanKerusakan::findOrFail($id);
        $laporan->delete();

        return redirect()->route('laporan-kerusakan.index')->with('status', 'Laporan Kerusakan berhasil dihapus');
    }

    // Update status laporan
    public function updateStatus(Request $request, $id)
    {
        $laporan = LaporanKerusakan::findOrFail($id);

        $validated = $request->validate([
            'status' => ['required', 'string', Rule::in(['pending', 'diproses', 'selesai'])],
        ]);

        $laporan->update(['status' => $validated['status']]);

        return redirect()->route('laporan-kerusakan.show', $id)->with('status', 'Status laporan berhasil diperbarui');
    }

    // API untuk mendapatkan detail pemeliharaan
    public function getPemeliharaanDetail($id)
    {
        $pemeliharaan = PemeliharaanBarang::with(['detail' => function($q) {
            $q->with(['barang' => function($q) {
                $q->with('satuan');
            }]);
        }])->findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $pemeliharaan
        ]);
    }
}
