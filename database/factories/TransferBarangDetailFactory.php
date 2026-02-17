<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\TransferBarangDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class TransferBarangDetailFactory extends Factory
{
    protected $model = TransferBarangDetail::class;

    public function definition(): array
    {
        $jmlKirim = $this->faker->numberBetween(1, 20);
        return [
            'barang_id' => Barang::inRandomOrder()->first()->id ?? 1,
            'jml_kirim' => $jmlKirim,
            'jml_diterima' => $this->faker->numberBetween(0, $jmlKirim), // Can be partial
            'kondisi' => $this->faker->randomElement(['baik', 'rusak']),
            'keterangan' => $this->faker->sentence,
        ];
    }
}
