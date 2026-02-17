<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\PermintaanBarang;
use Illuminate\Database\Eloquent\Factories\Factory;

class PermintaanBarangFactory extends Factory
{
    protected $model = PermintaanBarang::class;

    public function definition(): array
    {
        $tanggal = $this->faker->dateTimeBetween('-1 year', 'now');
        $status = $this->faker->randomElement(['diajukan', 'menunggu_persetujuan', 'disetujui', 'ditolak', 'selesai']);
        
        $approvedBy = null;
        $tanggalApproval = null;
        $catatanApproval = null;

        if (in_array($status, ['disetujui', 'ditolak', 'selesai'])) {
            $approvedBy = User::inRandomOrder()->first()->id ?? 1;
            $tanggalApproval = $this->faker->dateTimeBetween($tanggal, 'now');
            $catatanApproval = $this->faker->sentence;
        }

        return [
            'kode_permintaan' => 'REQ/' . $tanggal->format('Ym') . '/' . $this->faker->unique()->numerify('####'),
            'user_id' => User::inRandomOrder()->first()->id ?? 1,
            'tanggal_permintaan' => $tanggal,
            'alasan_permintaan' => $this->faker->sentence,
            'status_permintaan' => $status,
            'approved_by' => $approvedBy,
            'tanggal_approval' => $tanggalApproval,
            'catatan_approval' => $catatanApproval,
        ];
    }
}
