<?php

namespace Database\Seeders;

use App\Models\PemeliharaanBarang;
use App\Models\PermintaanBarang;
use App\Models\PencatatanBarang;
use App\Models\TransferBarang;
use App\Models\StokGudang;
use Illuminate\Database\Seeder;

class TransactionSeeder extends Seeder
{
    public function run(): void
    {
        // Generate Stock first
        // Generate Stock first - Use a loop to ensure unique combinations or update existing
        for ($i = 0; $i < 50; $i++) {
            try {
                StokGudang::factory()->create();
            } catch (\Illuminate\Database\UniqueConstraintViolationException $e) {
                // Ignore if duplicate
                continue;
            } catch (\Exception $e) {
                // Ignore other errors
                continue;
            }
        }

        // Generate Transactions
        PemeliharaanBarang::factory(20)
            ->hasDetail(3)
            ->create();

        PermintaanBarang::factory(20)
            ->hasDetail(3)
            ->create();

        PencatatanBarang::factory(20)
            ->hasDetail(3)
            ->create();

        TransferBarang::factory(20)
            ->hasDetail(3)
            ->create();
    }
}
