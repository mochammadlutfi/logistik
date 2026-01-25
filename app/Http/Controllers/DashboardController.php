<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\PermintaanBarang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $barang = Barang::count();
        $stok = Barang::sum('stok_tersedia');
        $permintaan = PermintaanBarang::where('status', 'diajukan')->count();
        $stok_menipis = Barang::where('stok_tersedia', '<', 10)->count();

        return view('dashboard', compact('barang', 'stok', 'permintaan', 'stok_menipis'));
    }
}