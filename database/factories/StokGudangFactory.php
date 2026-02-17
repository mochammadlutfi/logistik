<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\Gudang;
use App\Models\StokGudang;
use Illuminate\Database\Eloquent\Factories\Factory;

class StokGudangFactory extends Factory
{
    protected $model = StokGudang::class;

    public function definition(): array
    {
        // Try to find a combination that doesn't exist, or just return random data 
        // and let the seeder handle the unique constraint check via logic
        return [
            'gudang_id' => Gudang::inRandomOrder()->first()->id ?? 1,
            'barang_id' => Barang::inRandomOrder()->first()->id ?? 1,
            'stok_tersedia' => $this->faker->numberBetween(0, 100),
            'stok_minimum' => $this->faker->numberBetween(5, 10),
            'stok_maksimum' => $this->faker->numberBetween(100, 500),
            'lokasi_rak' => $this->faker->bothify('RK-##-##'),
        ];
    }
}
