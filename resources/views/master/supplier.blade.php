<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Supplier</h1>
            <button type="button" onclick="document.getElementById('dialog-create-supplier').showModal()" class="btn btn-sm">Tambah</button>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <table id="dt-supplier" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kontak</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->kode_supplier }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->nama_supplier }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->no_telepon }} | {{ $item->email }}</td>
                            <td class="px-4 py-3 text-sm">
                                @if ($item->is_active)
                                    <span class="px-2 py-1 text-xs rounded bg-green-100 text-green-700">Aktif</span>
                                @else
                                    <span class="px-2 py-1 text-xs rounded bg-gray-100 text-gray-700">Nonaktif</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700 text-right">
                                <div class="inline-flex items-center gap-2">
                                    <button type="button" class="btn-secondary btn-sm"
                                        data-id="{{ $item->id }}"
                                        data-kode="{{ $item->kode_supplier }}"
                                        data-nama="{{ $item->nama_supplier }}"
                                        data-alamat="{{ $item->alamat }}"
                                        data-telepon="{{ $item->no_telepon }}"
                                        data-email="{{ $item->email }}"
                                        data-kontak="{{ $item->kontak_person }}"
                                        data-active="{{ $item->is_active ? '1' : '0' }}"
                                        onclick="openEditSupplier(this)">
                                        <i class="fas fa-edit mr-2"></i>
                                        Edit
                                    </button>
                                    <form method="POST" action="{{ route('supplier.destroy', $item) }}" onsubmit="return confirm('Hapus supplier ini?')">
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

    <dialog id="dialog-create-supplier" class="dialog w-full sm:max-w-[600px] max-h-[80vh]" aria-labelledby="supplier-create-title" aria-describedby="supplier-create-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="supplier-create-title">Tambah Supplier</h2>
                <p id="supplier-create-desc">Masukkan informasi supplier baru.</p>
            </header>
            <section>
                <form method="POST" action="{{ route('supplier.store') }}" class="form grid gap-4">
                    @csrf
                    <div class="grid gap-3">
                        <label for="kode_supplier">Kode Supplier</label>
                        <input type="text" id="kode_supplier" name="kode_supplier" value="{{ old('kode_supplier') }}" autofocus />
                        @error('kode_supplier')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="nama_supplier">Nama Supplier</label>
                        <input type="text" id="nama_supplier" name="nama_supplier" value="{{ old('nama_supplier') }}" />
                        @error('nama_supplier')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="alamat">Alamat</label>
                        <textarea id="alamat" name="alamat">{{ old('alamat') }}</textarea>
                        @error('alamat')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="no_telepon">No. Telepon</label>
                            <input type="text" id="no_telepon" name="no_telepon" value="{{ old('no_telepon') }}" />
                            @error('no_telepon')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="{{ old('email') }}" />
                            @error('email')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="kontak_person">Kontak Person</label>
                            <input type="text" id="kontak_person" name="kontak_person" value="{{ old('kontak_person') }}" />
                            @error('kontak_person')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="is_active">Status Aktif</label>
                            <select id="is_active" name="is_active">
                                <option value="1" {{ old('is_active', '1') == '1' ? 'selected' : '' }}>Aktif</option>
                                <option value="0" {{ old('is_active') == '0' ? 'selected' : '' }}>Nonaktif</option>
                            </select>
                            @error('is_active')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
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

    <dialog id="dialog-edit-supplier" class="dialog w-full sm:max-w-[600px] max-h-[80vh]" aria-labelledby="supplier-edit-title" aria-describedby="supplier-edit-desc" onclick="if (event.target === this) this.close()">
        <div>
            <header>
                <h2 id="supplier-edit-title">Edit Supplier</h2>
                <p id="supplier-edit-desc">Ubah informasi supplier.</p>
            </header>
            <section>
                <form id="form-edit-supplier" method="POST" class="form grid gap-4">
                    @csrf
                    @method('PUT')
                    <div class="grid gap-3">
                        <label for="edit_kode_supplier">Kode Supplier</label>
                        <input type="text" id="edit_kode_supplier" name="kode_supplier" />
                        @error('kode_supplier')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_nama_supplier">Nama Supplier</label>
                        <input type="text" id="edit_nama_supplier" name="nama_supplier" />
                        @error('nama_supplier')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_alamat">Alamat</label>
                        <textarea id="edit_alamat" name="alamat"></textarea>
                        @error('alamat')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="edit_no_telepon">No. Telepon</label>
                            <input type="text" id="edit_no_telepon" name="no_telepon" />
                            @error('no_telepon')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="edit_email">Email</label>
                            <input type="email" id="edit_email" name="email" />
                            @error('email')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="edit_kontak_person">Kontak Person</label>
                            <input type="text" id="edit_kontak_person" name="kontak_person" />
                            @error('kontak_person')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="edit_is_active">Status Aktif</label>
                            <select id="edit_is_active" name="is_active">
                                <option value="1">Aktif</option>
                                <option value="0">Nonaktif</option>
                            </select>
                            @error('is_active')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
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
        function openEditSupplier(btn) {
            const id = btn.dataset.id;
            document.getElementById('edit_kode_supplier').value = btn.dataset.kode || '';
            document.getElementById('edit_nama_supplier').value = btn.dataset.nama || '';
            document.getElementById('edit_alamat').value = btn.dataset.alamat || '';
            document.getElementById('edit_no_telepon').value = btn.dataset.telepon || '';
            document.getElementById('edit_email').value = btn.dataset.email || '';
            document.getElementById('edit_kontak_person').value = btn.dataset.kontak || '';
            document.getElementById('edit_is_active').value = btn.dataset.active === '1' ? '1' : '0';
            const form = document.getElementById('form-edit-supplier');
            form.action = `{{ url('/supplier') }}/${id}`;
            document.getElementById('dialog-edit-supplier').showModal();
        }

        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-supplier').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                pageLength: 10,
                columnDefs: [ { orderable: false, targets: 4 } ],
                language: {
                    emptyTable: `
                    <div class="flex min-w-0 flex-1 flex-col items-center justify-center gap-6 rounded-lg border-dashed p-6 text-center text-balance md:p-12 text-neutral-800 dark:text-neutral-300">
                    <header class="flex max-w-sm flex-col items-center gap-2 text-center">
                        <div class="mb-2 [&_svg]:pointer-events-none [&_svg]:shrink-0 bg-muted text-foreground flex size-10 shrink-0 items-center justify-center rounded-lg [&_svg:not([class*='size-'])]:size-6">
                            <i class="fas fa-box-open text-2xl"></i>
                        </div>
                        <h3 class="text-lg font-medium tracking-tight">Data Supplier Tidak Tersedia</h3>
                        <p class="text-muted-foreground [&>a:hover]:text-primary text-sm/relaxed [&>a]:underline [&>a]:underline-offset-4">
                        Silakan tambahkan Supplier baru.
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