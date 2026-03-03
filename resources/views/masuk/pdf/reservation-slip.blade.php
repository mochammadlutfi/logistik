<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reservation Slip - {{ $item->kode }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: 10px;
            line-height: 1.3;
            padding: 30px;
        }
        .page-title {
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 8px;
            margin-bottom: 20px;
            border-bottom: 1px solid #000;
            padding-bottom: 10px;
        }
        .info-section {
            display: table;
            width: 100%;
            margin-bottom: 15px;
            font-size: 9px;
        }
        .info-left {
            display: table-cell;
            width: 50%;
            vertical-align: top;
            padding-right: 10px;
        }
        .info-right {
            display: table-cell;
            width: 50%;
            vertical-align: top;
            padding-left: 10px;
        }
        .info-row {
            margin-bottom: 3px;
            display: table;
            width: 100%;
        }
        .info-label {
            display: table-cell;
            width: 30%;
            font-weight: normal;
        }
        .info-value {
            display: table-cell;
            width: 70%;
            padding-left: 5px;
        }
        .approval-section {
            display: table;
            width: 100%;
            margin: 15px 0;
            font-size: 9px;
        }
        .approval-left {
            display: table-cell;
            width: 50%;
            padding-right: 10px;
        }
        .approval-right {
            display: table-cell;
            width: 50%;
            padding-left: 10px;
        }
        .approval-box {
            margin-bottom: 5px;
        }
        .approval-label {
            display: inline-block;
            width: 110px;
        }
        .approval-value {
            display: inline-block;
            border-bottom: 1px solid #000;
            min-width: 150px;
            padding: 0 5px;
        }
        table.items {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
            font-size: 8px;
        }
        table.items th,
        table.items td {
            border: 1px solid #000;
            padding: 5px 3px;
            vertical-align: top;
        }
        table.items th {
            background-color: #f0f0f0;
            font-weight: bold;
            text-align: center;
        }
        table.items td {
            text-align: center;
        }
        table.items td.left {
            text-align: left;
        }
        .item-details {
            font-size: 7px;
            line-height: 1.4;
            text-align: left;
            padding-left: 3px;
        }
        .item-details div {
            margin-bottom: 1px;
        }
        .signature-section {
            display: table;
            width: 100%;
            margin-top: 30px;
            border: 1px solid #000;
            font-size: 9px;
        }
        .signature-box {
            display: table-cell;
            width: 33.33%;
            border-right: 1px solid #000;
            padding: 8px;
            vertical-align: top;
            text-align: center;
        }
        .signature-box:last-child {
            border-right: none;
        }
        .signature-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .signature-name {
            margin: 40px 0 5px 0;
            border-top: 1px solid #000;
            padding-top: 5px;
            display: inline-block;
            min-width: 120px;
        }
        .signature-nik {
            font-size: 8px;
        }
        .halaman {
            position: absolute;
            top: 30px;
            right: 30px;
            font-size: 10px;
        }
        .spec-label {
            display: inline-block;
            min-width: 140px;
        }
    </style>
