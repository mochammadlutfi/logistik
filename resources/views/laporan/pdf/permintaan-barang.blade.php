<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Laporan Permintaan Barang</title>
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
        .status-diajukan { color: #f59e0b; }
        .status-disetujui { color: #10b981; }
        .status-ditolak { color: #ef4444; }
        .status-selesai { color: #3b82f6; }
    </style>
</head>
<body>
    <div class="header">
        <h1>LAPORAN PERMINTAAN BARANG</h1>
        <p>Periode: {{ date('d/m/Y', strtotime($periode['awal'])) }} - {{ date('d/m/Y', strtotime($periode['akhir'])) }}</p>
        <p>Tanggal Cetak: {{ date('d/m/Y H:i') }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th width="30">No</th>
                <th>Tanggal</th>
                <th>Kode</th>
                <th>Pemohon</th>
                <th>Nama Barang</th>
                <th width="50">Jml</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @php $no = 0; @endphp
            @foreach($data as $item)
                @foreach($item->detail as $detail)
                @php $no++; @endphp
                <tr>
                    <td>{{ $no }}</td>
                    <td>{{ date('d/m/Y', strtotime($item->tanggal)) }}</td>
                    <td>{{ $item->kode }}</td>
                    <td>{{ $item->user->name ?? '-' }}</td>
                    <td>{{ $detail->barang->nama_barang ?? '-' }}</td>
                    <td>{{ $detail->jml }}</td>
                    <td class="status-{{ $item->status }}">{{ ucfirst(str_replace('_', ' ', $item->status)) }}</td>
                </tr>
                @endforeach
            @endforeach
        </tbody>
    </table>

    <div class="footer">
        Total: {{ $no }} item
    </div>
</body>
</html>
