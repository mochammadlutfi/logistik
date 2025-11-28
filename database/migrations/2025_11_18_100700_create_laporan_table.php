<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('laporan', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('kode_laporan', 50)->unique();
            $table->enum('jenis_laporan', ['harian','mingguan','bulanan','tahunan','custom']);
            $table->string('judul_laporan', 200);
            $table->date('periode_awal');
            $table->date('periode_akhir');
            $table->longText('isi_laporan')->nullable();
            $table->string('file_laporan', 255)->nullable();
            $table->enum('status_laporan', ['draft','menunggu_verifikasi','diverifikasi','ditolak','final'])->default('draft');
            $table->foreignId('dibuat_oleh')->constrained('users')->restrictOnDelete();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();

            $table->index('kode_laporan', 'idx_kode');
            $table->index('jenis_laporan', 'idx_jenis');
            $table->index('status_laporan', 'idx_status');
            $table->index(['periode_awal', 'periode_akhir'], 'idx_periode');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('laporan');
    }
};