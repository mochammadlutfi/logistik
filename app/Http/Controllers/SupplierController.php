<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class SupplierController extends Controller
{
    public function index(Request $request)
    {
        $items = Supplier::orderByDesc('created_at')->get();
        return view('master.supplier', ['items' => $items]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'kode_supplier' => ['required', 'string', 'max:20', 'unique:suppliers,kode_supplier'],
            'nama_supplier' => ['required', 'string', 'max:150'],
            'alamat' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
            'email' => ['nullable', 'string', 'email', 'max:100'],
            'kontak_person' => ['nullable', 'string', 'max:100'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        if (!array_key_exists('is_active', $validated)) {
            $validated['is_active'] = true;
        }

        Supplier::create($validated);
        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil dibuat');
    }

    public function update(Request $request, Supplier $supplier)
    {
        $validated = $request->validate([
            'kode_supplier' => ['required', 'string', 'max:20', Rule::unique('suppliers', 'kode_supplier')->ignore($supplier->id)],
            'nama_supplier' => ['required', 'string', 'max:150'],
            'alamat' => ['nullable', 'string'],
            'no_telepon' => ['nullable', 'string', 'max:20'],
            'email' => ['nullable', 'string', 'email', 'max:100'],
            'kontak_person' => ['nullable', 'string', 'max:100'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        $supplier->update($validated);
        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil diperbarui');
    }

    public function destroy(Supplier $supplier)
    {
        $supplier->delete();
        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil dihapus');
    }
}