</head>
<body>
    <div class="halaman">Halaman 1</div>

    <div class="page-title">RESERVATION SLIP</div>

    <div class="info-section">
        <div class="info-left">
            <div class="info-row">
                <div class="info-label">Mov Type</div>
                <div class="info-value">: 201 - GI for cost center</div>
            </div>
            <div class="info-row">
                <div class="info-label">Cost Ctr</div>
                <div class="info-value">: 860302002 - SctHead FgTm MinApl</div>
            </div>
            <div class="info-row">
                <div class="info-label">Plant</div>
                <div class="info-value">: 1000 - Timah Tbk</div>
            </div>
            <div class="info-row">
                <div class="info-label">I/O</div>
                <div class="info-value">: {{ $item->sumber_barang ?? '-' }}</div>
            </div>
        </div>
        <div class="info-right">
            <div class="info-row">
                <div class="info-label">Res Num</div>
                <div class="info-value">: {{ $item->kode }}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Doc Dt</div>
                <div class="info-value">: {{ \Carbon\Carbon::parse($item->tanggal)->format('d.m.Y') }}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Order</div>
                <div class="info-value">: {{ $item->supplier->nama_supplier ?? '-' }}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Input</div>
                <div class="info-value">: {{ $item->user->name ?? 'DITA' }}</div>
            </div>
        </div>
    </div>

    <div class="approval-section">
        <div class="approval-left">
            <div class="approval-box">
                <span class="approval-label">Diminta Oleh:</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">Nama</span>
                <span class="approval-value">: {{ $item->user->name ?? 'NATALUS SUNU WIDARTO' }}</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">NIK</span>
                <span class="approval-value">: {{ $item->user->nik ?? '20070717' }}</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">Tanggal</span>
                <span class="approval-value">: {{ \Carbon\Carbon::parse($item->tanggal)->format('d/m/Y - H:i') }}</span>
            </div>
        </div>
        <div class="approval-right">
            <div class="approval-box">
                <span class="approval-label">Disetujui Oleh:</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">Nama</span>
                <span class="approval-value">: FIRDAUS PRATAMA</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">NIK</span>
                <span class="approval-value">: 21212799</span>
            </div>
            <div class="approval-box">
                <span class="approval-label">Tanggal</span>
                <span class="approval-value">: </span>
            </div>
        </div>
    </div>

    <table class="items">
        <thead>
            <tr>
                <th width="5%">No</th>
                <th width="45%">Mat-Number Part-Name<br>Stock-Code Description</th>
                <th width="8%">Sto-Loc</th>
                <th width="8%">UOM<br>Curr.</th>
                <th width="10%">Qty<br>Price</th>
                <th width="12%">Issue<br>sisa</th>
                <th width="12%">Bin-Loc</th>
            </tr>
        </thead>
        <tbody>
            @foreach($item->detail as $index => $detail)
            <tr>
                <td>{{ str_pad($index + 1, 4, '0', STR_PAD_LEFT) }}</td>
                <td class="left">
                    <strong>{{ $detail->barang->kode_barang ?? '-' }}</strong>
                    &nbsp;&nbsp;
                    <strong>{{ strtoupper($detail->barang->nama_barang ?? '-') }}</strong>
                    <br>
                    <div class="item-details">
                        <div><span class="spec-label">KATEGORI</span> : {{ strtoupper($detail->barang->kategori->nama_kategori ?? '-') }}</div>
                        <div><span class="spec-label">LOKASI PENYIMPANAN</span> : {{ strtoupper($detail->barang->lokasi_penyimpanan ?? '-') }}</div>
                        @if($detail->keterangan)
                        <div><span class="spec-label">ADDITIONAL DETAILS</span> : {{ strtoupper($detail->keterangan) }}</div>
                        @endif
                        <div style="margin-top: 3px;"><strong>IDR {{ number_format($detail->barang->harga_satuan ?? 0, 3, '.', '.') }}</strong></div>
                    </div>
                </td>
                <td>{{ $item->gudang_id ?? '1040' }}</td>
                <td>{{ strtoupper($detail->barang->satuan->nama_satuan ?? 'UNT') }}</td>
                <td>
                    {{ $detail->jml ?? 0 }}<br>
                    {{ number_format($detail->barang->harga_satuan ?? 0, 3, '.', '.') }}
                </td>
                <td>
                    0<br>
                    {{ $detail->jml ?? 0 }}
                </td>
                <td>{{ $detail->barang->lokasi_penyimpanan ?? '-' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="signature-section">
        <div class="signature-box">
            <div class="signature-title">Kepala Gudang</div>
            <div class="signature-name">
                <strong>................................</strong>
            </div>
            <div class="signature-nik">
                NIK : [........................]<br>
                Tgl : [........................]
            </div>
        </div>
        <div class="signature-box">
            <div class="signature-title">Dibawa Oleh</div>
            <div class="signature-name">
                <strong>................................</strong>
            </div>
            <div class="signature-nik">
                NIK : [........................]<br>
                Tgl : [........................]
            </div>
        </div>
        <div class="signature-box">
            <div class="signature-title">Diterima Oleh</div>
            <div class="signature-name">
                <strong>{{ strtoupper($item->user->name ?? 'NATALUS S.W') }}</strong>
            </div>
            <div class="signature-nik">
                NIK : [{{ $item->user->nik ?? '07-10-2025' }}]<br>
                Tgl : [{{ \Carbon\Carbon::parse($item->tanggal)->format('dmy') }}]
            </div>
        </div>
    </div>

    @if($item->catatan)
    <div style="margin-top: 15px; font-size: 9px;">
        <strong>Catatan:</strong> {{ $item->catatan }}
    </div>
    @endif
</body>
</html>
