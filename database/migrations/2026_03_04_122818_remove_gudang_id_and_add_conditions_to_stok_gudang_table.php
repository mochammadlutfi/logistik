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
        Schema::disableForeignKeyConstraints();

        $tables = [
            'pemeliharaan_barang' => 'pemeliharaan_barang_ibfk_gudang',
            'pencatatan_barang' => 'pencatatan_barang_ibfk_gudang',
            'users' => 'users_ibfk_gudang',
            'stok_gudang' => 'stok_gudang_ibfk_1'
        ];

        foreach ($tables as $t => $fk) {
            try { \Illuminate\Support\Facades\DB::statement("ALTER TABLE {$t} DROP FOREIGN KEY {$fk}"); } catch (\Exception $e) {}
            if ($t === 'stok_gudang') {
                try { \Illuminate\Support\Facades\DB::statement("ALTER TABLE stok_gudang DROP INDEX unique_gudang_barang"); } catch (\Exception $e) {}
            }
            if (Schema::hasColumn($t, 'gudang_id')) {
                Schema::table($t, function (Blueprint $table) {
                    $table->dropColumn('gudang_id');
                });
            }
        }
        if (!Schema::hasColumn('stok_gudang', 'baik')) {
            Schema::table('stok_gudang', function (Blueprint $table) {
                $table->integer('baik')->default(0)->after('stok_tersedia');
                $table->integer('rusak_ringan')->default(0)->after('baik');
                $table->integer('rusak_berat')->default(0)->after('rusak_ringan');
            });
        }

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // ...
    }
};
