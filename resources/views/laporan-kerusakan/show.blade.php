<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Detail Laporan Kerusakan Barang</h1>
            <div class="flex gap-2">
                @if ($item->status == 'pending')
                    <form action="{{ route('laporan-kerusakan.updateStatus', $item->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="status" value="diproses">
                        <button type="submit" class="btn btn-sm btn-warning gap-2">
                            <i class="fa-solid fa-spinner"></i>
                            Proses
                        </button>
                    </form>
                @endif

                @if ($item->status == 'diproses')
                    <form action="{{ route('laporan-kerusakan.updateStatus', $item->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="status" value="selesai">
                        <button type="submit" class="btn btn-sm btn-primary gap-2">
                            <i class="fa-solid fa-check-double"></i>
                            Selesai
                        </button>
                    </form>
                @endif

                <a href="{{ route('laporan-kerusakan.edit', $item->id) }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-edit"></i> Ubah
                </a>
                <a href="{{ route('laporan-kerusakan.index') }}" class="btn-outline btn-sm">
                    <i class="fas fa-arrow-left"></i> Kembali
                </a>
            </div>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="grid gap-6">
            <!-- Header Info -->
            <div class="rounded-lg border p-6">
                <h2 class="text-lg font-semibold mb-4">Informasi Laporan</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="text-sm font-medium text-gray-500">Kode Laporan</label>
                        <p class="text-base font-semibold">{{ $item->kode }}</p>
                    </div>
                    <div>
                        <label class="text-sm font-medium text-gray-500">Tanggal</label>
                        <p class="text-base">{{ \Carbon\Carbon::parse($item->tanggal)->format('d F Y') }}</p>
                    </div>
                    <div>
                        <label class="text-sm font-medium text-gray-500">Sumber Pemeliharaan</label>
                        <p class="text-base">
                            <a href="{{ route('pemeliharaan-barang.show', $item->pemeliharaan_id) }}" class="text-blue-600 hover:underline">
                                {{ $item->pemeliharaan->kode }}
                            </a>
                        </p>
                    </div>
                    <div>
                        <label class="text-sm font-medium text-gray-500">Petugas</label>
                        <p class="text-base">{{ $item->petugas->name }}</p>
                    </div>
                    <div>
                        <label class="text-sm font-medium text-gray-500">Status</label>
                        <p class="text-base">
                            @if($item->status == 'selesai')
                                <span class="bg-green-500 text-white px-3 py-1 rounded text-sm font-semibold">Selesai</span>
                            @elseif($item->status == 'diproses')
                                <span class="bg-blue-500 text-white px-3 py-1 rounded text-sm font-semibold">Diproses</span>
                            @else
                                <span class="bg-yellow-500 text-white px-3 py-1 rounded text-sm font-semibold">Pending</span>
                            @endif
                        </p>
                    </div>
                    @if($item->catatan)
                    <div class="md:col-span-2">
                        <label class="text-sm font-medium text-gray-500">Catatan</label>
                        <p class="text-base">{{ $item->catatan }}</p>
                    </div>
                    @endif
                </div>
            </div>

            <!-- Detail Barang -->
            <div class="rounded-lg border p-6">
                <h2 class="text-lg font-semibold mb-4">Detail Barang Rusak</h2>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">No</th>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nama Barang</th>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Kategori</th>
                                <th class="px-4 py-3 text-center text-xs font-medium text-gray-500 uppercase">Rusak Ringan</th>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Tindakan RR</th>
                                <th class="px-4 py-3 text-center text-xs font-medium text-gray-500 uppercase">Rusak Berat</th>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Tindakan RB</th>
                                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Keterangan</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @php
                                $totalRusakRingan = 0;
                                $totalRusakBerat = 0;
                            @endphp
                            @foreach ($item->detail as $i => $d)
                            @php
                                $totalRusakRingan += $d->rusak_ringan;
                                $totalRusakBerat += $d->rusak_berat;
                            @endphp
                            <tr>
                                <td class="px-4 py-3 text-sm">{{ $i + 1 }}</td>
                                <td class="px-4 py-3 text-sm">{{ $d->barang->nama_barang }}</td>
                                <td class="px-4 py-3 text-sm">{{ $d->barang->kategori->nama_kategori ?? '-' }}</td>
                                <td class="px-4 py-3 text-sm text-center">
                                    <span class="text-yellow-600 font-semibold">{{ $d->rusak_ringan }}</span>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @if($d->tindakan_rusak_ringan)
                                        <span class="bg-yellow-100 text-yellow-800 px-2 py-1 rounded text-xs">
                                            {{ $d->tindakan_rusak_ringan == 'diganti' ? 'Diganti' : 'Masih Bisa Dipakai' }}
                                        </span>
                                    @else
                                        <span class="text-gray-400">-</span>
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-sm text-center">
                                    <span class="text-red-600 font-semibold">{{ $d->rusak_berat }}</span>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @if($d->tindakan_rusak_berat)
                                        <span class="bg-red-100 text-red-800 px-2 py-1 rounded text-xs">
                                            @if($d->tindakan_rusak_berat == 'diprovinsiin') Diprovinsiin
                                            @elseif($d->tindakan_rusak_berat == 'dimusnahkan') Dimusnahkan
                                            @else Diganti Baru
                                            @endif
                                        </span>
                                    @else
                                        <span class="text-gray-400">-</span>
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-sm">{{ $d->keterangan ?? '-' }}</td>
                            </tr>
                            @endforeach
                            <tr class="bg-gray-50 font-semibold">
                                <td colspan="3" class="px-4 py-3 text-sm text-right">TOTAL</td>
                                <td class="px-4 py-3 text-sm text-center text-yellow-600">{{ $totalRusakRingan }}</td>
                                <td class="px-4 py-3 text-sm"></td>
                                <td class="px-4 py-3 text-sm text-center text-red-600">{{ $totalRusakBerat }}</td>
                                <td colspan="2" class="px-4 py-3 text-sm"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Summary -->
            <div class="rounded-lg border p-6 bg-gray-50">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="text-center">
                        <p class="text-sm text-gray-500">Total Item Rusak</p>
                        <p class="text-2xl font-bold">{{ $item->detail->count() }}</p>
                    </div>
                    <div class="text-center">
                        <p class="text-sm text-gray-500">Total Rusak Ringan</p>
                        <p class="text-2xl font-bold text-yellow-600">{{ $totalRusakRingan }}</p>
                    </div>
                    <div class="text-center">
                        <p class="text-sm text-gray-500">Total Rusak Berat</p>
                        <p class="text-2xl font-bold text-red-600">{{ $totalRusakBerat }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
