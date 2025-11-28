<?php

namespace App\Http\Controllers;

use App\Models\Satuan;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class SatuanController extends Controller
{
    public function index(Request $request)
    {
        $items = Satuan::orderByDesc('created_at')->get();
        return view('master.satuan', ['items' => $items]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_satuan' => ['required', 'string', 'max:50', 'unique:satuan,nama_satuan'],
            'keterangan' => ['nullable', 'string'],
        ]);

        Satuan::create($validated);
        return redirect()->route('satuan.index')->with('status', 'Satuan berhasil dibuat');
    }

    public function update(Request $request, Satuan $satuan)
    {
        $validated = $request->validate([
            'nama_satuan' => ['required', 'string', 'max:50', Rule::unique('satuan', 'nama_satuan')->ignore($satuan->id)],
            'keterangan' => ['nullable', 'string'],
        ]);

        $satuan->update($validated);
        return redirect()->route('satuan.index')->with('status', 'Satuan berhasil diperbarui');
    }

    public function destroy(Satuan $satuan)
    {
        $satuan->delete();
        return redirect()->route('satuan.index')->with('status', 'Satuan berhasil dihapus');
    }
}