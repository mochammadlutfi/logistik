<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Pengguna</h1>
            <a href="{{ route('user.create') }}" class="btn btn-sm btn-primary">
                <i class="fas fa-plus"></i>
                Tambah Pengguna
            </a>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">
            <table id="dt-user" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jabatan</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Dibuat</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->nama }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->email }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->role }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->created_at }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div id="action-dropdown-{{ $item->id }}" class="dropdown-menu">
                                    <button type="button" id="action-dropdown-{{ $item->id }}-trigger" aria-haspopup="menu" aria-controls="action-dropdown-{{ $item->id }}-menu" aria-expanded="false"
                                         class="btn-secondary btn-sm">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </button>
                                    <div id="action-dropdown-{{ $item->id }}-popover" data-popover aria-hidden="true" data-align="end" class="min-w-56">
                                        <div role="menu" id="action-dropdown-{{ $item->id }}-menu" aria-labelledby="action-dropdown-{{ $item->id }}-trigger">
                                        <div role="group" aria-labelledby="account-options">
                                            <a role="menuitem" href="{{ route('user.edit', $item->id) }}">
                                                Ubah
                                            </a>
                                            <button type="button" onclick="document.getElementById('dialog-hapus-{{ $item->id }}').showModal()" role="menuitem">
                                                Hapus
                                            </button>

                                            <dialog id="dialog-hapus-{{ $item->id }}" class="dialog w-full sm:max-w-md max-h-[90vh] rounded-xl shadow-2xl border border-gray-200 bg-white" aria-labelledby="dialog-hapus-{{ $item->id }}-title" aria-describedby="dialog-hapus-{{ $item->id }}-description" onclick="if (event.target === this) this.close()">
                                                <div class="p-6">
                                                    <!-- Header -->
                                                    <div class="flex items-center justify-between mb-4">
                                                        <div class="flex items-center gap-3">
                                                            <div class="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center">
                                                                <i class="fas fa-exclamation-triangle text-red-600"></i>
                                                            </div>
                                                            <div>
                                                                <h2 id="dialog-hapus-{{ $item->id }}-title" class="text-lg font-semibold text-gray-900">Konfirmasi Hapus</h2>
                                                                <p id="dialog-hapus-{{ $item->id }}-description" class="text-sm text-gray-500">Apakah Anda yakin ingin menghapus barang ini?</p>
                                                            </div>
                                                        </div>
                                                        <button type="button" aria-label="Close dialog" onclick="this.closest('dialog').close()" class="text-gray-400 hover:text-gray-600 transition-colors">
                                                            <i class="fas fa-times text-lg"></i>
                                                        </button>
                                                    </div>

                                                    <!-- Body -->
                                                    <div class="mb-6">
                                                        <div class="bg-gray-50 rounded-lg p-4 mb-4">
                                                            <div class="flex items-center gap-3">
                                                                <i class="fas fa-box text-gray-400"></i>
                                                                <div>
                                                                    <p class="font-medium text-gray-900">{{ $item->nama_barang }}</p>
                                                                    <p class="text-sm text-gray-500">Kode: {{ $item->kode_barang }}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex items-start gap-3 p-3 bg-yellow-50 rounded-lg border border-yellow-200">
                                                            <i class="fas fa-info-circle text-yellow-600 mt-0.5"></i>
                                                            <p class="text-sm text-yellow-800">
                                                                <strong>Perhatian:</strong> Pengguna yang dihapus tidak dapat dikembalikan. Semua data terkait akan hilang permanen.
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <!-- Footer -->
                                                    <div class="flex justify-end gap-3">
                                                        <button type="button" onclick="this.closest('dialog').close()" class="btn btn-outline btn-sm">
                                                            <i class="fas fa-times mr-2"></i>Batal
                                                        </button>
                                                        <form action="{{ route('user.destroy', $item->id) }}" method="POST" class="inline">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm">
                                                                <i class="fas fa-trash mr-2"></i>Hapus
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </dialog>
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
            $('#dt-user').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                pageLength: 10,
                columnDefs: [ { orderable: false, targets: 8 } ]
            });
        });
    </script>
</x-app-layout>