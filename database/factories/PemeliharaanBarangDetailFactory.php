<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\PemeliharaanBarangDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class PemeliharaanBarangDetailFactory extends Factory
{
    protected $model = PemeliharaanBarangDetail::class;

    public function definition(): array
    {
        return [
            'barang_id' => Barang::inRandomOrder()->first()->id ?? 1,
            'jml' => $this->faker->numberBetween(1, 10),
            'keterangan' => $this->faker->sentence,
        ];
    }
}
