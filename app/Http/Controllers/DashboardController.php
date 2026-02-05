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
        $stok = Barang::sum('stok_total');
        $permintaan = PermintaanBarang::where('status', 'diajukan')->count();
        $stok_menipis_count = Barang::where('stok_total', '<', 10)->count();

        // Dynamic Lists
        $low_stock_items = Barang::where('stok_total', '<', 10)
                                ->orderBy('stok_total', 'asc')
                                ->limit(5)
                                ->get();

        $recent_requests = PermintaanBarang::with('pemohon')
                                ->orderBy('created_at', 'desc')
                                ->limit(5)
                                ->get();

        return view('dashboard', compact('barang', 'stok', 'permintaan', 'stok_menipis_count', 'low_stock_items', 'recent_requests'));
    }
}