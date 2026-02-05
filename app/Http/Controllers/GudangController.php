<?php

namespace App\Http\Controllers;

use App\Models\Gudang;
use Illuminate\Http\Request;

class GudangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Gudang::query();

        if ($request->has('search')) {
            $query->where('nama_gudang', 'like', '%' . $request->search . '%')
                  ->orWhere('kode_gudang', 'like', '%' . $request->search . '%');
        }

        $items = $query->latest()->get(); // Changed to get() to match other controllers or paginate if needed but Blade usually handles it differently manually or with links

        return view('master.gudang.index', compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     */
    // Create method removed as we use modal

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'kode_gudang' => 'required|unique:gudang,kode_gudang|max:20',
            'nama_gudang' => 'required|max:100',
            'penanggung_jawab' => 'nullable|max:100',
            'is_active' => 'boolean',
        ]);

        if (!$request->has('is_active')) {
            $request->merge(['is_active' => 0]);
        }
        
        // Handle checkbox default often sending nothing if unchecked
        // But better:
        $data = $request->all();
        if(!isset($data['is_active'])) $data['is_active'] = 0;

        Gudang::create($data);

        return redirect()->route('gudang.index')
            ->with('status', 'Gudang berhasil ditambahkan.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    // Edit method removed as we use modal populating from data attributes

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Gudang $gudang)
    {
        $request->validate([
            'kode_gudang' => 'required|max:20|unique:gudang,kode_gudang,' . $gudang->id,
            'nama_gudang' => 'required|max:100',
            'penanggung_jawab' => 'nullable|max:100',
            'is_active' => 'boolean',
        ]);

        $data = $request->all();
        if(!isset($data['is_active'])) $data['is_active'] = 0;

        $gudang->update($data);

        return redirect()->route('gudang.index')
            ->with('status', 'Gudang berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Gudang $gudang)
    {
        $gudang->delete();

        return redirect()->route('gudang.index')
            ->with('status', 'Gudang berhasil dihapus.');
    }
}
