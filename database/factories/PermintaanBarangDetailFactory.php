<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\PermintaanBarangDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class PermintaanBarangDetailFactory extends Factory
{
    protected $model = PermintaanBarangDetail::class;

    public function definition(): array
    {
        $jml = $this->faker->numberBetween(1, 20);
        return [
            'barang_id' => Barang::inRandomOrder()->first()->id ?? 1,
            'jumlah_diminta' => $jml,
            'jumlah_disetujui' => $this->faker->numberBetween(0, $jml), // Usually same or less
            'catatan' => $this->faker->sentence,
        ];
    }
}
