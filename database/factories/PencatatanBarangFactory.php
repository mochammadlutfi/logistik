<?php

namespace Database\Factories;

use App\Models\Gudang;
use App\Models\Supplier;
use App\Models\User;
use App\Models\PencatatanBarang;
use Illuminate\Database\Eloquent\Factories\Factory;

class PencatatanBarangFactory extends Factory
{
    protected $model = PencatatanBarang::class;

    public function definition(): array
    {
        $jenis = $this->faker->randomElement(['barang_masuk', 'barang_keluar']);
        return [
            'kode' => ($jenis == 'barang_masuk' ? 'IN/' : 'OUT/') . $this->faker->unique()->numerify('Ymd-####'),
            'gudang_id' => Gudang::inRandomOrder()->first()->id ?? 1,
            'jenis' => $jenis,
            'tanggal' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'supplier_id' => $jenis == 'barang_masuk' ? (Supplier::inRandomOrder()->first()->id ?? 1) : null,
            'sumber_barang' => $jenis == 'barang_masuk' ? $this->faker->company : null,
            'tujuan_barang' => $jenis == 'barang_keluar' ? $this->faker->company : null,
            'no_dokumen' => $this->faker->bothify('DOC-####'),
            'user_id' => User::inRandomOrder()->first()->id ?? 1,
            'catatan' => $this->faker->sentence,
            'permintaan_id' => null, // Explicitly set to null to avoid constraint error if column exists but has no default
        ];
    }
}
