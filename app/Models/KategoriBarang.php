<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class KategoriBarang extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'kategori_barang';

    protected $fillable = [
        'kode_kategori',
        'nama_kategori',
        'keterangan',
    ];

    public function barang()
    {
        return $this->hasMany(Barang::class, 'kategori_id');
    }
}