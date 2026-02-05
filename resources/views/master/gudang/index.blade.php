<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Gudang</h1>
            <button type="button" onclick="document.getElementById('dialog-create-gudang').showModal()" class="btn btn-sm btn-primary">
                <i class="fas fa-plus mr-2"></i>
                Tambah Gudang
            </button>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <table id="dt-gudang" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kode</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Gudang</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Penanggung Jawab</th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @foreach ($items as $item)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->kode_gudang }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900">{{ $item->nama_gudang }}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">{{ $item->penanggung_jawab ?? '-' }}</td>
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
                                        data-kode="{{ $item->kode_gudang }}"
                                        data-nama="{{ $item->nama_gudang }}"
                                        data-pj="{{ $item->penanggung_jawab }}"
                                        data-active="{{ $item->is_active ? '1' : '0' }}"
                                        onclick="openEditGudang(this)">
                                        <i class="fas fa-edit mr-2"></i>
                                        Edit
                                    </button>
                                    <form method="POST" action="{{ route('gudang.destroy', $item) }}" onsubmit="return confirm('Hapus gudang ini?')">
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

    <!-- Create Dialog -->
    <dialog id="dialog-create-gudang" class="dialog w-full sm:max-w-[600px] max-h-[80vh]" aria-labelledby="gudang-create-title" aria-describedby="gudang-create-desc" onclick="if (event.target === this) this.close()">
        <div class="p-6">
            <header>
                <h2 id="create-title">Tambah Gudang</h2>
                <p id="create-desc">Masukkan informasi gudang baru.</p>
            </header>
            <section>
                <form method="POST" action="{{ route('gudang.store') }}" class="grid gap-4">
                    @csrf
                    <div class="grid gap-3">
                        <label for="kode_gudang">Kode Gudang</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="kode_gudang" name="kode_gudang" value="{{ old('kode_gudang') }}" autofocus />
                        @error('kode_gudang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="nama_gudang">Nama Gudang</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="nama_gudang" name="nama_gudang" value="{{ old('nama_gudang') }}" />
                        @error('nama_gudang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="penanggung_jawab">Penanggung Jawab</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="penanggung_jawab" name="penanggung_jawab" value="{{ old('penanggung_jawab') }}" />
                        @error('penanggung_jawab')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="is_active">Status Aktif</label>
                        <select class="select w-full p-2 border border-gray-300 rounded-md" id="is_active" name="is_active">
                            <option value="1" {{ old('is_active', '1') == '1' ? 'selected' : '' }}>Aktif</option>
                            <option value="0" {{ old('is_active') == '0' ? 'selected' : '' }}>Nonaktif</option>
                        </select>
                        @error('is_active')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <footer class="flex gap-2 justify-end mt-4">
                        <button type="button" class="btn-outline" onclick="this.closest('dialog').close()">Batal</button>
                        <button class="btn" type="submit">Simpan</button>
                    </footer>
                </form>
            </section>
        </div>
    </dialog>

    <!-- Edit Dialog -->
    <dialog id="dialog-edit-gudang" class="dialog w-full sm:max-w-[500px] max-h-[80vh] rounded-xl shadow-2xl border border-gray-200 bg-white" aria-labelledby="gudang-edit-title" aria-describedby="gudang-edit-desc" onclick="if (event.target === this) this.close()">
        <div class="p-6">
            <header class="flex justify-between mb-4">
                <h2 id="gudang-edit-title" class="text-lg font-semibold text-gray-900">Edit Gudang</h2>
                <p id="gudang-edit-desc" class="text-sm text-gray-500">Ubah informasi gudang.</p>
            </header>
            <section>
                <form id="form-edit-gudang" method="POST" class="grid gap-4">
                    @csrf
                    @method('PUT')
                    <div class="grid gap-3">
                        <label for="edit_kode_gudang">Kode Gudang</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="edit_kode_gudang" name="kode_gudang" />
                        @error('kode_gudang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_nama_gudang">Nama Gudang</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="edit_nama_gudang" name="nama_gudang" />
                        @error('nama_gudang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_penanggung_jawab">Penanggung Jawab</label>
                        <input type="text" class="input w-full p-2 border border-gray-300 rounded-md" id="edit_penanggung_jawab" name="penanggung_jawab" />
                        @error('penanggung_jawab')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <div class="grid gap-3">
                        <label for="edit_is_active">Status Aktif</label>
                        <select class="select w-full p-2 border border-gray-300 rounded-md" id="edit_is_active" name="is_active">
                            <option value="1">Aktif</option>
                            <option value="0">Nonaktif</option>
                        </select>
                        @error('is_active')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                    </div>
                    <footer class="flex gap-2 justify-end mt-4">
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
        function openEditGudang(btn) {
            const id = btn.dataset.id;
            document.getElementById('edit_kode_gudang').value = btn.dataset.kode || '';
            document.getElementById('edit_nama_gudang').value = btn.dataset.nama || '';
            document.getElementById('edit_penanggung_jawab').value = btn.dataset.pj || '';
            document.getElementById('edit_is_active').value = btn.dataset.active === '1' ? '1' : '0';
            const form = document.getElementById('form-edit-gudang');
            form.action = `{{ url('/gudang') }}/${id}`;
            document.getElementById('dialog-edit-gudang').showModal();
        }

        document.addEventListener('DOMContentLoaded', function () {
            $('#dt-gudang').DataTable({
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
                            <i class="fas fa-warehouse text-2xl"></i>
                        </div>
                        <h3 class="text-lg font-medium tracking-tight">Data Gudang Tidak Tersedia</h3>
                        <p class="text-muted-foreground [&>a:hover]:text-primary text-sm/relaxed [&>a]:underline [&>a]:underline-offset-4">
                        Silakan tambahkan data gudang baru.
                        </p>
                    </header>
                    <section class="flex w-full max-w-sm min-w-0 flex-col items-center gap-4 text-sm text-balance">
                        <div class="flex gap-2">
                            <button type="button" onclick="document.getElementById('dialog-create-gudang').showModal()" 
                            class="btn btn-sm btn-primary">
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
