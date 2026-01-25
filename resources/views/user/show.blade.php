<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8 max-w-7xl mx-auto">
        
        <!-- Header Section -->
        <div class="mb-6">
            <div class="flex items-center justify-between flex-wrap gap-4">
                <div>
                    <h1 class="text-2xl font-bold text-gray-900">Detail Barang</h1>
                    <p class="text-sm text-gray-500 mt-1">Informasi lengkap tentang barang inventori</p>
                </div>
                <div class="flex items-center gap-2">
                    <a href="{{ route('barang.index') }}" 
                       class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                        Kembali
                    </a>
                    <a href="{{ route('barang.edit', $item->id) }}" 
                       class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors">
                        Edit Barang
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Content Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            
            <!-- Left Side - Details (2 columns) -->
            <div class="lg:col-span-2 space-y-6">
                
                <!-- Informasi Utama Card -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 bg-gradient-to-r from-blue-50 to-indigo-50 border-b border-gray-200">
                        <h2 class="text-lg font-semibold text-gray-900">Informasi Utama</h2>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            
                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Kode Barang</p>
                                <p class="text-base font-semibold text-gray-900">{{ $item->kode_barang }}</p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Nama Barang</p>
                                <p class="text-base font-semibold text-gray-900">{{ $item->nama_barang }}</p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Kategori</p>
                                <p class="text-base text-gray-900">
                                    {{ $item->kategori->nama_kategori ?? '-' }}
                                    @if($item->kategori)
                                        <span class="text-sm text-gray-500">({{ $item->kategori->kode_kategori }})</span>
                                    @endif
                                </p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Satuan</p>
                                <p class="text-base text-gray-900">
                                    {{ $item->satuan->nama_satuan ?? '-' }}
                                    @if($item->satuan)
                                        <span class="text-sm text-gray-500">— {{ $item->satuan->keterangan }}</span>
                                    @endif
                                </p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Kondisi Fisik</p>
                                <div class="inline-flex items-center">
                                    <span class="px-3 py-1 rounded-full text-sm font-medium 
                                        {{ $item->kondisi_fisik == 'baik' ? 'bg-green-100 text-green-700' : '' }}
                                        {{ $item->kondisi_fisik == 'rusak' ? 'bg-red-100 text-red-700' : '' }}
                                        {{ $item->kondisi_fisik == 'sedang' ? 'bg-yellow-100 text-yellow-700' : '' }}">
                                        {{ ucfirst($item->kondisi_fisik) }}
                                    </span>
                                </div>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Lokasi Penyimpanan</p>
                                <p class="text-base text-gray-900">{{ $item->lokasi_penyimpanan ?? '-' }}</p>
                            </div>

                            <div class="md:col-span-2 space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Keterangan</p>
                                <p class="text-base text-gray-700">{{ $item->keterangan ?? '-' }}</p>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Stok & Harga Card -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 bg-gradient-to-r from-emerald-50 to-teal-50 border-b border-gray-200">
                        <h2 class="text-lg font-semibold text-gray-900">Stok & Harga</h2>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            
                            <div class="bg-gradient-to-br from-blue-50 to-blue-100 rounded-lg p-4 border border-blue-200">
                                <p class="text-xs font-medium text-blue-700 uppercase tracking-wide mb-2">Stok Tersedia</p>
                                <p class="text-3xl font-bold text-blue-900">{{ number_format($item->stok_tersedia) }}</p>
                                <p class="text-xs text-blue-600 mt-1">{{ $item->satuan->nama_satuan ?? 'unit' }}</p>
                            </div>

                            <div class="bg-gradient-to-br from-purple-50 to-purple-100 rounded-lg p-4 border border-purple-200">
                                <p class="text-xs font-medium text-purple-700 uppercase tracking-wide mb-2">Harga Satuan</p>
                                <p class="text-2xl font-bold text-purple-900">
                                    Rp {{ number_format($item->harga_satuan, 0, ',', '.') }}
                                </p>
                                <p class="text-xs text-purple-600 mt-1">per {{ $item->satuan->nama_satuan ?? 'unit' }}</p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Stok Minimum</p>
                                <div class="flex items-baseline gap-2">
                                    <p class="text-2xl font-semibold text-gray-900">{{ number_format($item->stok_minimum) }}</p>
                                    @if($item->stok_tersedia <= $item->stok_minimum)
                                        <span class="px-2 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-700">
                                            Stok Rendah!
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Stok Maksimum</p>
                                <p class="text-2xl font-semibold text-gray-900">{{ number_format($item->stok_maksimum) }}</p>
                            </div>

                        </div>

                        <!-- Stock Progress Bar -->
                        @php
                            $percentage = 0;
                            if ($item->stok_maksimum > 0) {
                                $percentage = ($item->stok_tersedia / $item->stok_maksimum) * 100;
                            }
                        @endphp
                        <div class="mt-6 space-y-2">
                            <div class="flex items-center justify-between text-sm">
                                <span class="text-gray-600">Kapasitas Stok</span>
                                <span class="font-medium text-gray-900">
                                    {{ number_format($percentage, 1) }}%
                                </span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="h-2.5 rounded-full transition-all duration-500
                                    {{ $item->stok_tersedia <= $item->stok_minimum ? 'bg-red-500' : '' }}
                                    {{ $item->stok_tersedia > $item->stok_minimum && $item->stok_tersedia < $item->stok_maksimum * 0.7 ? 'bg-yellow-500' : '' }}
                                    {{ $item->stok_tersedia >= $item->stok_maksimum * 0.7 ? 'bg-green-500' : '' }}"
                                    style="width: {{ min($percentage, 100) }}%">
                                </div>
                            </div>
                            <div class="flex items-center justify-between text-xs text-gray-500">
                                <span>Min: {{ number_format($item->stok_minimum) }}</span>
                                <span>Max: {{ number_format($item->stok_maksimum) }}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Status & Timeline Card -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 bg-gradient-to-r from-amber-50 to-orange-50 border-b border-gray-200">
                        <h2 class="text-lg font-semibold text-gray-900">Status & Timeline</h2>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            
                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Status</p>
                                @if($item->is_active)
                                    <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-green-100 text-green-700 text-sm font-medium">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                        </svg>
                                        Aktif
                                    </span>
                                @else
                                    <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-red-100 text-red-700 text-sm font-medium">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                        </svg>
                                        Nonaktif
                                    </span>
                                @endif
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Dibuat Pada</p>
                                <p class="text-sm font-medium text-gray-900">{{ $item->created_at->format('d M Y') }}</p>
                                <p class="text-xs text-gray-500">{{ $item->created_at->format('H:i') }} WIB</p>
                            </div>

                            <div class="space-y-1">
                                <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Terakhir Diperbarui</p>
                                <p class="text-sm font-medium text-gray-900">{{ $item->updated_at->format('d M Y') }}</p>
                                <p class="text-xs text-gray-500">{{ $item->updated_at->diffForHumans() }}</p>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Side - Photo & Quick Info (1 column) -->
            <div class="lg:col-span-1 space-y-6">
                
                <!-- Photo Card -->
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden sticky top-6">
                    <div class="px-6 py-4 bg-gradient-to-r from-slate-50 to-gray-50 border-b border-gray-200">
                        <h2 class="text-lg font-semibold text-gray-900">Foto Barang</h2>
                    </div>
                    <div class="p-6">
                        <div class="aspect-square rounded-lg overflow-hidden bg-gray-50 border-2 border-dashed border-gray-200 flex items-center justify-center">
                            @if($item->foto_barang)
                                <img src="{{ asset('storage/' . $item->foto_barang) }}"
                                    alt="{{ $item->nama_barang }}"
                                    class="w-full h-full object-cover">
                            @else
                                <div class="text-center p-4">
                                    <svg class="mx-auto h-12 w-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                    <p class="mt-2 text-sm text-gray-500">Tidak ada foto</p>
                                </div>
                            @endif
                        </div>

                        <!-- Quick Actions -->
                        <div class="mt-4 space-y-2">
                            <button class="w-full px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors">
                                Ganti Foto
                            </button>
                            @if($item->foto_barang)
                            <button class="w-full px-4 py-2 text-sm font-medium text-red-600 bg-red-50 rounded-lg hover:bg-red-100 transition-colors">
                                Hapus Foto
                            </button>
                            @endif
                        </div>
                    </div>
                </div>

                <!-- Quick Summary Card -->
                <div class="bg-gradient-to-br from-indigo-500 to-purple-600 rounded-xl shadow-lg overflow-hidden text-white">
                    <div class="p-6">
                        <h3 class="text-lg font-semibold mb-4">Ringkasan</h3>
                        <div class="space-y-4">
                            <div class="flex items-center justify-between pb-3 border-b border-white/20">
                                <span class="text-sm opacity-90">Total Nilai Stok</span>
                                <span class="text-lg font-bold">
                                    Rp {{ number_format($item->stok_tersedia * $item->harga_satuan, 0, ',', '.') }}
                                </span>
                            </div>
                            <div class="flex items-center justify-between pb-3 border-b border-white/20">
                                <span class="text-sm opacity-90">Nilai per Unit</span>
                                <span class="text-lg font-bold">
                                    Rp {{ number_format($item->harga_satuan, 0, ',', '.') }}
                                </span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-sm opacity-90">Total Unit</span>
                                <span class="text-lg font-bold">{{ number_format($item->stok_tersedia) }}</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</x-app-layout>