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
use App\Http\Controllers\DashboardController;
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
    Route::resource('permintaan-barang', PermintaanBarangController::class);
    Route::resource('barang-masuk', BarangMasukController::class);
    Route::resource('barang-keluar', BarangKeluarController::class);
    Route::resource('pemeliharaan-barang', PemeliharaanBarangController::class);
});



require __DIR__.'/auth.php';
