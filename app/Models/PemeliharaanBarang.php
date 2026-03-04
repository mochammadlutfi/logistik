<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PemeliharaanBarang extends Model
{
    use HasFactory;

    protected $table = 'pemeliharaan_barang';

    protected $fillable = [
        'kode',
        'monitoring_id',
        'status',
        'tanggal',
        'tanggal_selesai',
        'biaya',
        'petugas_id',
        'alasan',
        'catatan',
        'approved_by',
        'tanggal_approval',
        'catatan_approval',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'biaya' => 'decimal:2',
            'tanggal_approval' => 'datetime',
        ];
    }

    public function petugas()
    {
        return $this->belongsTo(User::class, 'petugas_id');
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }

    public function detail()
    {
        return $this->hasMany(PemeliharaanBarangDetail::class, 'pemeliharaan_id');
    }

    public function monitoring()
    {
        return $this->belongsTo(MonitoringBarang::class, 'monitoring_id');
    }
}