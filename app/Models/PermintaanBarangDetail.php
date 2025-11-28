<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PermintaanBarangDetail extends Model
{
    use HasFactory;

    protected $table = 'permintaan_barang_detail';

    protected $fillable = [
        'permintaan_id',
        'barang_id',
        'jml',
        'jml_approval',
        'catatan'
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'tanggal_approval' => 'datetime',
        ];
    }

    public function permintaan()
    {
        return $this->belongsTo(PermintaanBarang::class, 'permintaan_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}