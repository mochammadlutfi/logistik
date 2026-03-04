<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StokGudang extends Model
{
    use HasFactory;

    protected $table = 'stok_gudang';

    protected $fillable = [
        'barang_id',
        'stok_tersedia',
        'baik',
        'rusak_ringan',
        'rusak_berat',
        'stok_minimum',
        'stok_maksimum',
        'lokasi_rak',
    ];

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
