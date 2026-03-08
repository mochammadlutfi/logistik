<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Laporan Kerusakan Barang</title>
    <style>
        body { font-family: Arial, sans-serif; font-size: 12px; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h1 { margin: 0; font-size: 18px; }
        .header p { margin: 5px 0; color: #666; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f5f5f5; font-weight: bold; }
        tr:nth-child(even) { background-color: #fafafa; }
        .footer { margin-top: 20px; text-align: right; font-size: 10px; color: #666; }
        .text-center { text-align: center; }
        .text-danger { color: #dc3545; }
        .text-warning { color: #ffc107; }
    </style>
</head>
<body>
    <div class="header">
        <h1>LAPORAN KERUSAKAN BARANG</h1>
        <p>Tanggal Cetak: {{ date('d/m/Y H:i') }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th width="30" class="text-center">No</th>
                <th>Kode</th>
                <th>Nama Barang</th>
                <th>Kategori</th>
                <th>Satuan</th>
                <th width="60" class="text-center">Stok Tersedia</th>
                <th width="70" class="text-center">Rusak Ringan</th>
                <th width="70" class="text-center">Rusak Berat</th>
                <th width="60" class="text-center">Total Rusak</th>
                <th>Lokasi Rak</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalRusakRingan = 0;
                $totalRusakBerat = 0;
            @endphp
            @foreach($data as $i => $item)
            @php
                $totalRusakRingan += $item->rusak_ringan;
                $totalRusakBerat += $item->rusak_berat;
            @endphp
            <tr>
                <td class="text-center">{{ $i + 1 }}</td>
                <td>{{ $item->barang->kode_barang ?? '-' }}</td>
                <td>{{ $item->barang->nama_barang ?? '-' }}</td>
                <td>{{ $item->barang->kategori->nama_kategori ?? '-' }}</td>
                <td>{{ $item->barang->satuan->nama_satuan ?? '-' }}</td>
                <td class="text-center">{{ $item->stok_tersedia }}</td>
                <td class="text-center text-warning">{{ $item->rusak_ringan }}</td>
                <td class="text-center text-danger">{{ $item->rusak_berat }}</td>
                <td class="text-center">{{ $item->rusak_ringan + $item->rusak_berat }}</td>
                <td>{{ $item->lokasi_rak ?? '-' }}</td>
            </tr>
            @endforeach
            @if($data->count() > 0)
            <tr style="background-color: #f5f5f5; font-weight: bold;">
                <td colspan="6" class="text-center">TOTAL</td>
                <td class="text-center">{{ $totalRusakRingan }}</td>
                <td class="text-center">{{ $totalRusakBerat }}</td>
                <td class="text-center">{{ $totalRusakRingan + $totalRusakBerat }}</td>
                <td></td>
            </tr>
            @else
            <tr>
                <td colspan="10" class="text-center">Tidak ada barang rusak</td>
            </tr>
            @endif
        </tbody>
    </table>

    <div class="footer">
        Total Barang: {{ $data->count() }} item | Total Kerusakan: {{ $totalRusakRingan + $totalRusakBerat }} unit
    </div>
</body>
</html>
