<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                Dashboard
            </h1>
        </div>

            <!-- Stats Cards -->
            <div class="grid grid-cols-2 sm:grid-cols-2 gap-4 mb-8">
                <!-- Total Barang -->
                <div class="border rounded bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Barang</p>
                            <p class="text-3xl font-bold text-gray-800">{{ $barang }}</p>
                        </div>
                        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-box text-blue-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <!-- Total Stok -->
                <div class="border rounded bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Total Stok</p>
                            <p class="text-3xl font-bold text-gray-800">{{ $stok }}</p>
                        </div>
                        <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-warehouse text-green-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <!-- Permintaan Pending -->
                <div class="border rounded bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Permintaan Pending</p>
                            <p class="text-3xl font-bold text-gray-800">{{ $permintaan }}</p>
                            <p class="text-yellow-600 text-sm mt-2">
                                <i class="fas fa-clock"></i> Perlu approval
                            </p>
                        </div>
                        <div class="w-14 h-14 bg-yellow-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-clipboard-list text-yellow-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <!-- Low Stock Alert -->
                <div class="border rounded bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-500 text-sm mb-1">Stok Menipis</p>
                            <p class="text-3xl font-bold text-gray-800">8</p>
                            <p class="text-red-600 text-sm mt-2">
                                <i class="fas fa-exclamation-triangle"></i> Perlu restock
                            </p>
                        </div>
                        <div class="w-14 h-14 bg-red-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-exclamation-circle text-red-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- Tables Row -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- Low Stock Items -->
                <div class="bg-white rounded-lg shadow border">
                    <div class="p-6 border-b">
                        <div class="flex items-center justify-between">
                            <h3 class="text-lg font-semibold text-gray-800">Barang Stok Menipis</h3>
                            <a href="{{ route('barang.index') }}" class="btn btn-primary btn-sm">Lihat Semua</a>
                        </div>
                    </div>
                    <div class="p-6">
                        <table class="w-full">
                            <thead>
                                <tr class="text-left text-sm text-gray-500 border-b">
                                    <th class="pb-3">Kode</th>
                                    <th class="pb-3">Nama Barang</th>
                                    <th class="pb-3">Stok</th>
                                    <th class="pb-3">Status</th>
                                </tr>
                            </thead>
                            <tbody class="text-sm">
                                @forelse($low_stock_items as $item)
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">{{ $item->kode_barang }}</td>
                                    <td class="py-3">{{ $item->nama_barang }}</td>
                                    <td class="py-3 font-semibold">{{ $item->stok_total }}</td>
                                    <td class="py-3">
                                        @if($item->stok_total == 0)
                                            <span class="badge badge-danger">Habis</span>
                                        @else
                                            <span class="badge badge-warning">Rendah</span>
                                        @endif
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="4" class="py-3 text-center text-gray-500">Tidak ada barang dengan stok menipis</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- Recent Requests -->
                <div class="bg-white rounded-lg shadow border">
                    <div class="p-6 border-b">
                        <div class="flex items-center justify-between">
                            <h3 class="text-lg font-semibold text-gray-800">Permintaan Terbaru</h3>
                            <a href="{{ route('permintaan-barang.index') }}" class="btn-primary btn-sm">Lihat Semua</a>
                        </div>
                    </div>
                    <div class="p-6">
                        <table class="w-full">
                            <thead>
                                <tr class="text-left text-sm text-gray-500 border-b">
                                    <th class="pb-3">Kode</th>
                                    <th class="pb-3">Pemohon</th>
                                    <th class="pb-3">Tanggal</th>
                                    <th class="pb-3">Status</th>
                                </tr>
                            </thead>
                            <tbody class="text-sm">
                                @forelse($recent_requests as $req)
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">{{ $req->kode }}</td>
                                    <td class="py-3">{{ $req->pemohon->name ?? '-' }}</td>
                                    <td class="py-3">{{ \Carbon\Carbon::parse($req->tanggal)->format('d M Y') }}</td>
                                    <td class="py-3">
                                        @if($req->status == 'disetujui' || $req->status == 'selesai')
                                            <span class="badge badge-success">{{ ucfirst($req->status) }}</span>
                                        @elseif($req->status == 'ditolak')
                                            <span class="badge badge-danger">{{ ucfirst($req->status) }}</span>
                                        @else
                                            <span class="badge badge-warning">{{ ucfirst($req->status) }}</span>
                                        @endif
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="4" class="py-3 text-center text-gray-500">Belum ada permintaan barang</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </div>
    @push('styles')
        <style>
            .stat-card {
            transition: transform 0.2s;
        }
        
        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        
        .badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .badge-success { background-color: #d1fae5; color: #065f46; }
        .badge-warning { background-color: #fef3c7; color: #92400e; }
        .badge-danger { background-color: #fee2e2; color: #991b1b; }
        .badge-info { background-color: #dbeafe; color: #1e40af; }
        </style>
    @endpush
</x-app-layout>
