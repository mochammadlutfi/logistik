<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Laporan Kerusakan Barang</h1>
            <a href="{{ route('laporan-kerusakan.create') }}" class="btn btn-sm btn-primary">
                <i class="fas fa-plus"></i>
                Tambah Laporan Kerusakan
            </a>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">
            <table id="dt-laporan-kerusakan" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tanggal</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Sumber Pemeliharaan</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Petugas</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Item Rusak</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900 font-medium">{{ $item->kode }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ \Carbon\Carbon::parse($item->tanggal)->format('d-m-Y') }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">
                                <a href="{{ route('pemeliharaan-barang.show', $item->pemeliharaan_id) }}" class="text-blue-600 hover:underline">
                                    {{ $item->pemeliharaan->kode }}
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->petugas->name }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">
                                @if($item->status == 'selesai')
                                    <span class="bg-green-500 text-white px-2 py-1 rounded text-xs font-semibold">Selesai</span>
                                @elseif($item->status == 'diproses')
                                    <span class="bg-blue-500 text-white px-2 py-1 rounded text-xs font-semibold">Diproses</span>
                                @else
                                    <span class="bg-yellow-500 text-white px-2 py-1 rounded text-xs font-semibold">Pending</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700">
                                {{ $item->detail()->sum('rusak_ringan') + $item->detail()->sum('rusak_berat') }} items
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div id="action-dropdown-{{ $item->id }}" class="dropdown-menu">
                                    <button type="button" id="action-dropdown-{{ $item->id }}-trigger" aria-haspopup="menu" aria-controls="action-dropdown-{{ $item->id }}-menu" aria-expanded="false"
                                         class="btn-secondary btn-sm">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </button>
                                    <div id="action-dropdown-{{ $item->id }}-popover" data-popover aria-hidden="true" data-align="end" class="min-w-56">
                                        <div role="menu" id="action-dropdown-{{ $item->id }}-menu" aria-labelledby="action-dropdown-{{ $item->id }}-trigger">
                                        <div role="group" aria-labelledby="account-options">
                                            <a role="menuitem" href="{{ route('laporan-kerusakan.show', $item->id) }}">
                                                Detail
                                            </a>
                                            <a role="menuitem" href="{{ route('laporan-kerusakan.edit', $item->id) }}">
                                                Ubah
                                            </a>
                                            <form action="{{ route('laporan-kerusakan.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Apakah Anda yakin ingin menghapus laporan ini?');">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" role="menuitem">
                                                    Hapus
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    </div>

                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.tailwind.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.7/js/jquery.dataTables.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-laporan-kerusakan').DataTable({
                order: [[1, 'desc']],
                language: {
                    url: '//cdn.datatables.net/plug-ins/2.0.7/i18n/id.json',
                },
            });
        });
    </script>
</x-app-layout>
