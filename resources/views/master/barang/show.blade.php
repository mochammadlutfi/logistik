<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <!-- Header -->
        <div class="mb-6 flex justify-between gap-4">
            <div>
                <h1 class="text-2xl font-bold text-gray-900">Detail Barang</h1>
                <p class="text-sm text-gray-500 mt-1">Informasi lengkap inventori</p>
            </div>
            <div class="flex items-center gap-3">
                <a href="{{ route('barang.index') }}" class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 shadow-sm transition-all">
                    Kembali
                </a>
                <a href="{{ route('barang.edit', $item->id) }}" class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 shadow-sm transition-all">
                    Edit Barang
                </a>
            </div>
        </div>

        <!-- Single Card Container -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
            <!-- Hero / Stats Section -->
            <div class="bg-gradient-to-r from-gray-50 to-white border-b border-gray-100 p-6 md:p-8">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 items-center">
                    <!-- Identity -->
                    <div class="md:col-span-1">
                         <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-50 text-blue-700 mb-2">
                            {{ $item->kode_barang }}
                        </span>
                        <h2 class="text-xl font-bold text-gray-900">{{ $item->nama_barang }}</h2>
                        <div class="mt-2 flex items-center gap-2">
                             @if($item->is_active)
                                <span class="inline-flex items-center gap-1 text-xs font-medium text-green-700">
                                    <span class="w-2 h-2 rounded-full bg-green-500"></span> Aktif
                                </span>
                            @else
                                <span class="inline-flex items-center gap-1 text-xs font-medium text-red-700">
                                    <span class="w-2 h-2 rounded-full bg-red-500"></span> Nonaktif
                                </span>
                            @endif
                        </div>
                    </div>

                    <!-- Stats -->
                    <div class="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Total Stok</p>
                        <div class="mt-1 flex items-baseline gap-2">
                            <span class="text-2xl font-bold text-gray-900">{{ number_format($item->total_stock) }}</span>
                            <span class="text-sm text-gray-500">{{ $item->satuan->nama_satuan ?? 'Unit' }}</span>
                        </div>
                    </div>
                    
                    <div class="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Harga Satuan</p>
                        <div class="mt-1">
                            <span class="text-2xl font-bold text-gray-900">Rp {{ number_format($item->harga_satuan, 0, ',', '.') }}</span>
                        </div>
                    </div>

                     <div class="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Estimasi Nilai</p>
                        <div class="mt-1">
                            <span class="text-2xl font-bold text-gray-900">Rp {{ number_format($item->total_stock * $item->harga_satuan, 0, ',', '.') }}</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Body -->
            <div class="p-6 md:p-8">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 md:gap-12">
                     <!-- Left Col: Details -->
                     <div class="lg:col-span-1 space-y-6">
                        <div>
                            <h3 class="text-sm font-semibold text-gray-900 border-b pb-2 mb-4">Informasi Barang</h3>
                            <dl class="space-y-4">
                                <div>
                                    <dt class="text-xs font-medium text-gray-500 uppercase">Kategori</dt>
                                    <dd class="mt-1 text-sm font-medium text-gray-900">{{ $item->kategori->nama_kategori ?? '-' }}</dd>
                                </div>
                                <div>
                                    <dt class="text-xs font-medium text-gray-500 uppercase">Kondisi Fisik</dt>
                                    <dd class="mt-1">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium capitalize
                                            {{ $item->kondisi_fisik == 'baik' ? 'bg-green-100 text-green-800' : '' }}
                                            {{ $item->kondisi_fisik == 'rusak' ? 'bg-red-100 text-red-800' : '' }}
                                            {{ $item->kondisi_fisik == 'sedang' ? 'bg-yellow-100 text-yellow-800' : '' }}
                                            {{ $item->kondisi_fisik == 'habis' ? 'bg-gray-100 text-gray-800' : '' }}
                                        ">
                                            {{ $item->kondisi_fisik }}
                                        </span>
                                    </dd>
                                </div>
                                <div>
                                    <dt class="text-xs font-medium text-gray-500 uppercase">Lokasi Penyimpanan</dt>
                                    <dd class="mt-1 text-sm text-gray-900">{{ $item->lokasi_penyimpanan ?? '-' }}</dd>
                                </div>
                                <div>
                                    <dt class="text-xs font-medium text-gray-500 uppercase">Batas Stok</dt>
                                    <dd class="mt-1 text-sm text-gray-900">
                                        Min: {{ number_format($item->stok_minimum) }} / Max: {{ number_format($item->stok_maksimum) }}
                                    </dd>
                                </div>
                                <div>
                                    <dt class="text-xs font-medium text-gray-500 uppercase">Keterangan</dt>
                                    <dd class="mt-1 text-sm text-gray-600 leading-relaxed">{{ $item->keterangan ?? '-' }}</dd>
                                </div>
                            </dl>
                        </div>
                        
                        <!-- Timeline -->
                        <div class="pt-4 border-t border-gray-100">
                             <div class="flex items-center gap-2 text-xs text-gray-400">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                <span>Diperbarui {{ $item->updated_at->diffForHumans() }}</span>
                            </div>
                        </div>
                     </div>

                     <!-- Right Col: Warehouse Stock -->
                     <div class="lg:col-span-2">
                        <h3 class="text-sm font-semibold text-gray-900 border-b pb-2 mb-4">Distribusi Stok Gudang</h3>
                        @if($item->gudang->count() > 0)
                            <div class="bg-gray-50 rounded-lg border border-gray-200 overflow-hidden">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gray-100">
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Gudang</th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Lokasi Rak</th>
                                            <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Stok</th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        @foreach($item->gudang as $g)
                                            <tr>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                    {{ $g->nama_gudang }}
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap text-sm text-right font-medium text-gray-900">
                                                    {{ number_format($g->pivot->stok_tersedia) }}
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="bg-gray-50 rounded-lg border border-gray-200 p-8 text-center">
                                <svg class="mx-auto h-8 w-8 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"></path>
                                </svg>
                                <p class="mt-2 text-sm text-gray-500">Belum ada data stok tersimpan di gudang manapun.</p>
                            </div>
                        @endif
                     </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>