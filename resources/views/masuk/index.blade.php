<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Barang Masuk</h1>
            <a href="{{ route('barang-masuk.create') }}" class="btn btn-sm btn-primary">
                <i class="fas fa-plus"></i>
                Tambah Barang Masuk
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
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tanggal</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Supplier</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Sumber</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jumlah Barang</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->kode }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ \Carbon\Carbon::parse($item->tanggal)->format('d-m-Y') }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->supplier?->nama_supplier }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->sumber_barang }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->detail()->count() }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div id="action-dropdown-{{ $item->id }}" class="dropdown-menu">
                                    <button type="button" id="action-dropdown-{{ $item->id }}-trigger" aria-haspopup="menu" aria-controls="action-dropdown-{{ $item->id }}-menu" aria-expanded="false"
                                         class="btn-secondary btn-sm">
                                        <i class="fas fa-ellipsis-v"></i>
                                    </button>
                                    <div id="action-dropdown-{{ $item->id }}-popover" data-popover aria-hidden="true" data-align="end" class="min-w-56">
                                        <div role="menu" id="action-dropdown-{{ $item->id }}-menu" aria-labelledby="action-dropdown-{{ $item->id }}-trigger">
                                        <div role="group" aria-labelledby="account-options">
                                            <a role="menuitem" href="{{ route('barang-masuk.show', $item->id) }}">
                                                Detail
                                            </a>
                                            <a role="menuitem" href="{{ route('barang-masuk.edit', $item->id) }}">
                                                Ubah
                                            </a>
                                            <form action="{{ route('barang-masuk.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Apakah Anda yakin ingin menghapus barang ini?');">
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
            $('#dt-barang').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                pageLength: 10,
                columnDefs: [ { orderable: false, targets: 3 } ],
                language: {
                    emptyTable: `
                    <div class="flex min-w-0 flex-1 flex-col items-center justify-center gap-6 rounded-lg border-dashed p-6 text-center text-balance md:p-12 text-neutral-800 dark:text-neutral-300">
                    <header class="flex max-w-sm flex-col items-center gap-2 text-center">
                        <div class="mb-2 [&_svg]:pointer-events-none [&_svg]:shrink-0 bg-muted text-foreground flex size-10 shrink-0 items-center justify-center rounded-lg [&_svg:not([class*='size-'])]:size-6">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 10.5 8 13l2 2.5" /><path d="m14 10.5 2 2.5-2 2.5" /><path d="M20 20a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.9a2 2 0 0 1-1.69-.9L9.6 3.9A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2z" /></svg>
                        </div>
                        <h3 class="text-lg font-medium tracking-tight">Data Kategori Barang Tidak Tersedia</h3>
                        <p class="text-muted-foreground [&>a:hover]:text-primary text-sm/relaxed [&>a]:underline [&>a]:underline-offset-4">
                        Silakan tambahkan kategori baru.
                        </p>
                    </header>
                    <section class="flex w-full max-w-sm min-w-0 flex-col items-center gap-4 text-sm text-balance">
                        <div class="flex gap-2">
                            <a href="{{ route('barang-masuk.create') }}" class="btn btn-sm">
                                <i class="fas fa-plus mr-2"></i>
                                Tambah
                            </a>
                        </div>
                    </section>
                    </div>
                    `
                }
            });
        });
    </script>
</x-app-layout>