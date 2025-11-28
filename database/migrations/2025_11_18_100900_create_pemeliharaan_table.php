<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('pemeliharaan', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('kode_pemeliharaan', 50)->unique();
            $table->foreignId('barang_id')->nullable()->constrained('barang')->nullOnDelete();
            $table->enum('jenis_pemeliharaan', ['barang','sistem']);
            $table->text('deskripsi_pemeliharaan');
            $table->enum('status_pemeliharaan', ['baik','rusak','habis','diperbaiki'])->default('baik');
            $table->date('tanggal_pemeliharaan');
            $table->decimal('biaya_pemeliharaan', 15, 2)->default(0);
            $table->foreignId('petugas_id')->constrained('users')->restrictOnDelete();
            $table->text('catatan')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();

            $table->index('kode_pemeliharaan', 'idx_kode');
            $table->index('jenis_pemeliharaan', 'idx_jenis');
            $table->index('tanggal_pemeliharaan', 'idx_tanggal');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pemeliharaan');
    }
};