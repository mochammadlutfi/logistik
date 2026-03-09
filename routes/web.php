<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\KategoriBarangController;
use App\Http\Controllers\SatuanController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\PermintaanBarangController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\PemeliharaanBarangController;
use App\Http\Controllers\LaporanKerusakanController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\MonitoringBarangController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');
Route::get('/dashboard', [DashboardController::class, 'index'])->middleware(['auth', 'verified'])->name('dashboard');

// Clear cache and generate key routes
Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    echo 'Cache cleared successfully.';
})->name('clear.cache');

Route::get('/generate-key', function () {
    Artisan::call('key:generate');
    echo 'Application key generated successfully.';
})->name('generate.key');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('kategori', KategoriBarangController::class)->only(['index','store','update','destroy']);
    Route::resource('satuan', SatuanController::class)->only(['index','store','update','destroy']);
    Route::resource('supplier', SupplierController::class);
    Route::resource('barang', BarangController::class);
    Route::resource('user', UserController::class);
    Route::resource('permintaan-barang', PermintaanBarangController::class);
    Route::put('permintaan-barang/{id}/status', [PermintaanBarangController::class, 'status'])->name('permintaan-barang.status');
    Route::get('permintaan-barang/{id}/detail', [PermintaanBarangController::class, 'getDetail'])->name('permintaan-barang.detail');
    Route::get('barang-masuk/{id}/export-pdf', [BarangMasukController::class, 'exportPdf'])->name('barang-masuk.export-pdf');
    Route::resource('barang-masuk', BarangMasukController::class);
    Route::get('barang-keluar/{id}/export-pdf', [BarangKeluarController::class, 'exportPdf'])->name('barang-keluar.export-pdf');
    Route::get('barang/{barangId}/stok', [BarangKeluarController::class, 'getStokBarang'])->name('barang.stok');
    Route::resource('barang-keluar', BarangKeluarController::class);
    Route::get('monitoring-barang/{id}/detail', [MonitoringBarangController::class, 'getDetail'])->name('monitoring-barang.detail');
    Route::resource('monitoring-barang', MonitoringBarangController::class);
    Route::resource('pemeliharaan-barang', PemeliharaanBarangController::class);
    Route::put('pemeliharaan-barang/{id}/status', [PemeliharaanBarangController::class, 'status'])->name('pemeliharaan-barang.status');

    Route::resource('laporan-kerusakan', LaporanKerusakanController::class);
    Route::put('laporan-kerusakan/{id}/status', [LaporanKerusakanController::class, 'updateStatus'])->name('laporan-kerusakan.updateStatus');
    Route::get('laporan-kerusakan/{id}/pemeliharaan-detail', [LaporanKerusakanController::class, 'getPemeliharaanDetail'])->name('laporan-kerusakan.pemeliharaan-detail');

    // Laporan Routes
    Route::prefix('laporan')->name('laporan.')->group(function () {
        Route::get('/', [LaporanController::class, 'index'])->name('index');
        Route::get('/stok-barang', [LaporanController::class, 'stokBarang'])->name('stok-barang');
        Route::get('/barang-masuk', [LaporanController::class, 'barangMasuk'])->name('barang-masuk');
        Route::get('/barang-keluar', [LaporanController::class, 'barangKeluar'])->name('barang-keluar');
        Route::get('/permintaan-barang', [LaporanController::class, 'permintaanBarang'])->name('permintaan-barang');
        Route::get('/pemeliharaan-barang', [LaporanController::class, 'pemeliharaanBarang'])->name('pemeliharaan-barang');
        Route::get('/kerusakan-barang', [LaporanController::class, 'kerusakanBarang'])->name('kerusakan-barang');
    });
});



require __DIR__.'/auth.php';
