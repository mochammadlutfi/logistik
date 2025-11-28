<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('permintaan_barang', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('kode_permintaan', 50)->unique();
            $table->foreignId('user_id')->constrained('users')->restrictOnDelete();
            $table->date('tanggal_permintaan');
            $table->text('alasan_permintaan');
            $table->enum('status_permintaan', ['diajukan','menunggu_persetujuan','disetujui','ditolak','selesai'])->default('diajukan');
            $table->foreignId('approved_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('tanggal_approval')->nullable();
            $table->text('catatan_approval')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();

            $table->index('kode_permintaan', 'idx_kode');
            $table->index('status_permintaan', 'idx_status');
            $table->index('tanggal_permintaan', 'idx_tanggal');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('permintaan_barang');
    }
};