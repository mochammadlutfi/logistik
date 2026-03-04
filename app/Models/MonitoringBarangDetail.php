<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MonitoringBarangDetail extends Model
{
    use HasFactory;

    protected $table = 'monitoring_barang_detail';

    protected $fillable = [
        'monitoring_id',
        'barang_id',
        'baik',
        'rusak_ringan',
        'rusak_berat',
    ];

    public function monitoring()
    {
        return $this->belongsTo(MonitoringBarang::class, 'monitoring_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
