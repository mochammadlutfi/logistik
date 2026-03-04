<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MonitoringBarang extends Model
{
    use HasFactory;

    protected $table = 'monitoring_barang';

    protected $fillable = [
        'kode',
        'tanggal',
        'petugas_id',
        'lokasi',
        'keterangan',
    ];

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
        ];
    }

    public function petugas()
    {
        return $this->belongsTo(User::class, 'petugas_id');
    }

    public function detail()
    {
        return $this->hasMany(MonitoringBarangDetail::class, 'monitoring_id');
    }
}
