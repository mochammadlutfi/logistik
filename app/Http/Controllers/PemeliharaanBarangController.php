<?php

namespace App\Http\Controllers;

use App\Models\PemeliharaanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\MonitoringBarang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use PDO;


class PemeliharaanBarangController extends Controller
{
    public function index(Request $request)
    {
        $items = PemeliharaanBarang::with(['monitoring', 'detail' => function($query){
            $query->with(['barang']);
        }])
        ->orderByDesc('created_at')->get();


        return view('pemeliharaan.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $barang = Barang::where('is_maintain', true)->orderBy('nama_barang')->get();
        $monitoring = MonitoringBarang::orderByDesc('tanggal')->get();
        return view('pemeliharaan.form', compact('isEdit', 'barang', 'monitoring'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'monitoring_id' => ['nullable', 'integer', 'exists:monitoring_barang,id'],
            'tanggal' => ['required'],
            'catatan' => ['nullable', 'string'],
            'biaya' => ['required', 'integer', 'min:0'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.rusak_ringan' => ['nullable', 'integer', 'min:0'],
            'detail.*.rusak_berat' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);

        $validator->after(function ($validator) use ($request) {
            if ($request->monitoring_id && is_array($request->detail)) {
                $monitoring = \App\Models\MonitoringBarang::with('detail')->find($request->monitoring_id);
                if ($monitoring) {
                    foreach ($request->detail as $index => $d) {
                        if (isset($d['barang_id'])) {
                            $monitoringDetail = $monitoring->detail->where('barang_id', $d['barang_id'])->first();
                            if ($monitoringDetail) {
                                $maxRg = $monitoringDetail->rusak_ringan;
                                $maxRb = $monitoringDetail->rusak_berat;
                                
                                $inputRg = $d['rusak_ringan'] ?? 0;
                                $inputRb = $d['rusak_berat'] ?? 0;

                                if ($inputRg > $maxRg) {
                                    $validator->errors()->add("detail.{$index}.rusak_ringan", "Maksimal {$maxRg} berdasarkan data monitoring.");
                                }
                                if ($inputRb > $maxRb) {
                                    $validator->errors()->add("detail.{$index}.rusak_berat", "Maksimal {$maxRb} berdasarkan data monitoring.");
                                }
                            }
                        }
                    }
                }
            }
        });

        $validated = $validator->validate();

        $maxId = PemeliharaanBarang::max('id') ?? 0;
        $validated['kode'] = 'MTN/' . date('Ym').'/' . str_pad($maxId + 1, 4, '0', STR_PAD_LEFT);
        $validated['petugas_id'] = auth()->user()->id;
        $validated['status'] = 'pending';
        $data = PemeliharaanBarang::create($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $data->detail()->create([
                'barang_id' => $d['barang_id'],
                'rusak_ringan' => $d['rusak_ringan'],
                'rusak_berat' => $d['rusak_berat'],
                'keterangan' => $d['keterangan'],
            ]);
        }
        return redirect()->route('pemeliharaan-barang.index')->with('status', 'Permintaan Barang berhasil dibuat');
    }

    public function show($id){
        $item = PemeliharaanBarang::with(['monitoring', 'detail' => function($q){
            return $q->with(['barang', 'barang.satuan']);
        }])->findOrFail($id);
        return view('pemeliharaan.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PemeliharaanBarang::with(['monitoring', 'detail' => function($q){
            $q->with(['barang', 'barang.satuan']);
        }])->findOrFail($id);
        $barang = Barang::where('is_maintain', true)->orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $monitoring = MonitoringBarang::orderByDesc('tanggal')->get();

        return view('pemeliharaan.form', compact('item', 'barang', 'suppliers', 'isEdit', 'monitoring'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PemeliharaanBarang::findOrFail($id);
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'monitoring_id' => ['nullable', 'integer', 'exists:monitoring_barang,id'],
            'tanggal' => ['required'],
            'alasan' => ['nullable'],
            'catatan' => ['nullable', 'string'],
            'detail.*.id' => ['nullable', 'integer', 'exists:pemeliharaan_barang_detail,id'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.rusak_ringan' => ['nullable', 'integer', 'min:0'],
            'detail.*.rusak_berat' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string'],
            'detail_hapus' => ['nullable', 'string'],
        ]);

        $validator->after(function ($validator) use ($request) {
            if ($request->monitoring_id && is_array($request->detail)) {
                $monitoring = \App\Models\MonitoringBarang::with('detail')->find($request->monitoring_id);
                if ($monitoring) {
                    foreach ($request->detail as $index => $d) {
                        if (isset($d['barang_id'])) {
                            $monitoringDetail = $monitoring->detail->where('barang_id', $d['barang_id'])->first();
                            if ($monitoringDetail) {
                                $maxRg = $monitoringDetail->rusak_ringan;
                                $maxRb = $monitoringDetail->rusak_berat;
                                
                                $inputRg = $d['rusak_ringan'] ?? 0;
                                $inputRb = $d['rusak_berat'] ?? 0;

                                if ($inputRg > $maxRg) {
                                    $validator->errors()->add("detail.{$index}.rusak_ringan", "Maksimal {$maxRg} berdasarkan data monitoring.");
                                }
                                if ($inputRb > $maxRb) {
                                    $validator->errors()->add("detail.{$index}.rusak_berat", "Maksimal {$maxRb} berdasarkan data monitoring.");
                                }
                            }
                        }
                    }
                }
            }
        });

        $validated = $validator->validate();

        $barang->update($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $barang->detail()->updateOrCreate([
                'id' => $d['id'],
            ],[
                'barang_id' => $d['barang_id'],
                'rusak_ringan' => $d['rusak_ringan'],
                'rusak_berat' => $d['rusak_berat'],
                'keterangan' => $d['keterangan'],
            ]);
        }
        // dd($validated['detail_hapus']);
        if($validated['detail_hapus']){
            $barang->detail()->whereIn('id', explode(',', $validated['detail_hapus']))->delete();
        }
        
        return redirect()->route('pemeliharaan-barang.index')->with('status', 'Barang berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PemeliharaanBarang::findOrFail($id);    
        $barang->delete();
        return redirect()->route('pemeliharaan-barang.index')->with('status', 'Barang berhasil dihapus');
    }

    public function status($id, Request $request)
    {
        $item = PemeliharaanBarang::findOrFail($id);
        $oldStatus = $item->status;
        $item->status = $request->status;

        if (in_array($request->status, ['disetujui', 'ditolak'])) {
            $item->tanggal_approval = now();
            $item->catatan_approval = $request->alasan;
            $item->approved_by = auth()->id();
        }

        $item->save();

        if ($request->status == 'selesai' && $oldStatus != 'selesai') {
            foreach ($item->detail as $detail) {
                $barangId = $detail->barang_id;
                $rusakRingan = $detail->rusak_ringan ?? 0;
                $rusakBerat = $detail->rusak_berat ?? 0;
                $totalDiperbaiki = $rusakRingan + $rusakBerat;

                if ($totalDiperbaiki > 0) {
                    $stokGudang = \App\Models\StokGudang::where('barang_id', $barangId)->first();
                    if ($stokGudang) {
                        $stokGudang->baik += $totalDiperbaiki;
                        $stokGudang->rusak_ringan = max(0, $stokGudang->rusak_ringan - $rusakRingan);
                        $stokGudang->rusak_berat = max(0, $stokGudang->rusak_berat - $rusakBerat);
                        $stokGudang->save();
                    }
                }
            }
        }

        return redirect()->route('pemeliharaan-barang.show', $id)->with('status', 'Status Pemeliharaan Barang berhasil diupdate');
    }
}