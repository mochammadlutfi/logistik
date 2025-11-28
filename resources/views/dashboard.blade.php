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
                            <p class="text-3xl font-bold text-gray-800">12</p>
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
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">10000003</td>
                                    <td class="py-3">SHIM PACK</td>
                                    <td class="py-3 font-semibold">8</td>
                                    <td class="py-3"><span class="badge badge-danger">Kritis</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">10000020</td>
                                    <td class="py-3">CUP BEARING</td>
                                    <td class="py-3 font-semibold">12</td>
                                    <td class="py-3"><span class="badge badge-warning">Rendah</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">10000048</td>
                                    <td class="py-3">FILTER AIR</td>
                                    <td class="py-3 font-semibold">15</td>
                                    <td class="py-3"><span class="badge badge-warning">Rendah</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">10000086</td>
                                    <td class="py-3">ADAPTER</td>
                                    <td class="py-3 font-semibold">9</td>
                                    <td class="py-3"><span class="badge badge-danger">Kritis</span></td>
                                </tr>
                                <tr>
                                    <td class="py-3 text-gray-600">10000091</td>
                                    <td class="py-3">BEARING CONE</td>
                                    <td class="py-3 font-semibold">11</td>
                                    <td class="py-3"><span class="badge badge-warning">Rendah</span></td>
                                </tr>
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
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">REQ-001</td>
                                    <td class="py-3">Budi Santoso</td>
                                    <td class="py-3">18 Nov 2025</td>
                                    <td class="py-3"><span class="badge badge-warning">Pending</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">REQ-002</td>
                                    <td class="py-3">Siti Nurhaliza</td>
                                    <td class="py-3">18 Nov 2025</td>
                                    <td class="py-3"><span class="badge badge-warning">Pending</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">REQ-003</td>
                                    <td class="py-3">Ahmad Yani</td>
                                    <td class="py-3">17 Nov 2025</td>
                                    <td class="py-3"><span class="badge badge-success">Disetujui</span></td>
                                </tr>
                                <tr class="border-b">
                                    <td class="py-3 text-gray-600">REQ-004</td>
                                    <td class="py-3">Rina Kusuma</td>
                                    <td class="py-3">17 Nov 2025</td>
                                    <td class="py-3"><span class="badge badge-success">Disetujui</span></td>
                                </tr>
                                <tr>
                                    <td class="py-3 text-gray-600">REQ-005</td>
                                    <td class="py-3">Joko Widodo</td>
                                    <td class="py-3">16 Nov 2025</td>
                                    <td class="py-3"><span class="badge badge-danger">Ditolak</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="mt-8 bg-gradient-to-r from-blue-600 to-blue-700 rounded-lg shadow p-8 text-white">
                <h3 class="text-xl font-semibold mb-4">Quick Actions</h3>
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <button class="bg-white bg-opacity-20 hover:bg-opacity-30 rounded-lg p-4 text-center transition">
                        <i class="fas fa-plus-circle text-3xl mb-2"></i>
                        <p class="text-sm font-semibold">Barang Masuk</p>
                    </button>
                    <button class="bg-white bg-opacity-20 hover:bg-opacity-30 rounded-lg p-4 text-center transition">
                        <i class="fas fa-minus-circle text-3xl mb-2"></i>
                        <p class="text-sm font-semibold">Barang Keluar</p>
                    </button>
                    <button class="bg-white bg-opacity-20 hover:bg-opacity-30 rounded-lg p-4 text-center transition">
                        <i class="fas fa-clipboard-list text-3xl mb-2"></i>
                        <p class="text-sm font-semibold">Buat Permintaan</p>
                    </button>
                    <button class="bg-white bg-opacity-20 hover:bg-opacity-30 rounded-lg p-4 text-center transition">
                        <i class="fas fa-file-alt text-3xl mb-2"></i>
                        <p class="text-sm font-semibold">Buat Laporan</p>
                    </button>
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
