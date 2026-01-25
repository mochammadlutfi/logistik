<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class BarangKeluarExport implements FromCollection, WithHeadings, WithStyles
{
    protected $data;
    protected $periode;

    public function __construct($data, $periode)
    {
        $this->data = $data;
        $this->periode = $periode;
    }

    public function collection()
    {
        $rows = collect();
        $no = 0;

        foreach ($this->data as $item) {
            foreach ($item->detail as $detail) {
                $no++;
                $rows->push([
                    'no' => $no,
                    'tanggal' => $item->tanggal,
                    'kode' => $item->kode,
                    'tujuan' => $item->tujuan_barang ?? '-',
                    'barang' => $detail->barang->nama_barang ?? '-',
                    'jumlah' => $detail->jml,
                    'keterangan' => $detail->keterangan ?? '-',
                ]);
            }
        }

        return $rows;
    }

    public function headings(): array
    {
        return [
            'No',
            'Tanggal',
            'Kode Transaksi',
            'Tujuan',
            'Nama Barang',
            'Jumlah',
            'Keterangan',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true]],
        ];
    }
}
