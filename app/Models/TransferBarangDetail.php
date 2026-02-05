<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TransferBarangDetail extends Model
{
    use HasFactory;

    protected $table = 'transfer_barang_detail';

    protected $fillable = [
        'transfer_id',
        'barang_id',
        'jml_kirim',
        'jml_diterima',
        'kondisi',
        'keterangan',
    ];

    public function transfer()
    {
        return $this->belongsTo(TransferBarang::class, 'transfer_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
