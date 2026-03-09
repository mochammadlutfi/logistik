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

    public function user()
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

    // Method untuk update status berdasarkan pemenuhan detail
    public function updateStatusBerdasarkanPemenuhan()
    {
        $allDetails = $this->detail;

        if ($allDetails->isEmpty()) {
            return;
        }

        $allFulfilled = true;
        $anyFulfilled = false;

        foreach ($allDetails as $detail) {
            $terpenuhi = $detail->jml_terpenuhi ?? 0;

            if ($terpenuhi < $detail->jml) {
                $allFulfilled = false;
            }

            if ($terpenuhi > 0) {
                $anyFulfilled = true;
            }
        }

        // Jika semua terpenuhi, status = selesai
        if ($allFulfilled) {
            $this->status = 'selesai';
        }
        // Jika ada yang terpenuhi tapi belum semua, status = partial
        elseif ($anyFulfilled) {
            $this->status = 'partial';
        }
        // Jika belum ada yang terpenuhi, tetap disetujui
        else {
            $this->status = 'disetujui';
        }

        $this->save();
    }
}