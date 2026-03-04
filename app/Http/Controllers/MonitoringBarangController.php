<?php

namespace App\Http\Controllers;

use App\Models\MonitoringBarang;
use App\Models\MonitoringBarangDetail;
use App\Models\Barang;
use App\Models\StokGudang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MonitoringBarangController extends Controller
{
    public function index()
    {
        $items = MonitoringBarang::with(['petugas', 'detail.barang'])->orderByDesc('created_at')->get();
        return view('monitoring.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $barang = Barang::orderBy('nama_barang')->where('is_active', true)->get();
        return view('monitoring.form', compact('isEdit', 'barang'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'tanggal' => ['required', 'date'],
            'lokasi' => ['nullable', 'string', 'max:200'],
            'keterangan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.baik' => ['required', 'integer', 'min:0'],
            'detail.*.rusak_ringan' => ['required', 'integer', 'min:0'],
            'detail.*.rusak_berat' => ['required', 'integer', 'min:0'],
        ]);

        $maxId = MonitoringBarang::max('id') ?? 0;
        $validated['kode'] = 'MON/' . date('Y/m') . '/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['petugas_id'] = auth()->user()->id;

        DB::transaction(function () use ($validated) {
            $monitoring = MonitoringBarang::create($validated);

            foreach ($validated['detail'] as $d) {
                $monitoring->detail()->create([
                    'barang_id' => $d['barang_id'],
                    'baik' => $d['baik'],
                    'rusak_ringan' => $d['rusak_ringan'],
                    'rusak_berat' => $d['rusak_berat'],
                ]);

                // Update Stok Total di Barang based on total monitored
                $totalSesuaiFisik = $d['baik'] + $d['rusak_ringan'] + $d['rusak_berat'];
                Barang::where('id', $d['barang_id'])->update(['stok_total' => $totalSesuaiFisik]);

                // Update Stok Tersedia di Gudang (Assuming single warehouse logic as requested)
                StokGudang::where('barang_id', $d['barang_id'])->update(['stok_tersedia' => $totalSesuaiFisik]);
            }
        });

        return redirect()->route('monitoring-barang.index')->with('status', 'Monitoring Barang berhasil disimpan');
    }

    public function show($id)
    {
        $item = MonitoringBarang::with(['petugas', 'detail.barang.satuan'])->findOrFail($id);
        return view('monitoring.show', compact('item'));
    }

    public function edit($id)
    {
        $isEdit = true;
        $item = MonitoringBarang::with('detail.barang')->findOrFail($id);
        $barang = Barang::orderBy('nama_barang')->where('is_active', true)->get();
        
        return view('monitoring.form', compact('isEdit', 'item', 'barang'));
    }

    public function update(Request $request, $id)
    {
        $monitoring = MonitoringBarang::findOrFail($id);
        
        $validated = $request->validate([
            'tanggal' => ['required', 'date'],
            'lokasi' => ['nullable', 'string', 'max:200'],
            'keterangan' => ['nullable', 'string'],
            'detail.*.id' => ['nullable', 'integer', 'exists:monitoring_barang_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.baik' => ['required', 'integer', 'min:0'],
            'detail.*.rusak_ringan' => ['required', 'integer', 'min:0'],
            'detail.*.rusak_berat' => ['required', 'integer', 'min:0'],
            'detail_hapus' => ['nullable', 'string'],
        ]);

        DB::transaction(function () use ($validated, $monitoring) {
            $monitoring->update($validated);

            foreach ($validated['detail'] as $d) {
                $detailId = $d['id'] ?? null;
                $monitoring->detail()->updateOrCreate(
                    ['id' => $detailId],
                    [
                        'barang_id' => $d['barang_id'],
                        'baik' => $d['baik'],
                        'rusak_ringan' => $d['rusak_ringan'],
                        'rusak_berat' => $d['rusak_berat'],
                    ]
                );

                // Update Stok Total di Barang based on total monitored
                $totalSesuaiFisik = $d['baik'] + $d['rusak_ringan'] + $d['rusak_berat'];
                Barang::where('id', $d['barang_id'])->update(['stok_total' => $totalSesuaiFisik]);

                // Update Stok Tersedia di Gudang (Assuming single warehouse logic as requested)
                StokGudang::where('barang_id', $d['barang_id'])->update(['stok_tersedia' => $totalSesuaiFisik]);
            }

            if ($validated['detail_hapus']) {
                $ids = array_filter(explode(',', $validated['detail_hapus']));
                if (!empty($ids)) {
                    $monitoring->detail()->whereIn('id', $ids)->delete();
                }
            }
        });

        return redirect()->route('monitoring-barang.index')->with('status', 'Monitoring Barang berhasil diperbarui');
    }

    public function destroy($id)
    {
        $monitoring = MonitoringBarang::findOrFail($id);
        $monitoring->delete();
        return redirect()->route('monitoring-barang.index')->with('status', 'Monitoring Barang berhasil dihapus');
    }

    public function getDetail($id)
    {
        $monitoring = MonitoringBarang::with('detail.barang.satuan')->findOrFail($id);
        return response()->json([
            'success' => true,
            'data' => $monitoring
        ]);
    }
}
