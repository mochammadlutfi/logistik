<?php

namespace App\Http\Controllers;

use App\Models\PermintaanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\Gudang; // Added this line
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use PDO;

class PermintaanBarangController extends Controller
{
    public function index(Request $request)
    {
        $items = PermintaanBarang::with(['detail' => function($query){
            $query->with(['barang']);
        }])
        ->orderByDesc('created_at')->get();


        return view('permintaan.index', compact('items'));
    }

    public function create()
    {
        $isEdit = false;
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $barang = Barang::orderBy('nama_barang')->get();
        $gudang = Gudang::where('is_active', true)->orderBy('nama_gudang')->get();
        return view('permintaan.form', compact('isEdit', 'suppliers', 'barang', 'gudang'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'tanggal' => ['required'],
            'alasan' => ['nullable'],
            'catatan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);
        
        $validated['kode'] = 'REQ/' . date('Ym').'/' .str_pad(PermintaanBarang::count() + 1, 4, '0', STR_PAD_LEFT);
        $validated['user_id']= auth()->user()->id;
        $data = PermintaanBarang::create($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $data->detail()->create([
                'barang_id' => $d['barang_id'],
                'jml' => $d['jml'],
                'keterangan' => $d['keterangan'],
            ]);
        }
        return redirect()->route('permintaan-barang.show', $data->id)->with('status', 'Permintaan Barang berhasil dibuat');
    }

    public function show($id){
        $item = PermintaanBarang::with(['detail' => function($q){
            return $q->with(['barang']);
        }])->findOrFail($id);
        return view('permintaan.show', compact('item'));
    }



    public function edit($id){
        $isEdit = true;
        $item = PermintaanBarang::with(['detail' => function($q){
            $q->with(['barang']);
        }])->findOrFail($id);
        $barang = Barang::orderBy('nama_barang')->get();
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $gudang = Gudang::where('is_active', true)->orderBy('nama_gudang')->get();

        return view('permintaan.form', compact('item', 'barang', 'suppliers', 'isEdit', 'gudang'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $barang = PermintaanBarang::findOrFail($id);
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
        
        return redirect()->route('permintaan-barang.show', $id)->with('status', 'Barang berhasil diperbarui');
    }

    public function destroy($id)
    {
        $barang = PermintaanBarang::findOrFail($id);    
        $barang->delete();
        return redirect()->route('permintaan-barang.index')->with('status', 'Barang berhasil dihapus');
    }


    public function status($id, Request $request)
    {
        $barang = PermintaanBarang::findOrFail($id);
        $barang->status = $request->status;
        $barang->tanggal_approval = now();
        $barang->catatan_approval = $request->alasan;
        $barang->save();
        return redirect()->route('permintaan-barang.show', $id)->with('status', 'Status Permintaan Barang berhasil diupdate');
    }

    public function getDetail($id)
    {
        $permintaan = PermintaanBarang::with(['detail' => function($q) {
            $q->with(['barang' => function($q) {
                $q->with('satuan');
            }]);
        }])->findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $permintaan
        ]);
    }
}