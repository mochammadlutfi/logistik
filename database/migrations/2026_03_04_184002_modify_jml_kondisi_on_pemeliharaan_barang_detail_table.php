<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('pemeliharaan_barang_detail', function (Blueprint $table) {
            $table->dropColumn(['jml']);
            $table->integer('rusak_ringan')->default(0)->after('barang_id');
            $table->integer('rusak_berat')->default(0)->after('rusak_ringan');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pemeliharaan_barang_detail', function (Blueprint $table) {
            $table->dropColumn(['rusak_ringan', 'rusak_berat']);
            $table->integer('jml')->nullable();
        });
    }
};
