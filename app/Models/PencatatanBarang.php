<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PencatatanBarang extends Model
{
    use HasFactory;

    protected $table = 'pencatatan_barang';

    protected $fillable = [
        'kode',
        'gudang_id',
        'barang_id',
        'jenis',
        'jumlah',
        'tanggal',
        'supplier_id',
        'sumber_barang',
        'tujuan_barang',
        'no_dokumen',
        'user_id',
        'catatan',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
        ];
    }

    public function gudang()
    {
        return $this->belongsTo(Gudang::class, 'gudang_id');
    }

    public function detail()
    {
        return $this->hasMany(PencatatanBarangDetail::class, 'pencatatan_id');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}