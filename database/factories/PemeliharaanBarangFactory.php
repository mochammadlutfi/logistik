<?php

namespace Database\Factories;

use App\Models\Gudang;
use App\Models\User;
use App\Models\PemeliharaanBarang;
use Illuminate\Database\Eloquent\Factories\Factory;

class PemeliharaanBarangFactory extends Factory
{
    protected $model = PemeliharaanBarang::class;

    public function definition(): array
    {
        $tanggal = $this->faker->dateTimeBetween('-1 year', 'now');
        $status = $this->faker->randomElement(['pending', 'disetujui', 'ditolak', 'diproses', 'selesai']);
        
        $approvedBy = null;
        $tanggalApproval = null;
        $catatanApproval = null;

        if (in_array($status, ['disetujui', 'ditolak', 'diproses', 'selesai'])) {
            $approvedBy = User::inRandomOrder()->first()->id ?? 1;
            $tanggalApproval = $this->faker->dateTimeBetween($tanggal, 'now');
            $catatanApproval = $this->faker->sentence;
        }

        return [
            'kode' => 'MTN/' . $tanggal->format('Ym') . '/' . $this->faker->unique()->numerify('####'),
            'gudang_id' => Gudang::inRandomOrder()->first()->id ?? 1,
            // 'jenis' => $this->faker->randomElement(['rutin', 'kerusakan', 'upgrade']), // Not in DB
            // 'deskripsi' => $this->faker->sentence, // Not in DB
            'alasan' => $this->faker->sentence, // Is in DB
            'status' => $status,
            'tanggal' => $tanggal,
            'tanggal_selesai' => $status == 'selesai' ? $this->faker->dateTimeBetween($tanggal, 'now') : null,
            'biaya' => $this->faker->numberBetween(50000, 5000000),
            'petugas_id' => User::inRandomOrder()->first()->id ?? 1,
            'catatan' => $this->faker->paragraph,
            'approved_by' => $approvedBy,
            'tanggal_approval' => $tanggalApproval,
            'catatan_approval' => $catatanApproval,
        ];
    }
}
