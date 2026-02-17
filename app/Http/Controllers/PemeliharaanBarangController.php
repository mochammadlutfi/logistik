<?php

namespace App\Http\Controllers;

use App\Models\PemeliharaanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\Gudang; // Added this line
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use PDO;


class PemeliharaanBarangController extends Controller
{
    public function index(Request $request)
    {
        $items = PemeliharaanBarang::with(['gudang', 'detail' => function($query){
            $query->with(['barang']);
        }])
        ->orderByDesc('created_at')->get();


        return view('pemeliharaan.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $barang = Barang::orderBy('nama_barang')->get();
        $gudang = Gudang::orderBy('nama_gudang')->get(); 
        return view('pemeliharaan.form', compact('isEdit', 'barang', 'gudang'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'tanggal' => ['required'],
            'gudang_id' => ['required', 'exists:gudang,id'],
            'catatan' => ['nullable', 'string'],
            'biaya' => ['required', 'integer', 'min:0'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);
        
        $validated['kode'] = 'MTN/' . date('Ym').'/' .str_pad(PemeliharaanBarang::count() + 1, 4, '0', STR_PAD_LEFT);
        $validated['petugas_id'] = auth()->user()->id;
        $validated['status'] = 'pending';
        $data = PemeliharaanBarang::create($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $data->detail()->create([
                'barang_id' => $d['barang_id'],
                'jml' => $d['jml'],
                'keterangan' => $d['keterangan'],
            ]);
        }
        return redirect()->route('pemeliharaan-barang.index')->with('status', 'Permintaan Barang berhasil dibuat');
    }

    public function show($id){
        $item = PemeliharaanBarang::with(['detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        return view('pemeliharaan.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = PemeliharaanBarang::with(['detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $gudang = Gudang::where('is_active', true)->orderBy('nama_gudang')->get();

        return view('pemeliharaan.form', compact('item', 'barang', 'suppliers', 'isEdit', 'gudang'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PemeliharaanBarang::findOrFail($id);
        $validated = $request->validate([
            'tanggal' => ['required'],
            'alasan' => ['nullable'],
            'catatan' => ['nullable', 'string'],
            'detail.*.id' => ['nullable', 'integer', 'exists:permintaan_barang_detail,id'],
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
        $item->status = $request->status;

        if (in_array($request->status, ['disetujui', 'ditolak'])) {
            $item->tanggal_approval = now();
            $item->catatan_approval = $request->alasan;
            $item->approved_by = auth()->id();
        }

        $item->save();
        return redirect()->route('pemeliharaan-barang.show', $id)->with('status', 'Status Pemeliharaan Barang berhasil diupdate');
    }
}