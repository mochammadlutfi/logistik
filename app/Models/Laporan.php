<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Laporan extends Model
{
    use HasFactory;

    protected $table = 'laporan';

    protected $fillable = [
        'kode_laporan',
        'jenis_laporan',
        'judul_laporan',
        'periode_awal',
        'periode_akhir',
        'isi_laporan',
        'file_laporan',
        'status_laporan',
        'dibuat_oleh',
    ];

    protected function casts(): array
    {
        return [
            'periode_awal' => 'date',
            'periode_akhir' => 'date',
        ];
    }

    public function pembuat()
    {
        return $this->belongsTo(User::class, 'dibuat_oleh');
    }

    public function verifikasi()
    {
        return $this->hasMany(VerifikasiLaporan::class, 'laporan_id');
    }
}