<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\PencatatanBarangDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class PencatatanBarangDetailFactory extends Factory
{
    protected $model = PencatatanBarangDetail::class;

    public function definition(): array
    {
        return [
            'barang_id' => Barang::inRandomOrder()->first()->id ?? 1,
            'jml' => $this->faker->numberBetween(1, 50),
            'kondisi' => $this->faker->randomElement(['baik', 'rusak_ringan', 'rusak_berat']),
        ];
    }
}
