<?php

namespace App\Http\Controllers;

use App\Models\KategoriBarang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class KategoriBarangController extends Controller
{
    public function index(Request $request)
    {
        $q = (string) $request->query('q');
        $query = KategoriBarang::query();
        if ($q !== '') {
            $query->where(function ($builder) use ($q) {
                $builder->where('kode_kategori', 'like', "%$q%")
                    ->orWhere('nama_kategori', 'like', "%$q%");
            });
        }
        $kategoris = $query->orderByDesc('created_at')->get();
        return view('master.kategori', compact('kategoris', 'q'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'kode_kategori' => ['required', 'string', 'max:20', 'unique:kategori_barang,kode_kategori'],
            'nama_kategori' => ['required', 'string', 'max:100'],
            'keterangan' => ['nullable', 'string'],
        ]);

        KategoriBarang::create($validated);

        return redirect()->route('kategori.index')->with('status', 'Kategori berhasil dibuat');
    }

    public function update(Request $request, KategoriBarang $kategori)
    {
        $validated = $request->validate([
            'kode_kategori' => ['required', 'string', 'max:20', Rule::unique('kategori_barang', 'kode_kategori')->ignore($kategori->id)],
            'nama_kategori' => ['required', 'string', 'max:100'],
            'keterangan' => ['nullable', 'string'],
        ]);

        $kategori->update($validated);

        return redirect()->route('kategori.index')->with('status', 'Kategori berhasil diperbarui');
    }

    public function destroy(KategoriBarang $kategori)
    {
        $kategori->delete();
        return redirect()->route('kategori.index')->with('status', 'Kategori berhasil dihapus');
    }
}