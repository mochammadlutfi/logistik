<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PermintaanBarang extends Model
{
    use HasFactory;

    protected $table = 'permintaan_barang';

    protected $fillable = [
        'kode',
        'user_id',
        'tanggal',
        'alasan',
        'status',
        'approved_by',
        'tanggal_approval',
        'catatan_approval',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'tanggal_approval' => 'datetime',
        ];
    }

    public function pemohon()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function detail()
    {
        return $this->hasMany(PermintaanBarangDetail::class, 'permintaan_id');
    }
}