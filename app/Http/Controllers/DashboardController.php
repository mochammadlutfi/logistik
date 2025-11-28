<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $barang = Barang::count();
        $stok = Barang::sum('stok_tersedia');
        return view('dashboard', compact('barang', 'stok'));
    }
}