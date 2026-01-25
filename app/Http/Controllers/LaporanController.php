<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\PencatatanBarang;
use App\Models\PermintaanBarang;
use App\Models\PemeliharaanBarang;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\StokBarangExport;
use App\Exports\BarangMasukExport;
use App\Exports\BarangKeluarExport;
use App\Exports\PermintaanBarangExport;
use App\Exports\PemeliharaanBarangExport;

class LaporanController extends Controller
{
    public function index()
    {
        return view('laporan.index');
    }

    // Laporan Stok Barang
    public function stokBarang(Request $request)
    {
        $data = Barang::with(['kategori', 'satuan'])
            ->when($request->kategori_id, fn($q) => $q->where('kategori_id', $request->kategori_id))
            ->orderBy('nama_barang')
            ->get();

        if ($request->format == 'pdf') {
            $pdf = Pdf::loadView('laporan.pdf.stok-barang', compact('data'));
            return $pdf->download('laporan-stok-barang-' . date('Y-m-d') . '.pdf');
        }

        return Excel::download(new StokBarangExport($data), 'laporan-stok-barang-' . date('Y-m-d') . '.xlsx');
    }

    // Laporan Barang Masuk
    public function barangMasuk(Request $request)
    {
        $request->validate([
            'tanggal_awal' => 'required|date',
            'tanggal_akhir' => 'required|date|after_or_equal:tanggal_awal',
        ]);

        $data = PencatatanBarang::with(['detail.barang', 'supplier', 'user'])
            ->where('jenis', 'masuk')
            ->whereBetween('tanggal', [$request->tanggal_awal, $request->tanggal_akhir])
            ->orderBy('tanggal', 'desc')
            ->get();

        $periode = [
            'awal' => $request->tanggal_awal,
            'akhir' => $request->tanggal_akhir
        ];

        if ($request->format == 'pdf') {
            $pdf = Pdf::loadView('laporan.pdf.barang-masuk', compact('data', 'periode'));
            return $pdf->download('laporan-barang-masuk-' . date('Y-m-d') . '.pdf');
        }

        return Excel::download(new BarangMasukExport($data, $periode), 'laporan-barang-masuk-' . date('Y-m-d') . '.xlsx');
    }

    // Laporan Barang Keluar
    public function barangKeluar(Request $request)
    {
        $request->validate([
            'tanggal_awal' => 'required|date',
            'tanggal_akhir' => 'required|date|after_or_equal:tanggal_awal',
        ]);

        $data = PencatatanBarang::with(['detail.barang', 'user', 'permintaan'])
            ->where('jenis', 'keluar')
            ->whereBetween('tanggal', [$request->tanggal_awal, $request->tanggal_akhir])
            ->orderBy('tanggal', 'desc')
            ->get();

        $periode = [
            'awal' => $request->tanggal_awal,
            'akhir' => $request->tanggal_akhir
        ];

        if ($request->format == 'pdf') {
            $pdf = Pdf::loadView('laporan.pdf.barang-keluar', compact('data', 'periode'));
            return $pdf->download('laporan-barang-keluar-' . date('Y-m-d') . '.pdf');
        }

        return Excel::download(new BarangKeluarExport($data, $periode), 'laporan-barang-keluar-' . date('Y-m-d') . '.xlsx');
    }

    // Laporan Permintaan Barang
    public function permintaanBarang(Request $request)
    {
        $request->validate([
            'tanggal_awal' => 'required|date',
            'tanggal_akhir' => 'required|date|after_or_equal:tanggal_awal',
        ]);

        $data = PermintaanBarang::with(['detail.barang', 'user'])
            ->whereBetween('tanggal', [$request->tanggal_awal, $request->tanggal_akhir])
            ->when($request->status, fn($q) => $q->where('status', $request->status))
            ->orderBy('tanggal', 'desc')
            ->get();

        $periode = [
            'awal' => $request->tanggal_awal,
            'akhir' => $request->tanggal_akhir
        ];

        if ($request->format == 'pdf') {
            $pdf = Pdf::loadView('laporan.pdf.permintaan-barang', compact('data', 'periode'));
            return $pdf->download('laporan-permintaan-barang-' . date('Y-m-d') . '.pdf');
        }

        return Excel::download(new PermintaanBarangExport($data, $periode), 'laporan-permintaan-barang-' . date('Y-m-d') . '.xlsx');
    }

    // Laporan Pemeliharaan Barang
    public function pemeliharaanBarang(Request $request)
    {
        $request->validate([
            'tanggal_awal' => 'required|date',
            'tanggal_akhir' => 'required|date|after_or_equal:tanggal_awal',
        ]);

        $data = PemeliharaanBarang::with(['detail.barang', 'petugas'])
            ->whereBetween('tanggal', [$request->tanggal_awal, $request->tanggal_akhir])
            ->orderBy('tanggal', 'desc')
            ->get();

        $periode = [
            'awal' => $request->tanggal_awal,
            'akhir' => $request->tanggal_akhir
        ];

        if ($request->format == 'pdf') {
            $pdf = Pdf::loadView('laporan.pdf.pemeliharaan-barang', compact('data', 'periode'));
            return $pdf->download('laporan-pemeliharaan-barang-' . date('Y-m-d') . '.pdf');
        }

        return Excel::download(new PemeliharaanBarangExport($data, $periode), 'laporan-pemeliharaan-barang-' . date('Y-m-d') . '.xlsx');
    }
}
