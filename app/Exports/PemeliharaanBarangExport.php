<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class PemeliharaanBarangExport implements FromCollection, WithHeadings, WithStyles
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
                    'barang' => $detail->barang->nama_barang ?? '-',
                    'jumlah' => $detail->jml,
                    'status' => ucfirst($item->status),
                    'petugas' => $item->petugas->name ?? '-',
                    'biaya' => number_format($item->biaya, 0, ',', '.'),
                    'catatan' => $item->catatan ?? '-',
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
            'Kode Pemeliharaan',
            'Nama Barang',
            'Jumlah',
            'Status',
            'Petugas',
            'Biaya',
            'Catatan',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => ['font' => ['bold' => true]],
        ];
    }
}
