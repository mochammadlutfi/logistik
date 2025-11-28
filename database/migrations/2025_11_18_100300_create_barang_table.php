<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('barang', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('kode_barang', 50)->unique();
            $table->string('nama_barang', 200);
            $table->foreignId('kategori_id')->constrained('kategori_barang')->restrictOnDelete();
            $table->foreignId('satuan_id')->constrained('satuan')->restrictOnDelete();
            $table->integer('stok_minimum')->default(0);
            $table->integer('stok_maksimum')->default(0);
            $table->integer('stok_tersedia')->default(0);
            $table->decimal('harga_satuan', 15, 2)->default(0);
            $table->string('lokasi_penyimpanan', 100)->nullable();
            $table->enum('kondisi_fisik', ['baik','rusak','habis','diperbaiki'])->default('baik');
            $table->string('foto_barang', 255)->nullable();
            $table->text('keterangan')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
            $table->softDeletes();

            $table->index('kode_barang', 'idx_kode');
            $table->index('nama_barang', 'idx_nama');
            $table->index('kategori_id', 'idx_kategori');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('barang');
    }
};