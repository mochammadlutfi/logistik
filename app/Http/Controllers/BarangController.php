<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\KategoriBarang;
use App\Models\Satuan;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BarangController extends Controller
{
    public function index(Request $request)
    {
        $items = Barang::with(['kategori', 'satuan'])->orderByDesc('created_at')->get();
        $kategoris = KategoriBarang::orderBy('nama_kategori')->get();
        $satuans = Satuan::orderBy('nama_satuan')->get();
        return view('master.barang.index', compact('items', 'kategoris', 'satuans'));
    }

    public function create()
    {
        $isEdit = false;
        $kategoris = KategoriBarang::orderBy('nama_kategori')->get();
        $satuans = Satuan::orderBy('nama_satuan')->get();

        return view('master.barang.form', compact('kategoris', 'satuans', 'isEdit'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'kode_barang' => ['required', 'string', 'max:50', 'unique:barang,kode_barang'],
            'nama_barang' => ['required', 'string', 'max:200'],
            'kategori_id' => ['required', 'integer', 'exists:kategori_barang,id'],
            'satuan_id' => ['required', 'integer', 'exists:satuan,id'],
            'stok_minimum' => ['nullable', 'integer', 'min:0'],
            'stok_maksimum' => ['nullable', 'integer', 'min:0'],
            'stok_total' => ['nullable', 'integer', 'min:0'],
            'harga_satuan' => ['nullable', 'numeric', 'min:0'],
            'lokasi_penyimpanan' => ['nullable', 'string', 'max:100'],
            'kondisi_fisik' => ['required', Rule::in(['baik','rusak','habis','diperbaiki'])],
            'foto_barang' => ['nullable', 'string', 'max:255'],
            'keterangan' => ['nullable', 'string'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        if (!array_key_exists('stok_minimum', $validated)) { $validated['stok_minimum'] = 0; }
        if (!array_key_exists('stok_maksimum', $validated)) { $validated['stok_maksimum'] = 0; }
        if (!array_key_exists('stok_total', $validated)) { $validated['stok_total'] = 0; }
        if (!array_key_exists('harga_satuan', $validated)) { $validated['harga_satuan'] = 0; }
        if (!array_key_exists('is_active', $validated)) { $validated['is_active'] = true; }

        Barang::create($validated);
        return redirect()->route('barang.index')->with('status', 'Barang berhasil dibuat');
    }

    public function show($id){
        $item = Barang::with(['kategori', 'satuan', 'gudang'])->findOrFail($id);
        // dd($item->toArray());
        return view('master.barang.show', compact('item'));
    }

    public function edit($id){
        $isEdit = true;
        $item = Barang::with(['kategori', 'satuan'])->findOrFail($id);
        $kategoris = KategoriBarang::orderBy('nama_kategori')->get();
        $satuans = Satuan::orderBy('nama_satuan')->get();
        return view('master.barang.form', compact('item', 'kategoris', 'satuans', 'isEdit'));
    }

    public function update(Request $request, $id)
    {
        $barang = Barang::findOrFail($id);
        $validated = $request->validate([
            'kode_barang' => ['required', 'string', 'max:50', Rule::unique('barang', 'kode_barang')->ignore($barang->id)],
            'nama_barang' => ['required', 'string', 'max:200'],
            'kategori_id' => ['required', 'integer', 'exists:kategori_barang,id'],
            'satuan_id' => ['required', 'integer', 'exists:satuan,id'],
            'stok_minimum' => ['nullable', 'integer', 'min:0'],
            'stok_maksimum' => ['nullable', 'integer', 'min:0'],
            'stok_total' => ['nullable', 'integer', 'min:0'],
            'harga_satuan' => ['nullable', 'numeric', 'min:0'],
            'lokasi_penyimpanan' => ['nullable', 'string', 'max:100'],
            'kondisi_fisik' => ['required', Rule::in(['baik','rusak','habis','diperbaiki'])],
            'foto_barang' => ['nullable', 'string', 'max:255'],
            'keterangan' => ['nullable', 'string'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        $barang->update($validated);
        return redirect()->route('barang.index')->with('status', 'Barang berhasil diperbarui');
    }

    public function destroy(Barang $barang)
    {
        $barang->delete();
        return redirect()->route('barang.index')->with('status', 'Barang berhasil dihapus');
    }
}