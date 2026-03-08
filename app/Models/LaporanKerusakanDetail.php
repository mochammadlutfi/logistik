<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class LaporanKerusakanDetail extends Model
{
    use HasFactory;

    protected $table = 'laporan_kerusakan_detail';

    protected $fillable = [
        'laporan_kerusakan_id',
        'barang_id',
        'rusak_ringan',
        'tindakan_rusak_ringan',
        'rusak_berat',
        'tindakan_rusak_berat',
        'keterangan',
    ];

    public function laporanKerusakan()
    {
        return $this->belongsTo(LaporanKerusakan::class, 'laporan_kerusakan_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
