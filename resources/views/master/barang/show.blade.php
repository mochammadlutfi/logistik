<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8 max-w-6xl mx-auto">
        <!-- Header -->
        <div class="mb-6 flex justify-between items-start sm:items-center gap-4">
            <div>
                <h1 class="text-2xl font-bold text-gray-900">Detail Barang</h1>
                <p class="text-sm text-gray-500 mt-1">Informasi lengkap inventori dan status stok terkini</p>
            </div>
            <div class="flex items-center gap-3">
                <a href="{{ route('barang.index') }}" class="inline-flex justify-center items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 shadow-sm transition-all focus:outline-none focus:ring-2 focus:ring-gray-200">
                    <i class="fa-solid fa-arrow-left mr-2"></i> Kembali
                </a>
                <a href="{{ route('barang.edit', $item->id) }}" class="inline-flex justify-center items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 shadow-sm transition-all focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <i class="fa-solid fa-pen-to-square mr-2"></i> Edit Barang
                </a>
            </div>
        </div>

        <!-- Single Card Container -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
            <!-- Product Identity Header -->
            <div class="border-b border-gray-100 p-6 md:p-8 bg-gray-50/50">
                <div class="flex flex-row justify-between items-start md:items-center gap-6 mb-8">
                    <div>
                        <div class="flex flex-wrap items-center gap-3 mb-3">
                            <span class="inline-flex items-center px-3 py-1 rounded-md text-xs font-semibold bg-white text-gray-700 border border-gray-200 tracking-wide shadow-sm">
                                <i class="fa-solid fa-barcode mr-1.5 text-gray-400"></i> {{ $item->kode_barang }}
                            </span>
                            @if($item->is_active)
                                <span class="inline-flex items-center gap-1.5 text-xs font-semibold text-green-700 bg-green-50 px-3 py-1 rounded-md border border-green-200">
                                    <span class="w-1.5 h-1.5 rounded-full bg-green-500"></span> Aktif
                                </span>
                            @else
                                <span class="inline-flex items-center gap-1.5 text-xs font-semibold text-red-700 bg-red-50 px-3 py-1 rounded-md border border-red-200">
                                    <span class="w-1.5 h-1.5 rounded-full bg-red-500"></span> Nonaktif
                                </span>
                            @endif
                        </div>
                        <h2 class="text-3xl font-bold text-gray-900">{{ $item->nama_barang }}</h2>
                        <p class="text-sm font-medium text-blue-600 mt-2 flex items-center gap-1.5">
                            <i class="fa-regular fa-folder-open"></i> {{ $item->kategori->nama_kategori ?? 'Tanpa Kategori' }}
                        </p>
                    </div>
                    <div class="md:text-right bg-white p-4 rounded-xl border border-blue-100 shadow-sm min-w-[240px]">
                        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1">Estimasi Nilai Total</p>
                        <p class="text-3xl font-bold text-gray-900 tracking-tight">Rp {{ number_format($item->total_stock * $item->harga_satuan, 0, ',', '.') }}</p>
                    </div>
                </div>

                <!-- Stock Summary Grid -->
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                    <div class="bg-white border border-gray-200 rounded-xl p-4 shadow-sm relative overflow-hidden group hover:border-blue-200 transition-colors">
                        <div class="absolute right-0 top-0 h-full w-1 bg-gray-300"></div>
                        <p class="text-[11px] font-semibold text-gray-500 uppercase tracking-widest mb-1.5 flex items-center gap-1.5">
                            <i class="fa-solid fa-boxes-stacked opacity-70"></i> Total Stok Gudang
                        </p>
                        <div class="flex items-baseline gap-1.5">
                            <span class="text-3xl font-bold text-gray-900">{{ number_format($item->stok_total ?? 0) }}</span>
                            <span class="text-sm font-medium text-gray-500">{{ $item->satuan->nama_satuan ?? 'Unit' }}</span>
                        </div>
                    </div>
                    <div class="bg-white border border-green-100 rounded-xl p-4 shadow-sm relative overflow-hidden group hover:border-green-300 transition-colors">
                        <div class="absolute right-0 top-0 h-full w-1 bg-green-500"></div>
                        <p class="text-[11px] font-semibold text-green-600 uppercase tracking-widest mb-1.5 flex items-center gap-1.5">
                            <i class="fa-solid fa-check opacity-70"></i> Kondisi Baik
                        </p>
                        <div class="flex items-baseline gap-1.5">
                            <span class="text-3xl font-bold text-green-700">{{ number_format($item->stokGudang?->baik ?? 0) }}</span>
                        </div>
                    </div>
                    <div class="bg-white border border-yellow-100 rounded-xl p-4 shadow-sm relative overflow-hidden group hover:border-yellow-300 transition-colors">
                        <div class="absolute right-0 top-0 h-full w-1 bg-yellow-400"></div>
                        <p class="text-[11px] font-semibold text-yellow-600 uppercase tracking-widest mb-1.5 flex items-center gap-1.5">
                            <i class="fa-solid fa-wrench opacity-70"></i> Rusak Ringan
                        </p>
                        <div class="flex items-baseline gap-1.5">
                            <span class="text-3xl font-bold text-yellow-700">{{ number_format($item->stokGudang?->rusak_ringan ?? 0) }}</span>
                        </div>
                    </div>
                    <div class="bg-white border border-red-100 rounded-xl p-4 shadow-sm relative overflow-hidden group hover:border-red-300 transition-colors">
                        <div class="absolute right-0 top-0 h-full w-1 bg-red-500"></div>
                        <p class="text-[11px] font-semibold text-red-600 uppercase tracking-widest mb-1.5 flex items-center gap-1.5">
                            <i class="fa-solid fa-triangle-exclamation opacity-70"></i> Rusak Berat
                        </p>
                        <div class="flex items-baseline gap-1.5">
                            <span class="text-3xl font-bold text-red-700">{{ number_format($item->stokGudang?->rusak_berat ?? 0) }}</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Body -->
            <div class="p-6 md:p-8 grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12">
                <!-- Data Spesifikasi -->
                <div>
                     <h3 class="text-sm font-bold text-gray-900 border-b border-gray-100 pb-3 mb-5 uppercase tracking-wider flex items-center gap-2">
                        <i class="fa-solid fa-list-ul text-gray-400"></i> Spesifikasi & Detail
                    </h3>
                    <div class="space-y-4">
                        <div class="flex flex-row sm:justify-between sm:items-center py-2 border-b border-gray-50 border-dashed">
                            <span class="text-sm font-medium text-gray-500 mb-1 sm:mb-0">Harga Satuan</span>
                            <span class="text-base font-semibold text-gray-900 bg-gray-50 px-3 py-1 rounded-md">Rp {{ number_format($item->harga_satuan, 0, ',', '.') }}</span>
                        </div>
                        <div class="flex flex-row sm:justify-between sm:items-center py-2 border-b border-gray-50 border-dashed">
                            <span class="text-sm font-medium text-gray-500 mb-1 sm:mb-0">Lokasi Penyimpanan</span>
                            <span class="text-sm font-semibold text-gray-900 flex items-center gap-1.5">
                                <i class="fa-solid fa-location-dot text-blue-500"></i> {{ $item->lokasi_penyimpanan ?? '-' }}
                            </span>
                        </div>
                        <div class="flex flex-row sm:justify-between sm:items-center py-2 border-b border-gray-50 border-dashed">
                            <span class="text-sm font-medium text-gray-500 mb-1 sm:mb-0">Pemeliharaan Rutin</span>
                            <span class="text-sm font-semibold">
                                @if ($item->is_maintain)
                                    <span class="inline-flex items-center text-indigo-700 bg-indigo-50 px-2 py-0.5 rounded border border-indigo-100"><i class="fa-solid fa-check mr-1.5 text-[10px]"></i> Ya</span>
                                @else
                                    <span class="inline-flex items-center text-gray-500 bg-gray-50 px-2 py-0.5 rounded border border-gray-200"><i class="fa-solid fa-minus mr-1.5 text-[10px]"></i> Tidak</span>
                                @endif
                            </span>
                        </div>
                        <div class="flex flex-row sm:justify-between sm:items-center py-2 border-b border-gray-50 border-dashed">
                            <span class="text-sm font-medium text-gray-500 mb-1 sm:mb-0">Batas Stok Minimal</span>
                            <span class="text-sm font-semibold {{ $item->stok_total <= $item->stok_minimum ? 'text-red-600 bg-red-50 px-2.5 py-0.5 rounded border border-red-100' : 'text-gray-900' }}">
                                {{ number_format($item->stok_minimum) }} {{ $item->satuan->nama_satuan ?? '' }}
                            </span>
                        </div>
                        <div class="flex flex-row sm:justify-between sm:items-center py-2">
                            <span class="text-sm font-medium text-gray-500 mb-1 sm:mb-0">Batas Stok Maksimal</span>
                            <span class="text-sm font-semibold {{ $item->stok_total >= $item->stok_maksimum ? 'text-yellow-600 bg-yellow-50 px-2.5 py-0.5 rounded border border-yellow-100' : 'text-gray-900' }}">
                                {{ number_format($item->stok_maksimum) }} {{ $item->satuan->nama_satuan ?? '' }}
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Keterangan & Timeline -->
                <div class="space-y-8">
                     <div>
                        <h3 class="text-sm font-bold text-gray-900 border-b border-gray-100 pb-3 mb-5 uppercase tracking-wider flex items-center gap-2">
                            <i class="fa-regular fa-file-lines text-gray-400"></i> Keterangan Tambahan
                        </h3>
                        <div class="bg-gray-50 rounded-xl p-5 border border-gray-100 min-h-[140px]">
                            @if($item->keterangan)
                                <p class="text-sm text-gray-600 leading-relaxed whitespace-pre-wrap">{{ $item->keterangan }}</p>
                            @else
                                <p class="text-sm text-gray-400 italic text-center mt-6">Belum ada keterangan untuk barang ini.</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>