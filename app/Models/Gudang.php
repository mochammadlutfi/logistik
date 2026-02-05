<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gudang extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'gudang';

    protected $fillable = [
        'kode_gudang',
        'nama_gudang',
        'penanggung_jawab',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
        ];
    }

    public function users()
    {
        return $this->hasMany(User::class, 'gudang_id');
    }

    public function stokGudang()
    {
        return $this->hasMany(StokGudang::class, 'gudang_id');
    }

    public function barang()
    {
        return $this->belongsToMany(Barang::class, 'stok_gudang', 'gudang_id', 'barang_id')
                    ->withPivot('stok_tersedia', 'stok_minimum', 'stok_maksimum', 'lokasi_rak')
                    ->withTimestamps();
    }
}
