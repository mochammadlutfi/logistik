<?php

namespace App\Http\Controllers;

use App\Models\TransferBarang;
use App\Models\TransferBarangDetail;
use App\Models\Gudang;
use App\Models\Barang;
use App\Models\StokGudang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class TransferBarangController extends Controller
{
    public function index(Request $request)
    {
        $query = TransferBarang::with(['gudangAsal', 'gudangTujuan', 'user', 'penerima']);

        if ($request->has('search')) {
            $query->where('kode', 'like', '%' . $request->search . '%');
        }

        $items = $query->latest()->get(); 

        return view('transfer_barang.index', compact('items'));
    }

    public function create()
    {
        $gudang = Gudang::where('is_active', true)->get();
        // Ideally filter products by source warehouse in frontend via AJAX
        $barang = Barang::orderBy('nama_barang')->get();

        return view('transfer_barang.form', [
            'isEdit' => false,
            'gudang' => $gudang,
            'barang' => $barang,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'tanggal' => 'required|date',
            'gudang_asal_id' => 'required|exists:gudang,id',
            'gudang_tujuan_id' => 'required|exists:gudang,id|different:gudang_asal_id',
            'detail' => 'required|array|min:1',
            'detail.*.barang_id' => 'required|exists:barang,id',
            'detail.*.jml_kirim' => 'required|integer|min:1',
            'catatan' => 'nullable|string',
        ]);

        DB::transaction(function () use ($request) {
            $transfer = TransferBarang::create([
                'kode' => 'TRF-' . strtoupper(Str::random(10)),
                'tanggal' => $request->tanggal,
                'gudang_asal_id' => $request->gudang_asal_id,
                'gudang_tujuan_id' => $request->gudang_tujuan_id,
                'status' => 'draft',
                'user_id' => auth()->id(),
                'catatan' => $request->catatan,
            ]);

            foreach ($request->detail as $item) {
                TransferBarangDetail::create([
                    'transfer_id' => $transfer->id,
                    'barang_id' => $item['barang_id'],
                    'jml_kirim' => $item['jml_kirim'],
                    'kondisi' => 'baik',
                ]);
            }
        });

        return redirect()->route('transfer-barang.index')
            ->with('status', 'Transfer barang berhasil dibuat (Draft).');
    }

    public function show(TransferBarang $transferBarang)
    {
        $transferBarang->load(['gudangAsal', 'gudangTujuan', 'user', 'penerima', 'detail.barang']);
        
        return view('transfer_barang.show', [
            'item' => $transferBarang,
        ]);
    }

    public function updateStatus(Request $request, TransferBarang $transferBarang)
    {
        $request->validate([
            'status' => 'required|in:dalam_pengiriman,diterima,dibatalkan',
        ]);

        try {
            DB::transaction(function () use ($request, $transferBarang) {
                $oldStatus = $transferBarang->status;
                $newStatus = $request->status;
                
                // Allow proceeding if status is logically next
                
                if ($newStatus === 'dalam_pengiriman' && $oldStatus === 'draft') {
                    // Reduce stock from source warehouse
                    foreach ($transferBarang->detail as $detail) {
                        $stokAsal = StokGudang::where('gudang_id', $transferBarang->gudang_asal_id)
                            ->where('barang_id', $detail->barang_id)
                            ->first();
                        
                        // Check stock
                        if (!$stokAsal || $stokAsal->stok_tersedia < $detail->jml_kirim) {
                             $barangName = $detail->barang->nama_barang;
                             // Throw exception to be caught
                             throw new \Exception("Stok tidak cukup untuk barang $barangName di gudang asal.");
                        }
    
                        $stokAsal->decrement('stok_tersedia', $detail->jml_kirim);
                    }
    
                    $transferBarang->update(['status' => 'dalam_pengiriman']);
    
                } elseif ($newStatus === 'diterima' && $oldStatus === 'dalam_pengiriman') {
                    // Add stock to destination warehouse
                     foreach ($transferBarang->detail as $detail) {
                        $qty = $detail->jml_diterima ?? $detail->jml_kirim; 
    
                        $stokTujuan = StokGudang::firstOrCreate(
                            ['gudang_id' => $transferBarang->gudang_tujuan_id, 'barang_id' => $detail->barang_id],
                            ['stok_tersedia' => 0]
                        );
    
                        $stokTujuan->increment('stok_tersedia', $qty);
                        
                        // Update detail jml_diterima if not set
                        if (!$detail->jml_diterima) {
                            $detail->update(['jml_diterima' => $qty]);
                        }
                     }
                    
                    $transferBarang->update([
                        'status' => 'diterima',
                        'diterima_oleh' => auth()->id(),
                        'tanggal_diterima' => now(),
                    ]);
                } elseif ($newStatus === 'dibatalkan' && $oldStatus === 'draft') {
                     $transferBarang->update(['status' => 'dibatalkan']);
                }
            });
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }

        return back()->with('status', 'Status transfer berhasil diperbarui.');
    }
}
