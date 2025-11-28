<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('pencatatan_barang', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('kode_transaksi', 50)->unique();
            $table->foreignId('barang_id')->constrained('barang')->restrictOnDelete();
            $table->enum('jenis_transaksi', ['masuk','keluar']);
            $table->integer('jumlah');
            $table->date('tanggal_transaksi');
            $table->foreignId('supplier_id')->nullable()->constrained('suppliers')->nullOnDelete();
            $table->string('sumber_barang', 200)->nullable();
            $table->string('tujuan_barang', 200)->nullable();
            $table->string('no_dokumen', 100)->nullable();
            $table->enum('kondisi_barang', ['baik','rusak','diperbaiki'])->default('baik');
            $table->foreignId('user_id')->constrained('users')->restrictOnDelete();
            $table->text('catatan')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();

            $table->index('kode_transaksi', 'idx_kode');
            $table->index('tanggal_transaksi', 'idx_tanggal');
            $table->index('jenis_transaksi', 'idx_jenis');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pencatatan_barang');
    }
};