<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Surat Pengeluaran Barang - {{ $item->kode }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            font-size: 11px;
            line-height: 1.4;
        }
        .container {
            padding: 20px;
        }
        .header {
            display: table;
            width: 100%;
            margin-bottom: 10px;
        }
        .header-left {
            display: table-cell;
            width: 20%;
            vertical-align: middle;
        }
        .header-center {
            display: table-cell;
            width: 60%;
            text-align: center;
            vertical-align: middle;
        }
        .header-right {
            display: table-cell;
            width: 20%;
            text-align: right;
            vertical-align: middle;
        }
        .logo {
            font-size: 18px;
            font-weight: bold;
        }
        .doc-title {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .doc-number {
            font-size: 12px;
        }
        .page-number {
            border: 1px solid #000;
            padding: 5px 15px;
            display: inline-block;
        }
        .info-line {
            margin: 10px 0;
            font-size: 11px;
        }
        .info-line span {
            border-bottom: 1px dotted #000;
            display: inline-block;
            min-width: 100px;
            padding: 0 5px;
        }
        table.items {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table.items th,
        table.items td {
            border: 1px solid #000;
            padding: 8px 5px;
            text-align: center;
            vertical-align: top;
        }
        table.items th {
            background-color: #f5f5f5;
            font-weight: bold;
            font-size: 10px;
        }
        table.items td {
            font-size: 11px;
            min-height: 30px;
        }
        table.items td.left {
            text-align: left;
        }
        .footer {
            margin-top: 20px;
        }
        .signatures {
            display: table;
            width: 100%;
            margin-top: 30px;
        }
        .signature-box {
            display: table-cell;
            width: 25%;
            text-align: center;
            vertical-align: top;
            padding: 0 10px;
        }
        .signature-box .date {
            margin-bottom: 5px;
            font-size: 10px;
        }
        .signature-box .title {
            font-size: 10px;
            margin-bottom: 50px;
        }
        .signature-box .name {
            border-top: 1px solid #000;
            padding-top: 5px;
            font-size: 10px;
            min-width: 100px;
            display: inline-block;
        }
        .distribution {
            margin-top: 20px;
            font-size: 9px;
        }
        .distribution-title {
            font-weight: bold;
            margin-bottom: 3px;
        }
        .distribution-list {
            display: table;
            width: 100%;
        }
        .distribution-item {
            display: table-cell;
            width: 25%;
        }
        .empty-row td {
            height: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-left">
                <div class="logo">PT. TIMAH</div>
            </div>
            <div class="header-center">
                <div class="doc-number">{{ $item->kode }}</div>
                <div class="doc-title">SURAT PENGELUARAN BARANG</div>
            </div>
            <div class="header-right">
                <div class="page-number">1</div>
            </div>
        </div>

        <div class="info-line">
            Dikirim dari <span>{{ $item->sumber_barang ?? '...................' }}</span>
            ke <span>{{ $item->tujuan_barang ?? '...................' }}</span>
            dengan <span>.....................</span>
        </div>

        <div style="font-size: 10px; margin-bottom: 5px;">
            Barang-barang seperti tersebut di bawah ini :
        </div>

        <table class="items">
            <thead>
                <tr>
                    <th width="8%">No.<br>POS</th>
                    <th width="12%">Banyaknya</th>
                    <th width="10%">Satuan</th>
                    <th width="10%">Berat</th>
                    <th width="35%">Nama Barang</th>
                    <th width="25%">Keterangan</th>
                </tr>
            </thead>
            <tbody>
                @foreach($item->detail as $index => $detail)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $detail->jml ?? '-' }}</td>
                    <td>{{ $detail->barang->satuan->nama_satuan ?? '-' }}</td>
                    <td>-</td>
                    <td class="left">
                        {{ $detail->barang->nama_barang ?? '-' }}<br>
                        <small>MN. {{ $detail->barang->kode_barang ?? '-' }}</small>
                    </td>
                    <td class="left">{{ $detail->keterangan ?? '-' }}</td>
                </tr>
                @endforeach
                @for($i = count($item->detail); $i < 5; $i++)
                <tr class="empty-row">
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                @endfor
            </tbody>
        </table>

        <div class="signatures">
            <div class="signature-box">
                <div class="date">{{ \Carbon\Carbon::parse($item->tanggal)->format('d/m/Y') }}</div>
                <div class="title">Penerima</div>
                <div class="name">
                    ........................<br>
                    ........................
                </div>
            </div>
            <div class="signature-box">
                <div class="date">&nbsp;</div>
                <div class="title">Yang membawa</div>
                <div class="name">
                    ........................<br>
                    ........................
                </div>
            </div>
            <div class="signature-box">
                <div class="date">Mtk, ....../....../20....</div>
                <div class="title">Pengirim</div>
                <div class="name">
                    ........................<br>
                    ........................
                </div>
            </div>
        </div>

        <div class="distribution">
            <div class="distribution-title">V470a Distribusi :</div>
            <div class="distribution-list">
                <div class="distribution-item">1. Gudang Kirim</div>
                <div class="distribution-item">2. Gudang Terima/User</div>
                <div class="distribution-item">3. Pengangkut</div>
                <div class="distribution-item">4. Satpam</div>
            </div>
        </div>
    </div>
</body>
</html>
