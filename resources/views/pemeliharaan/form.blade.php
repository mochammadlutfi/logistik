<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                {{ $isEdit ? 'Ubah' : 'Buat' }} Barang Pemeliharaan
            </h1>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">

            <section>
                <form method="POST" action="{{ $isEdit ? route('pemeliharaan-barang.update', $item->id) : route('pemeliharaan-barang.store') }}" class="form grid gap-4">
                    @csrf
                    @if($isEdit)
                    @method('PUT')
                    @endif
                    <input type="hidden" name="detail_hapus" id="detail_hapus" value="" />
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="tanggal">Tanggal</label>
                            <input type="text" class="datepicker" id="tanggal" name="tanggal" value="{{ old('tanggal', $isEdit ? $item->tanggal : '') }}"
                                autofocus />
                            @error('tanggal')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="petugas">Petugas</label>
                            <input type="text" id="petugas" name="petugas" value="{{ old('petugas', $isEdit ? $item->petugas : '') }}" />
                        </div>
                    </div>
                    

                    <div class="relative bg-neutral-primary-soft shadow-xs rounded-base border border-default">
                        <table class="w-full text-sm text-left rtl:text-right text-body">
                            <thead class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Produk
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Jumlah
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Catatan
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @if($isEdit && $item->detail->count() > 0)
                                    @foreach ($item->detail as $k => $d)
                                        <tr class="bg-neutral-primary border-b border-default">
                                            <td scope="row" class="px-6 py-4" width="40%">
                                                <input type="hidden" name="detail[{{ $k }}][id]" value="{{ $d->id }}" />
                                                <div id="select-barang-0" class="w-full select">
                                                    <button type="button" class="btn-outline justify-between font-normal w-full" id="select-barang-0-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-barang-0-listbox">
                                                        <spasn class="truncate">{{ old('detail['.$k.'][barang_id]', $isEdit ? $d->barang_id : '') ? $barang->where('id', old('detail['.$k.'][barang_id]', $isEdit ? $d->barang_id : ''))->first()->nama_barang : 'Pilih...'  }}</span>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                                        <path d="m7 15 5 5 5-5" />
                                                        <path d="m7 9 5-5 5 5" />
                                                        </svg>
                                                    </button>
                                                    <div id="select-barang-0-popover" data-popover aria-hidden="true">
                                                        <header>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                                            <circle cx="11" cy="11" r="8" />
                                                            <path d="m21 21-4.3-4.3" />
                                                        </svg>
                                                        <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-barang-0-listbox" aria-labelledby="select-barang-0-trigger" />
                                                        </header>

                                                        <div role="listbox" id="select-barang-0-listbox" aria-orientation="vertical" aria-labelledby="select-barang-0-trigger">
                                                        <div role="group" aria-labelledby="group-label-select-barang-0">
                                                            <div role="heading" id="group-label-select-barang-0">Barang</div>

                                                            @foreach ($barang as $k)
                                                            <div id="select-barang-0" role="option" data-value="{{ $k->id }}" {{ old('detail['.$k.'][barang_id]') == $k->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $k->nama_kategori }}">
                                                                {{ $k->nama_barang }}
                                                            </div>
                                                            @endforeach
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="detail[{{ $k }}][barang_id]" value="{{ old('detail['.$k.'][barang_id]', $isEdit ? $d->barang_id : '') }}" />
                                                </div>
                                            </td>
                                            <td class="px-6 py-4" width="140px">
                                                <input type="number" id="jml-{{ $k }}" class="w-full" name="detail[{{ $k }}][jml]"
                                                    value="{{ old('detail['.$k.'][jml]', $isEdit ? $d->jml : 0) }}" min="0" />
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" id="keterangan-{{ $k }}" class="w-full" name="detail[{{ $k }}][keterangan]"
                                                    value="{{ old('detail['.$k.'][keterangan]', $isEdit ? $d->keterangan : '') }}" />
                                            </td>
                                            <td class="px-6 py-4" width="100px">
                                                <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                                                    <i class="fa-solid fa-close"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                <tr class="bg-neutral-primary border-b border-default">
                                    <td scope="row" class="px-6 py-4" width="40%">
                                        <div id="select-barang-0" class="w-full select">
                                            <button type="button" class="btn-outline justify-between font-normal w-full" id="select-barang-0-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-barang-0-listbox">
                                                <span class="truncate">{{ old('barang_id', $isEdit ? $item->barang_id : '') ? $barang->where('id', old('detail[0][barang_id]', $isEdit ? $item->barang_id : ''))->first()->nama_barang : 'Pilih...'  }}</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                                <path d="m7 15 5 5 5-5" />
                                                <path d="m7 9 5-5 5 5" />
                                                </svg>
                                            </button>
                                            <div id="select-barang-0-popover" data-popover aria-hidden="true">
                                                <header>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                                    <circle cx="11" cy="11" r="8" />
                                                    <path d="m21 21-4.3-4.3" />
                                                </svg>
                                                <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-barang-0-listbox" aria-labelledby="select-barang-0-trigger" />
                                                </header>

                                                <div role="listbox" id="select-barang-0-listbox" aria-orientation="vertical" aria-labelledby="select-barang-0-trigger">
                                                <div role="group" aria-labelledby="group-label-select-barang-0">
                                                    <div role="heading" id="group-label-select-barang-0">Barang</div>

                                                    @foreach ($barang as $k)
                                                    <div id="select-barang-0" role="option" data-value="{{ $k->id }}" {{ old('detail[0][barang_id]') == $k->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $k->nama_kategori }}">
                                                        {{ $k->nama_barang }}
                                                    </div>
                                                    @endforeach
                                                </div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="detail[0][barang_id]" value="{{ old('detail[0][barang_id]', $isEdit ? $item->barang_id : '') }}" />
                                        </div>
                                    </td>
                                    <td class="px-6 py-4" width="140px">
                                        <input type="number" id="jml-0" class="w-full" name="detail[0][jml]"
                                            value="{{ old('detail[0][jml]', $isEdit ? $item->jml : 0) }}" min="0" />
                                    </td>
                                    <td class="px-6 py-4">
                                        <input type="text" id="keterangan-0" class="w-full" name="detail[0][keterangan]"
                                            value="{{ old('detail[0][keterangan]', $isEdit ? $item->keterangan : '') }}" />
                                    </td>
                                    <td class="px-6 py-4" width="100px">
                                        <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                                            <i class="fa-solid fa-close"></i>
                                        </button>
                                    </td>
                                </tr>
                                @endif
                            </tbody>
                            <tfoot class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <td colspan="4" class="px-6 py-4">
                                        <button type="button" class="btn-sm btn-primary w-full" onclick="addRow()">
                                            <i class="fa-solid fa-plus"></i>
                                            Tambah Barang
                                        </button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>


                    <div class="grid gap-3">
                        <label for="keterangan">Keterangan</label>
                        <textarea id="keterangan" name="keterangan">{{ old('keterangan', $isEdit ? $item->keterangan : '') }}</textarea>
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
    </div>
    
    @push('scripts')
    <script>
        document.addEventListener('click', function (e) {
            const trigger = e.target.closest('[id$="-trigger"]');
            if (trigger && trigger.closest('.select')) {
                e.preventDefault();
                const container = trigger.closest('.select');
                const popover = container.querySelector('[id$="-popover"]');
                const isHidden = popover && popover.getAttribute('aria-hidden') !== 'false';
                document.querySelectorAll('[data-popover]').forEach(p => p.setAttribute('aria-hidden', 'true'));
                if (popover) popover.setAttribute('aria-hidden', isHidden ? 'false' : 'true');
                return;
            }

            const option = e.target.closest('[role="option"]');
            if (option && option.closest('.select')) {
                const container = option.closest('.select');
                const labelSpan = container.querySelector('.truncate');
                const hiddenInput = container.parentElement.querySelector('input[type="hidden"]');
                if (labelSpan) labelSpan.textContent = option.textContent.trim();
                if (hiddenInput) hiddenInput.value = option.dataset.value || '';
                option.parentElement.querySelectorAll('[role="option"][aria-selected="true"]').forEach(el => el.removeAttribute('aria-selected'));
                option.setAttribute('aria-selected', 'true');
                const popover = container.querySelector('[id$="-popover"]');
                if (popover) popover.setAttribute('aria-hidden', 'true');
                return;
            }

            const insideSelect = e.target.closest('.select');
            if (!insideSelect) {
                document.querySelectorAll('[data-popover]').forEach(p => p.setAttribute('aria-hidden', 'true'));
            }
        });

        document.addEventListener('input', function (e) {
            const input = e.target.closest('input[role="combobox"]');
            if (!input) return;
            const listId = input.getAttribute('aria-controls');
            const list = listId ? document.getElementById(listId) : null;
            if (!list) return;
            const q = input.value.toLowerCase();
            list.querySelectorAll('[role="option"]').forEach(opt => {
                const text = opt.textContent.toLowerCase();
                const keywords = (opt.dataset.keywords || '').toLowerCase();
                opt.style.display = (q === '' || text.includes(q) || keywords.includes(q)) ? '' : 'none';
            });
        });

        function reindexRows() {
            const tbody = document.querySelector('table tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));
            rows.forEach((row, index) => {
                const selectContainer = row.querySelector('div.select');
                const trigger = row.querySelector('[id$="-trigger"]');
                const popover = row.querySelector('[id$="-popover"]');
                const listbox = row.querySelector('[id$="-listbox"]');
                const headerInput = row.querySelector('[aria-controls$="-listbox"]');
                const labelSpan = row.querySelector('.truncate');
                if (selectContainer && selectContainer.id) selectContainer.id = `select-barang-${index}`;
                if (trigger && trigger.id) trigger.id = `select-barang-${index}-trigger`;
                if (popover && popover.id) popover.id = `select-barang-${index}-popover`;
                if (listbox && listbox.id) listbox.id = `select-barang-${index}-listbox`;
                if (headerInput) {
                    headerInput.setAttribute('aria-controls', `select-barang-${index}-listbox`);
                    headerInput.setAttribute('aria-labelledby', `select-barang-${index}-trigger`);
                }
                const hidden = row.querySelector('input[type="hidden"][name^="detail"][name$="[barang_id]"]');
                if (hidden) hidden.name = `detail[${index}][barang_id]`;
                const idHidden = row.querySelector('input[type="hidden"][name^="detail"][name$="[id]"]');
                if (idHidden) idHidden.name = `detail[${index}][id]`;
                const jumlah = row.querySelector('input[type="number"][name^="detail"][name$="[jml]"]');
                if (jumlah) {
                    jumlah.id = `jml-${index}`;
                    jumlah.name = `detail[${index}][jml]`;
                }
                const catatan = row.querySelector('input[type="text"][name^="detail"][name$="[keterangan]"]');
                if (catatan) {
                    catatan.id = `keterangan-${index}`;
                    catatan.name = `detail[${index}][keterangan]`;
                }
                const delBtn = row.querySelector('button.btn-destructive');
                if (delBtn) delBtn.setAttribute('onclick', 'removeRow(this)');
                if (labelSpan && !hidden.value) labelSpan.textContent = 'Pilih...';
            });
        }

        function resetRowValues(row) {
            const hidden = row.querySelector('input[type="hidden"][name$="[barang_id]"]');
            const jumlah = row.querySelector('input[type="number"][name$="[jml]"]');
            const catatan = row.querySelector('input[type="text"][name$="[keterangan]"]');
            const idHidden = row.querySelector('input[type="hidden"][name$="[id]"]');
            const labelSpan = row.querySelector('.truncate');
            if (hidden) hidden.value = '';
            if (jumlah) jumlah.value = 0;
            if (catatan) catatan.value = '';
            if (idHidden) idHidden.value = '';
            if (labelSpan) labelSpan.textContent = 'Pilih...';
        }

        function addRow() {
            const tbody = document.querySelector('table tbody');
            const rows = Array.from(tbody.querySelectorAll('tr'));
            const base = rows[rows.length - 1] || rows[0];
            const clone = base.cloneNode(true);
            resetRowValues(clone);
            tbody.appendChild(clone);
            reindexRows();
        }

        function removeRow(btn) {
            const row = btn.closest('tr');
            const idHidden = row.querySelector('input[type="hidden"][name$="[id]"]');
            const deletedBucket = document.getElementById('detail_hapus');
            if (idHidden && idHidden.value && deletedBucket) {
                const current = deletedBucket.value.trim();
                const list = current ? current.split(',').filter(Boolean) : [];
                if (!list.includes(idHidden.value)) list.push(idHidden.value);
                deletedBucket.value = list.join(',');
            }
            const tbody = row.parentElement;
            const rows = Array.from(tbody.querySelectorAll('tr'));
            if (rows.length <= 1) {
                resetRowValues(row);
                return;
            }
            row.remove();
            reindexRows();
        }
    </script>
    @endpush

</x-app-layout>
