<x-app-layout>
    <div class="px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 py-4">
            <h1 class="text-xl font-semibold">Kategori Barang</h1>
            <button type="button" onclick="document.getElementById('dialog-create-kategori').showModal()" 
            class="btn btn-sm">
                <i class="fas fa-plus mr-2"></i>
                Tambah
            </button>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <table id="dt-kategori" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Keterangan</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($kategoris as $k)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $k->kode_kategori }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $k->nama_kategori }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $k->keterangan }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div class="inline-flex items-center gap-2">
                                    <button type="button" class="btn-secondary btn-sm"
                                        data-id="{{ $k->id }}"
                                        data-kode="{{ $k->kode_kategori }}"
                                        data-nama="{{ $k->nama_kategori }}"
                                        data-keterangan="{{ $k->keterangan }}"
                                        onclick="openEditKategori(this)">
                                        <i class="fas fa-edit mr-2"></i>
                                        Edit
                                    </button>
                                    <form method="POST" action="{{ route('kategori.destroy', $k) }}" onsubmit="return confirm('Hapus kategori ini?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn-destructive btn-sm">
                                            <i class="fas fa-trash-alt mr-2"></i>
                                            Hapus
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <dialog id="dialog-create-kategori" class="dialog w-full sm:max-w-[425px] max-h-[612px]" aria-labelledby="kategori-create-title" aria-describedby="kategori-create-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="kategori-create-title">Tambah Kategori</h2>
                <p id="kategori-create-desc">Masukkan informasi kategori baru.</p>
            </header>
            <section>
                <form method="POST" action="{{ route('kategori.store') }}" class="form grid gap-4">
                    @csrf
                    <div class="grid gap-3">
                        <label for="kode_kategori">Kode Kategori</label>
                        <input type="text" id="kode_kategori" name="kode_kategori" value="{{ old('kode_kategori') }}" autofocus />
                        @error('kode_kategori')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="nama_kategori">Nama Kategori</label>
                        <input type="text" id="nama_kategori" name="nama_kategori" value="{{ old('nama_kategori') }}" />
                        @error('nama_kategori')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="keterangan">Keterangan</label>
                        <textarea id="keterangan" name="keterangan">{{ old('keterangan') }}</textarea>
                        @error('keterangan')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <footer class="flex gap-2 justify-end mt-2">
                        <button type="button" class="btn-outline" onclick="this.closest('dialog').close()">Batal</button>
                        <button class="btn" type="submit">Simpan</button>
                    </footer>
                </form>
            </section>
            <button type="button" aria-label="Close dialog" onclick="this.closest('dialog').close()" class="absolute top-3 right-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18" /><path d="m6 6 12 12" /></svg>
            </button>
        </div>
    </dialog>

    <dialog id="dialog-edit-kategori" class="dialog w-full sm:max-w-[425px] max-h-[612px]" aria-labelledby="kategori-edit-title" aria-describedby="kategori-edit-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="kategori-edit-title">Edit Kategori</h2>
                <p id="kategori-edit-desc">Ubah informasi kategori.</p>
            </header>
            <section>
                <form id="form-edit-kategori" method="POST" class="form grid gap-4">
                    @csrf
                    @method('PUT')
                    <div class="grid gap-3">
                        <label for="edit_kode_kategori">Kode Kategori</label>
                        <input type="text" id="edit_kode_kategori" name="kode_kategori" />
                        @error('kode_kategori')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_nama_kategori">Nama Kategori</label>
                        <input type="text" id="edit_nama_kategori" name="nama_kategori" />
                        @error('nama_kategori')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_keterangan">Keterangan</label>
                        <textarea id="edit_keterangan" name="keterangan"></textarea>
                        @error('keterangan')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <footer class="flex gap-2 justify-end mt-2">
                        <button type="button" class="btn-outline" onclick="this.closest('dialog').close()">Batal</button>
                        <button class="btn" type="submit">Simpan</button>
                    </footer>
                </form>
            </section>
            <button type="button" aria-label="Close dialog" onclick="this.closest('dialog').close()" class="absolute top-3 right-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18" /><path d="m6 6 12 12" /></svg>
            </button>
        </div>
    </dialog>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.tailwind.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.7/js/jquery.dataTables.min.js"></script>
    <script>
        function openEditKategori(btn) {
            const id = btn.dataset.id;
            document.getElementById('edit_kode_kategori').value = btn.dataset.kode || '';
            document.getElementById('edit_nama_kategori').value = btn.dataset.nama || '';
            document.getElementById('edit_keterangan').value = btn.dataset.keterangan || '';
            const form = document.getElementById('form-edit-kategori');
            form.action = `{{ url('/kategori') }}/${id}`;
            document.getElementById('dialog-edit-kategori').showModal();
        }

        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-kategori').DataTable({
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
                            <button type="button" onclick="document.getElementById('dialog-create-kategori').showModal()" 
                            class="btn btn-sm">
                                <i class="fas fa-plus mr-2"></i>
                                Tambah
                            </button>
                        </div>
                    </section>
                    </div>
                    `
                }
            });
        });
            
            $('#dt-kategori').on('draw.dt', function() {
                console.log('saas');
                // Select the empty cell and insert custom HTML
                $('#dt-kategori .dataTables_empty').html('<div class="text-center py-8"><i class="fas fa-inbox text-gray-400 text-4xl mb-2"></i><p class="text-gray-600">Belum ada kategori barang.</p><p class="text-sm text-gray-500 mt-1">Silakan tambahkan kategori baru.</p></div>');
            });

    </script>
</x-app-layout>