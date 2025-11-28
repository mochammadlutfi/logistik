<x-app-layout>
    <div class="p-4 sm:p-6 lg:p-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Satuan Barang</h1>
            <button type="button" onclick="document.getElementById('dialog-create-satuan').showModal()" 
            class="btn btn-sm">
                <i class="fas fa-plus mr-2"></i>
                Tambah
            </button>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <table id="dt-satuan" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Satuan</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Keterangan</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->nama_satuan }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->keterangan }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div class="inline-flex items-center gap-2">
                                    <button type="button" class="btn-secondary btn-sm"
                                        data-id="{{ $item->id }}"
                                        data-nama="{{ $item->nama_satuan }}"
                                        data-keterangan="{{ $item->keterangan }}"
                                        onclick="openEditSatuan(this)">
                                        <i class="fas fa-edit mr-2"></i>
                                        Edit
                                    </button>
                                    <form method="POST" action="{{ route('satuan.destroy', $item) }}" onsubmit="return confirm('Hapus satuan ini?')">
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

    <dialog id="dialog-create-satuan" class="dialog w-full sm:max-w-[425px] max-h-[612px]" aria-labelledby="create-title" aria-describedby="create-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="create-title">Tambah Satuan</h2>
                <p id="create-desc">Masukkan informasi satuan baru.</p>
            </header>
            <section>
                <form method="POST" action="{{ route('satuan.store') }}" class="form grid gap-4">
                    @csrf
                    <div class="grid gap-3">
                        <label for="nama_satuan">Nama Satuan</label>
                        <input type="text" id="nama_satuan" name="nama_satuan" value="{{ old('nama_satuan') }}" autofocus />
                        @error('nama_satuan')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
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

    <dialog id="dialog-edit-satuan" class="dialog w-full sm:max-w-[425px] max-h-[612px]" aria-labelledby="edit-title" aria-describedby="edit-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="edit-title">Edit Satuan</h2>
                <p id="edit-desc">Ubah informasi satuan.</p>
            </header>
            <section>
                <form id="form-edit-satuan" method="POST" class="form grid gap-4">
                    @csrf
                    @method('PUT')
                    <div class="grid gap-3">
                        <label for="edit_nama_satuan">Nama Satuan</label>
                        <input type="text" id="edit_nama_satuan" name="nama_satuan" />
                        @error('nama_satuan')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
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
        function openEditSatuan(btn) {
            const id = btn.dataset.id;
            const nama = btn.dataset.nama;
            const ket = btn.dataset.keterangan;
            document.getElementById('edit_nama_satuan').value = nama || '';
            document.getElementById('edit_keterangan').value = ket || '';
            const form = document.getElementById('form-edit-satuan');
            form.action = `{{ url('/satuan') }}/${id}`;
            document.getElementById('dialog-edit-satuan').showModal();
        }

        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-satuan').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                pageLength: 10,
                columnDefs: [ { orderable: false, targets: 2 } ],
                language: {
                    emptyTable: `
                    <div class="flex min-w-0 flex-1 flex-col items-center justify-center gap-6 rounded-lg border-dashed p-6 text-center text-balance md:p-12 text-neutral-800 dark:text-neutral-300">
                    <header class="flex max-w-sm flex-col items-center gap-2 text-center">
                        <div class="mb-2 [&_svg]:pointer-events-none [&_svg]:shrink-0 bg-muted text-foreground flex size-10 shrink-0 items-center justify-center rounded-lg [&_svg:not([class*='size-'])]:size-6">
                            <i class="fas fa-box-open text-2xl"></i>
                        </div>
                        <h3 class="text-lg font-medium tracking-tight">Data Satuan Barang Tidak Tersedia</h3>
                        <p class="text-muted-foreground [&>a:hover]:text-primary text-sm/relaxed [&>a]:underline [&>a]:underline-offset-4">
                        Silakan tambahkan Satuan baru.
                        </p>
                    </header>
                    <section class="flex w-full max-w-sm min-w-0 flex-col items-center gap-4 text-sm text-balance">
                        <div class="flex gap-2">
                            <button type="button" onclick="document.getElementById('dialog-create-satuan').showModal()" 
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
    </script>
</x-app-layout>