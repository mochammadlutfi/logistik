<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Detail Transfer: {{ $item->kode }}</h1>
            <a href="{{ route('transfer-barang.index') }}" class="btn btn-sm btn-outline">
                <i class="fas fa-arrow-left mr-2"></i>
                Kembali
            </a>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif
        @if (session('error'))
            <div class="mb-4 rounded border border-red-200 bg-red-50 text-red-700 px-3 py-2 text-sm">{{ session('error') }}</div>
        @endif

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
            <!-- Info Card -->
            <div class="md:col-span-2 bg-white rounded-lg border p-6">
                <h2 class="text-lg font-semibold mb-4 border-b pb-2">Informasi Transfer</h2>
                <dl class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Tanggal</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ $item->tanggal->format('d F Y') }}</dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Status</dt>
                        <dd class="mt-1">
                            @php
                                $statusClass = match($item->status) {
                                    'draft' => 'bg-gray-100 text-gray-700',
                                    'dalam_pengiriman' => 'bg-blue-100 text-blue-700',
                                    'diterima' => 'bg-green-100 text-green-700',
                                    'dibatalkan' => 'bg-red-100 text-red-700',
                                    default => 'bg-gray-100 text-gray-700',
                                };
                                $statusLabel = match($item->status) {
                                    'draft' => 'Draft',
                                    'dalam_pengiriman' => 'Dalam Pengiriman',
                                    'diterima' => 'Diterima',
                                    'dibatalkan' => 'Dibatalkan',
                                    default => $item->status,
                                };
                            @endphp
                            <span class="px-2 py-1 text-xs rounded font-semibold {{ $statusClass }}">{{ $statusLabel }}</span>
                        </dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Gudang Asal</dt>
                        <dd class="mt-1 text-sm text-gray-900 font-medium">{{ $item->gudangAsal->nama_gudang }}</dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Gudang Tujuan</dt>
                        <dd class="mt-1 text-sm text-gray-900 font-medium">{{ $item->gudangTujuan->nama_gudang }}</dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">Catatan</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ $item->catatan ?? '-' }}</dd>
                    </div>
                </dl>
            </div>

            <!-- Action Card -->
            <div class="bg-white rounded-lg border p-6">
                <h2 class="text-lg font-semibold mb-4 border-b pb-2">Aksi</h2>
                
                @if($item->status === 'draft')
                    <p class="text-sm text-gray-600 mb-4">Transfer ini masih draft. Kirim barang untuk memotong stok gudang asal.</p>
                    <form action="{{ route('transfer-barang.updateStatus', $item->id) }}" method="POST" class="grid gap-2">
                        @csrf
                        @method('PUT')
                        <button type="submit" name="status" value="dalam_pengiriman" class="btn btn-primary w-full" onclick="return confirm('Kirim barang? Stok gudang asal akan berkurang.')">
                            <i class="fas fa-truck mr-2"></i> Kirim Barang
                        </button>
                        <button type="submit" name="status" value="dibatalkan" class="btn btn-outline w-full text-red-600 border-red-600 hover:bg-red-50" onclick="return confirm('Batalkan transfer?')">
                            <i class="fas fa-times mr-2"></i> Batalkan
                        </button>
                    </form>
                @elseif($item->status === 'dalam_pengiriman')
                    <p class="text-sm text-gray-600 mb-4">Barang sedang dikirim. Konfirmasi penerimaan untuk menambah stok gudang tujuan.</p>
                    <form action="{{ route('transfer-barang.updateStatus', $item->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <button type="submit" name="status" value="diterima" class="btn btn-success w-full bg-green-600 text-white hover:bg-green-700" onclick="return confirm('Terima barang? Stok gudang tujuan akan bertambah.')">
                            <i class="fas fa-check mr-2"></i> Terima Barang
                        </button>
                    </form>
                @elseif($item->status === 'diterima')
                    <div class="bg-green-50 border border-green-200 rounded p-3 mb-3">
                        <p class="text-sm text-green-800 flex items-center">
                            <i class="fas fa-check-circle mr-2"></i> Transaksi Selesai
                        </p>
                    </div>
                    <p class="text-xs text-gray-500">Diterima oleh: {{ $item->penerima->name ?? '-' }} <br> Tanggal: {{ $item->tanggal_diterima?->format('d/m/Y H:i') }}</p>
                @else
                    <div class="bg-red-50 border border-red-200 rounded p-3">
                        <p class="text-sm text-red-800">Transaksi Dibatalkan</p>
                    </div>
                @endif
            </div>
        </div>

        <!-- Items Table -->
        <div class="rounded-lg border bg-white overflow-hidden">
            <div class="bg-gray-50 px-6 py-3 border-b">
                <h3 class="font-semibold text-gray-700">Item Transfer</h3>
            </div>
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-white">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Barang</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Qty Kirim</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Qty Diterima</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kondisi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($item->detail as $detail)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                <div class="font-medium">{{ $detail->barang->nama_barang }}</div>
                                <div class="text-gray-500 text-xs">{{ $detail->barang->kode_barang }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 text-right">{{ $detail->jml_kirim }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 text-right">{{ $detail->jml_diterima ?? '-' }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                {{ ucfirst($detail->kondisi) }}
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</x-app-layout>
