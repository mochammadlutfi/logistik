<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class LaporanKerusakan extends Model
{
    use HasFactory;

    protected $table = 'laporan_kerusakan';

    protected $fillable = [
        'kode',
        'pemeliharaan_id',
        'tanggal',
        'petugas_id',
        'status',
        'catatan',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
        ];
    }

    public function pemeliharaan()
    {
        return $this->belongsTo(PemeliharaanBarang::class, 'pemeliharaan_id');
    }

    public function petugas()
    {
        return $this->belongsTo(User::class, 'petugas_id');
    }

    public function detail()
    {
        return $this->hasMany(LaporanKerusakanDetail::class, 'laporan_kerusakan_id');
    }
}
