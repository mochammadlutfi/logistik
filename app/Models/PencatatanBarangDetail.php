<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PencatatanBarangDetail extends Model
{
    use HasFactory;

    protected $table = 'pencatatan_barang_detail';

    protected $fillable = [
        'pencatatan_id',
        'barang_id',
        'jml',
        'kondisi',
    ];

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }

    public function pencatatan()
    {
        return $this->belongsTo(PencatatanBarang::class, 'pencatatan_id');
    }
}