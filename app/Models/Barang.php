<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Barang extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'barang';

    protected $fillable = [
        'kode_barang',
        'nama_barang',
        'kategori_id',
        'satuan_id',
        'stok_minimum',
        'stok_maksimum',
        'stok_total',
        'harga_satuan',
        'lokasi_penyimpanan',
        'kondisi_fisik',
        'foto_barang',
        'keterangan',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
            'harga_satuan' => 'decimal:2',
            'stok_total' => 'integer',
        ];
    }

    public function getTotalStockAttribute()
    {
        return $this->stok_total ?? 0;
    }

    public function stokGudang()
    {
        return $this->hasMany(StokGudang::class, 'barang_id');
    }

    public function gudang()
    {
        return $this->belongsToMany(Gudang::class, 'stok_gudang', 'barang_id', 'gudang_id')
                    ->withPivot('stok_tersedia', 'stok_minimum', 'stok_maksimum', 'lokasi_rak')
                    ->withTimestamps();
    }

    public function kategori()
    {
        return $this->belongsTo(KategoriBarang::class, 'kategori_id');
    }

    public function satuan()
    {
        return $this->belongsTo(Satuan::class, 'satuan_id');
    }

    public function pencatatan()
    {
        return $this->hasMany(PencatatanBarang::class, 'barang_id');
    }

    public function detailPermintaan()
    {
        return $this->hasMany(DetailPermintaanBarang::class, 'barang_id');
    }

    public function pemeliharaan()
    {
        return $this->hasMany(Pemeliharaan::class, 'barang_id');
    }
}