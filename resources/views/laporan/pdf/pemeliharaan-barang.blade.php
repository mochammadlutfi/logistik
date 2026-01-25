<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Laporan Pemeliharaan Barang</title>
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
        .text-right { text-align: right; }
    </style>
</head>
<body>
    <div class="header">
        <h1>LAPORAN PEMELIHARAAN BARANG</h1>
        <p>Periode: {{ date('d/m/Y', strtotime($periode['awal'])) }} - {{ date('d/m/Y', strtotime($periode['akhir'])) }}</p>
        <p>Tanggal Cetak: {{ date('d/m/Y H:i') }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th width="30">No</th>
                <th>Tanggal</th>
                <th>Kode</th>
                <th>Nama Barang</th>
                <th width="50">Jml</th>
                <th>Status</th>
                <th>Petugas</th>
                <th>Biaya</th>
            </tr>
        </thead>
        <tbody>
            @php $no = 0; $totalBiaya = 0; @endphp
            @foreach($data as $item)
                @php $totalBiaya += $item->biaya; @endphp
                @foreach($item->detail as $detail)
                @php $no++; @endphp
                <tr>
                    <td>{{ $no }}</td>
                    <td>{{ date('d/m/Y', strtotime($item->tanggal)) }}</td>
                    <td>{{ $item->kode }}</td>
                    <td>{{ $detail->barang->nama_barang ?? '-' }}</td>
                    <td>{{ $detail->jml }}</td>
                    <td>{{ ucfirst($item->status) }}</td>
                    <td>{{ $item->petugas->name ?? '-' }}</td>
                    <td class="text-right">Rp {{ number_format($item->biaya, 0, ',', '.') }}</td>
                </tr>
                @endforeach
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="7" class="text-right">Total Biaya:</th>
                <th class="text-right">Rp {{ number_format($totalBiaya, 0, ',', '.') }}</th>
            </tr>
        </tfoot>
    </table>

    <div class="footer">
        Total: {{ $no }} item
    </div>
</body>
</html>
