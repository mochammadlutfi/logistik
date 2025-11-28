<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
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
        $suppliers = Supplier::orderBy('nama_supplier')->get();
        $barang = Barang::orderBy('nama_barang')->get();
        return view('keluar.form', compact('isEdit', 'suppliers', 'barang'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
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
        $data = PencatatanBarang::create($validated);

        foreach($validated['detail'] as $d){
            // dd($d);
            $data->detail()->create([
                'barang_id' => $d['barang_id'],
                'jml' => $d['jml'],
                'keterangan' => $d['keterangan'],
            ]);
        }
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

        return view('keluar.form', compact('item', 'barang', 'suppliers', 'isEdit'));
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
}