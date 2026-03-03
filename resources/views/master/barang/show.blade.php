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
                <div class="space-y-6">
                <div>
                    <h3 class="text-sm font-semibold text-gray-900 border-b pb-2 mb-4">Informasi Barang</h3>
                    <dl class="grid grid-cols-2 gap-4">
                        <div>
                            <dt class="text-xs font-medium text-gray-500 uppercase">Kategori</dt>
                            <dd class="mt-1 text-sm font-medium text-gray-900">{{ $item->kategori->nama_kategori ?? '-' }}</dd>
                        </div>
                        <div>
                            <dt class="text-xs font-medium text-gray-500 uppercase">Pemeliharaan</dt>
                            <dd class="mt-1">
                                @if ($item->is_maintain)
                                    <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">Ya</span>
                                @else
                                    <span class="px-2 py-1 text-xs rounded bg-red-100 text-red-700">Tidak</span>
                                @endif
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
            </div>
        </div>
    </div>
</x-app-layout>