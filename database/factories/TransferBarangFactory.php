<?php

namespace Database\Factories;

use App\Models\Gudang;
use App\Models\User;
use App\Models\TransferBarang;
use Illuminate\Database\Eloquent\Factories\Factory;

class TransferBarangFactory extends Factory
{
    protected $model = TransferBarang::class;

    public function definition(): array
    {
        $gudangAsal = Gudang::inRandomOrder()->first();
        $gudangTujuan = Gudang::where('id', '!=', $gudangAsal->id)->inRandomOrder()->first();
        $tanggal = $this->faker->dateTimeBetween('-1 year', 'now');
        $status = $this->faker->randomElement(['diproses', 'dikirim', 'diterima', 'dibatalkan']);

        $tanggalDiterima = null;
        $diterimaOleh = null;

        if ($status == 'diterima') {
            $tanggalDiterima = $this->faker->dateTimeBetween($tanggal, 'now');
            $diterimaOleh = User::inRandomOrder()->first()->id ?? 1;
        }

        return [
            'kode' => 'TRF/' . $tanggal->format('Ym') . '/' . $this->faker->unique()->numerify('####'),
            'tanggal' => $tanggal,
            'gudang_asal_id' => $gudangAsal->id ?? 1,
            'gudang_tujuan_id' => $gudangTujuan->id ?? 1,
            'status' => $status,
            'user_id' => User::inRandomOrder()->first()->id ?? 1,
            'diterima_oleh' => $diterimaOleh,
            'tanggal_diterima' => $tanggalDiterima,
            'catatan' => $this->faker->sentence,
        ];
    }
}
