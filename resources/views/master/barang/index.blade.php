<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Barang</h1>
            <a href="{{ route('barang.create') }}" class="btn btn-sm btn-primary">
                <i class="fas fa-plus"></i>
                Tambah Barang
            </a>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">
            <table id="dt-barang" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kategori</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Satuan</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stok</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Harga</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kondisi</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->kode_barang }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->nama_barang }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->kategori?->nama_kategori }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->satuan?->nama_satuan }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->stok_tersedia }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ number_format((float) $item->harga_satuan, 2, '.', ',') }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ ucfirst($item->kondisi_fisik) }}</td>
                            <td class="px-4 py-3 text-sm">
                                @if ($item->is_active)
                                    <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">Aktif</span>
                                @else
                                    <span class="px-2 py-1 text-xs rounded bg-gray-100 text-gray-700">Nonaktif</span>
                                @endif
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
                                            <a role="menuitem" href="{{ route('barang.show', $item->id) }}">
                                                Detail
                                            </a>
                                            <a role="menuitem" href="{{ route('barang.edit', $item->id) }}">
                                                Ubah
                                            </a>
                                            <form action="{{ route('barang.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Apakah Anda yakin ingin menghapus barang ini?');">
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
        function openEditBarang(btn) {
            const id = btn.dataset.id;
            document.getElementById('edit_kode_barang').value = btn.dataset.kode || '';
            document.getElementById('edit_nama_barang').value = btn.dataset.nama || '';
            document.getElementById('edit_kategori_id').value = btn.dataset.kategori || '';
            document.getElementById('edit_satuan_id').value = btn.dataset.satuan || '';
            document.getElementById('edit_stok_tersedia').value = btn.dataset.stok || 0;
            document.getElementById('edit_stok_minimum').value = btn.dataset.stokmin || 0;
            document.getElementById('edit_stok_maksimum').value = btn.dataset.stokmax || 0;
            document.getElementById('edit_harga_satuan').value = btn.dataset.harga || 0;
            document.getElementById('edit_lokasi_penyimpanan').value = btn.dataset.lokasi || '';
            document.getElementById('edit_kondisi_fisik').value = btn.dataset.kondisi || 'baik';
            document.getElementById('edit_foto_barang').value = btn.dataset.foto || '';
            document.getElementById('edit_keterangan').value = btn.dataset.keterangan || '';
            document.getElementById('edit_is_active').value = btn.dataset.active === '1' ? '1' : '0';
            const form = document.getElementById('form-edit-barang');
            form.action = `{{ url('/barang') }}/${id}`;
            document.getElementById('dialog-edit-barang').showModal();
        }

        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-barang').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                pageLength: 10,
                columnDefs: [ { orderable: false, targets: 8 } ]
            });
        });
    </script>
</x-app-layout>