<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TransferBarang extends Model
{
    use HasFactory;

    protected $table = 'transfer_barang';

    protected $fillable = [
        'kode',
        'tanggal',
        'gudang_asal_id',
        'gudang_tujuan_id',
        'status',
        'user_id',
        'diterima_oleh',
        'tanggal_diterima',
        'catatan',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'tanggal_diterima' => 'datetime',
        ];
    }

    public function gudangAsal()
    {
        return $this->belongsTo(Gudang::class, 'gudang_asal_id');
    }

    public function gudangTujuan()
    {
        return $this->belongsTo(Gudang::class, 'gudang_tujuan_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function penerima()
    {
        return $this->belongsTo(User::class, 'diterima_oleh');
    }

    public function detail()
    {
        return $this->hasMany(TransferBarangDetail::class, 'transfer_id');
    }
}
