<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class KerusakanBarangExport implements FromCollection, WithHeadings, WithMapping, WithStyles
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return $this->data;
    }

    public function headings(): array
    {
        return [
            'No',
            'Kode Barang',
            'Nama Barang',
            'Kategori',
            'Satuan',
            'Stok Tersedia',
            'Rusak Ringan',
            'Rusak Berat',
            'Total Rusak',
            'Lokasi Rak',
        ];
    }

    public function map($row): array
    {
        static $no = 0;
        $no++;
        return [
            $no,
            $row->barang->kode_barang ?? '-',
            $row->barang->nama_barang ?? '-',
            $row->barang->kategori->nama_kategori ?? '-',
            $row->barang->satuan->nama_satuan ?? '-',
            $row->stok_tersedia,
            $row->rusak_ringan,
            $row->rusak_berat,
            $row->rusak_ringan + $row->rusak_berat,
            $row->lokasi_rak ?? '-',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true]],
        ];
    }
}
