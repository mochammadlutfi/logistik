<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PemeliharaanBarang extends Model
{
    use HasFactory;

    protected $table = 'pemeliharaan_barang';

    protected $fillable = [
        'kode',
        'jenis',
        'deskripsi',
        'status',
        'tanggal',
        'biaya',
        'petugas_id',
        'catatan',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'biaya' => 'decimal:2',
        ];
    }

    public function petugas()
    {
        return $this->belongsTo(User::class, 'petugas_id');
    }
}