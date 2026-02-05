<?php

namespace App\Http\Controllers;

use App\Models\PencatatanBarang;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\Gudang; // Added this line
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
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
        $query = Gudang::where('is_active', true)->orderBy('nama_gudang');
        
        if (in_array($user->role, ['Staf Gudang Logistik', 'Gudang Logistik'])) {
            $query->where('id', $user->gudang_id);
        }
        
        $gudang = $query->get();

        return view('masuk.form', compact('isEdit', 'suppliers', 'barang', 'gudang'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'tanggal' => ['required'],
            'gudang_id' => ['required', 'exists:gudang,id'],
            'supplier_id' => ['required', 'integer', 'exists:suppliers,id'],
            'sumber_barang' => ['nullable'],
            'tujuan_barang' => ['nullable'],
            'stok_tersedia' => ['nullable', 'integer', 'min:0'],
            'catatan' => ['nullable', 'string'],
            'detail.*.barang_id' => ['required', 'integer', 'exists:barang,id'],
            'detail.*.jml' => ['nullable', 'integer', 'min:0'],
            'detail.*.keterangan' => ['nullable', 'string']
        ]);
        
        $validated['kode'] = 'WH-IN/' . date('Ym').'/' .str_pad(PencatatanBarang::where('jenis', 'masuk')->count() + 1, 4, '0', STR_PAD_LEFT);
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
                    ['gudang_id' => $validated['gudang_id'], 'barang_id' => $d['barang_id']],
                    ['stok_tersedia' => 0]
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
        $query = Gudang::where('is_active', true)->orderBy('nama_gudang');
        
        if (in_array($user->role, ['Staf Gudang Logistik', 'Gudang Logistik'])) {
            $query->where('id', $user->gudang_id);
        }
        
        $gudang = $query->get();

        return view('masuk.form', compact('item', 'barang', 'suppliers', 'isEdit', 'gudang'));
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
}