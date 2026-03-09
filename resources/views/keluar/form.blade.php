<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                {{ $isEdit ? 'Ubah' : 'Tambah' }} Barang Keluar
            </h1>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">

            <section>
                <form method="POST" action="{{ $isEdit ? route('barang-keluar.update', $item->id) : route('barang-keluar.store') }}" class="form grid gap-4">
                    @csrf
                    @if($isEdit)
                    @method('PUT')
                    @endif
                    <input type="hidden" name="detail_hapus" id="detail_hapus" value="" />
                    <div class="grid grid-cols-3 sm:grid-cols-3 gap-4">
                        <div class="grid gap-3">
                            <label for="permintaan_id">No Permintaan</label>
                            <div id="select-permintaan" class="w-full select">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-permintaan-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-permintaan-listbox">
                                    <span class="truncate">{{ old('permintaan_id', $isEdit ? $item->permintaan_id : '') ? ($permintaan->where('id', old('permintaan_id', $isEdit ? $item->permintaan_id : ''))->first()->kode ?? 'Pilih...') : 'Pilih...' }}</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                    <path d="m7 15 5 5 5-5" />
                                    <path d="m7 9 5-5 5 5" />
                                    </svg>
                                </button>
                                <div id="select-permintaan-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                    <header>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                        <circle cx="11" cy="11" r="8" />
                                        <path d="m21 21-4.3-4.3" />
                                    </svg>
                                    <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-permintaan-listbox" aria-labelledby="select-permintaan-trigger" />
                                    </header>

                                    <div role="listbox" id="select-permintaan-listbox" aria-orientation="vertical" aria-labelledby="select-permintaan-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                    <div role="group" aria-labelledby="group-label-select-permintaan">
                                        <div role="heading" id="group-label-select-permintaan">Permintaan Barang</div>
                                        <div id="select-permintaan-option-0" role="option" data-value="" data-keywords="Pilih">
                                            Pilih
                                        </div>
                                        @foreach ($permintaan as $b)
                                        @php $isSelected = old('permintaan_id', $isEdit ? $item->permintaan_id : '') == $b->id; @endphp
                                        <div id="select-permintaan-option-{{ $b->id }}" role="option" data-value="{{ $b->id }}" data-keywords="{{ $b->kode }}" {{ $isSelected ? 'aria-selected="true"' : '' }}>
                                            {{ $b->kode }}
                                        </div>
                                        @endforeach
                                    </div>
                                    </div>
                                </div>
                                <input type="hidden" name="permintaan_id" value="{{ old('permintaan_id', $isEdit ? $item->permintaan_id : '') }}" />
                            </div>
                            @error('permintaan_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="tanggal">Tanggal</label>
                            <input type="text" class="datepicker" id="tanggal" name="tanggal" readonly value="{{ old('tanggal', $isEdit ? $item->tanggal : date('Y-m-d')) }}"
                                autofocus />
                            @error('tanggal')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="tujuan_barang">Tujuan Barang</label>
                            <input type="text" id="tujuan_barang" name="tujuan_barang" value="{{ old('tujuan_barang', $isEdit ? $item->tujuan_barang : '') }}" placeholder="Contoh: Gudang Unit A" />
                        </div>
                    </div>
                    

                    <div class="relative bg-neutral-primary-soft shadow-xs rounded-base border border-default">
                        <table class="w-full text-sm text-left rtl:text-right text-body">
                            <thead class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Barang
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Satuan
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
                                                        <span class="truncate">{{ old('detail.'.$k.'.barang_id', $isEdit ? $d->barang_id : '') ? $barang->where('id', old('detail.'.$k.'.barang_id', $isEdit ? $d->barang_id : ''))->first()->nama_barang : 'Pilih...'  }}</span>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                                        <path d="m7 15 5 5 5-5" />
                                                        <path d="m7 9 5-5 5 5" />
                                                        </svg>
                                                    </button>
                                                    <div id="select-barang-0-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                                        <header>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                                            <circle cx="11" cy="11" r="8" />
                                                            <path d="m21 21-4.3-4.3" />
                                                        </svg>
                                                        <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-barang-0-listbox" aria-labelledby="select-barang-0-trigger" />
                                                        </header>

                                                        <div role="listbox" id="select-barang-0-listbox" aria-orientation="vertical" aria-labelledby="select-barang-0-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                                        <div role="group" aria-labelledby="group-label-select-barang-0">
                                                            <div role="heading" id="group-label-select-barang-0">Barang</div>
                                                            @foreach ($barang as $b)
                                                            <div id="select-barang-0-option-{{ $b->id }}" role="option" data-value="{{ $b->id }}" data-satuan="{{ $b->satuan->nama_satuan }}" {{ old('detail.'.$k.'.barang_id', $isEdit ? $d->barang_id : '') == $b->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $b->nama_barang }}">
                                                                {{ $b->nama_barang }}
                                                                <span class="badge badge-secondary">{{ $b->satuan->nama_satuan }}</span>
                                                            </div>
                                                            @endforeach
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="detail[{{ $k }}][barang_id]" value="{{ old('detail['.$k.'][barang_id]', $isEdit ? $d->barang_id : '') }}" />
                                                </div>
                                            </td>
                                            <td class="px-6 py-4" width="120px">
                                                <span class="satuan-display text-sm">{{ old('detail.'.$k.'.barang_id', $isEdit ? $d->barang_id : '') ? $barang->where('id', old('detail.'.$k.'.barang_id', $isEdit ? $d->barang_id : ''))->first()->satuan->nama_satuan : '-' }}</span>
                                            </td>
                                            <td class="px-6 py-4" width="140px">
                                                <input type="number" id="jml-{{ $k }}" class="w-full" name="detail[{{ $k }}][jml]"
                                                    value="{{ old('detail['.$k.'][jml]', $isEdit ? $d->jml : 0) }}" min="0" />
                                                <small class="text-xs text-gray-500 stok-info">Stok tersedia: -</small>
                                            </td>
                                            <td class="px-6 py-4">
                                                <input type="text" id="catatan-{{ $k }}" class="w-full" name="detail[{{ $k }}][catatan]"
                                                    value="{{ old('detail.'.$k.'.catatan', $isEdit ? $d->catatan : '') }}" placeholder="Catatan" />
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
                                                <span class="truncate">{{ old('detail.0.barang_id') ? $barang->where('id', old('detail.0.barang_id'))->first()->nama_barang : 'Pilih...'  }}</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                                <path d="m7 15 5 5 5-5" />
                                                <path d="m7 9 5-5 5 5" />
                                                </svg>
                                            </button>
                                            <div id="select-barang-0-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                                <header>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                                    <circle cx="11" cy="11" r="8" />
                                                    <path d="m21 21-4.3-4.3" />
                                                </svg>
                                                <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-barang-0-listbox" aria-labelledby="select-barang-0-trigger" />
                                                </header>

                                                <div role="listbox" id="select-barang-0-listbox" aria-orientation="vertical" aria-labelledby="select-barang-0-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                                <div role="group" aria-labelledby="group-label-select-barang-0">
                                                    <div role="heading" id="group-label-select-barang-0">Barang</div>

                                                    @foreach ($barang as $b)
                                                    <div id="select-barang-0-option-{{ $b->id }}" role="option" data-value="{{ $b->id }}" data-satuan="{{ $b->satuan->nama_satuan }}" {{ old('detail.0.barang_id') == $b->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $b->nama_barang }}">
                                                        {{ $b->nama_barang }}
                                                        <span class="text-xs text-muted-foreground">{{ $b->satuan->nama_satuan }}</span>
                                                    </div>
                                                    @endforeach
                                                </div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="detail[0][barang_id]" value="{{ old('detail[0][barang_id]', $isEdit ? $item->barang_id : '') }}" />
                                        </div>
                                    </td>
                                    <td class="px-6 py-4" width="120px">
                                        <span class="satuan-display text-sm">-</span>
                                    </td>
                                    <td class="px-6 py-4" width="140px">
                                        <input type="number" id="jml-0" class="w-full" name="detail[0][jml]"
                                            value="{{ old('detail[0][jml]', $isEdit ? $item->jml : 0) }}" min="0" />
                                        <small class="text-xs text-gray-500 stok-info">Stok tersedia: -</small>
                                    </td>
                                    <td class="px-6 py-4">
                                        <input type="text" id="catatan-0" class="w-full" name="detail[0][catatan]"
                                            value="{{ old('detail.0.catatan') }}" placeholder="Catatan" />
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
                                    <td colspan="5" class="px-6 py-4">
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
                        <textarea id="catatan" name="catatan">{{ old('catatan', $isEdit ? $item->catatan : '') }}</textarea>
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
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        .animate-fade-in {
            animation: fadeIn 0.2s ease-out;
        }
    </style>
    <script>
        // Custom select handler yang bekerja dengan row dinamis
        // BasecoatUI CSS tetap digunakan, JavaScript custom untuk handle interaksi
        
        document.addEventListener('click', function (e) {
            const trigger = e.target.closest('[id$="-trigger"]');
            if (trigger && trigger.closest('.select')) {
                e.preventDefault();
                e.stopPropagation();
                const container = trigger.closest('.select');
                const popover = container.querySelector('[id$="-popover"]');
                const isHidden = popover && popover.getAttribute('aria-hidden') !== 'false';
                
                // Close all other popovers first
                document.querySelectorAll('.select [data-popover]').forEach(p => {
                    if (p !== popover) {
                        p.setAttribute('aria-hidden', 'true');
                    }
                });
                
                if (popover) {
                    popover.setAttribute('aria-hidden', isHidden ? 'false' : 'true');
                    // Focus on search input when opened
                    if (isHidden) {
                        const searchInput = popover.querySelector('input[role="combobox"]');
                        if (searchInput) {
                            setTimeout(() => searchInput.focus(), 50);
                        }
                    }
                }
                return;
            }

            const option = e.target.closest('[role="option"]');
            if (option && option.closest('.select')) {
                e.preventDefault();
                const container = option.closest('.select');
                const labelSpan = container.querySelector('.truncate');
                const hiddenInput = container.querySelector('input[type="hidden"][name$="[barang_id]"]');
                const permintaanInput = container.querySelector('input[type="hidden"][name="permintaan_id"]');

                if (labelSpan) labelSpan.textContent = option.textContent.trim();
                if (hiddenInput) hiddenInput.value = option.dataset.value || '';
                if (permintaanInput) permintaanInput.value = option.dataset.value || '';

                // Update satuan display
                const row = container.closest('tr');
                if (row) {
                    const satuanDisplay = row.querySelector('.satuan-display');
                    if (satuanDisplay) {
                        satuanDisplay.textContent = option.dataset.satuan || '-';
                    }

                    // Fetch stok tersedia untuk barang yang dipilih
                    if (hiddenInput && option.dataset.value) {
                        fetchStokBarang(option.dataset.value, row);
                    }
                }

                // Update aria-selected
                container.querySelectorAll('[role="option"][aria-selected="true"]').forEach(el => el.removeAttribute('aria-selected'));
                option.setAttribute('aria-selected', 'true');

                // Close popover
                const popover = container.querySelector('[id$="-popover"]');
                if (popover) popover.setAttribute('aria-hidden', 'true');

                // Clear search input
                const searchInput = popover?.querySelector('input[role="combobox"]');
                if (searchInput) {
                    searchInput.value = '';
                    // Show all options again
                    const listbox = container.querySelector('[role="listbox"]');
                    if (listbox) {
                        listbox.querySelectorAll('[role="option"]').forEach(opt => {
                            opt.style.display = '';
                        });
                    }
                }

                // Trigger fetch permintaan detail if permintaan_id is selected
                if (permintaanInput && option.dataset.value) {
                    fetchPermintaanDetail(option.dataset.value);
                }
                return;
            }

            // Close all popovers when clicking outside
            if (!e.target.closest('.select')) {
                document.querySelectorAll('.select [data-popover]').forEach(p => p.setAttribute('aria-hidden', 'true'));
            }
        });

        // Search functionality
        document.addEventListener('input', function (e) {
            const input = e.target.closest('input[role="combobox"]');
            if (!input) return;
            
            const container = input.closest('.select');
            if (!container) return;
            
            const listbox = container.querySelector('[role="listbox"]');
            if (!listbox) return;
            
            const q = input.value.toLowerCase().trim();
            listbox.querySelectorAll('[role="option"]').forEach(opt => {
                const text = opt.textContent.toLowerCase();
                const keywords = (opt.dataset.keywords || '').toLowerCase();
                const match = q === '' || text.includes(q) || keywords.includes(q);
                opt.style.display = match ? '' : 'none';
            });
        });

        // Keyboard navigation (escape to close)
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                document.querySelectorAll('.select [data-popover]').forEach(p => p.setAttribute('aria-hidden', 'true'));
            }
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
                const permintaanDetId = row.querySelector('input[type="hidden"][name^="detail"][name$="[permintaan_detail_id]"]');
                if (permintaanDetId) permintaanDetId.name = `detail[${index}][permintaan_detail_id]`;
                const idHidden = row.querySelector('input[type="hidden"][name^="detail"][name$="[id]"]');
                if (idHidden) idHidden.name = `detail[${index}][id]`;
                const jumlah = row.querySelector('input[type="number"][name^="detail"][name$="[jml]"]');
                if (jumlah) {
                    jumlah.id = `jml-${index}`;
                    jumlah.name = `detail[${index}][jml]`;
                }
                const catatan = row.querySelector('input[type="text"][name^="detail"][name$="[catatan]"]');
                if (catatan) {
                    catatan.id = `catatan-${index}`;
                    catatan.name = `detail[${index}][catatan]`;
                }
                const delBtn = row.querySelector('button.btn-destructive');
                if (delBtn) delBtn.setAttribute('onclick', 'removeRow(this)');
                if (labelSpan && !hidden.value) labelSpan.textContent = 'Pilih...';
            });
        }

        function resetRowValues(row) {
            const hidden = row.querySelector('input[type="hidden"][name$="[barang_id]"]');
            const jumlah = row.querySelector('input[type="number"][name$="[jml]"]');
            const catatan = row.querySelector('input[type="text"][name$="[catatan]"]');
            const idHidden = row.querySelector('input[type="hidden"][name$="[id]"]');
            const permintaanDetailId = row.querySelector('input[type="hidden"][name$="[permintaan_detail_id]"]');
            const labelSpan = row.querySelector('.truncate');
            const satuanDisplay = row.querySelector('.satuan-display');
            if (hidden) hidden.value = '';
            if (jumlah) jumlah.value = 0;
            if (catatan) catatan.value = '';
            if (idHidden) idHidden.value = '';
            if (permintaanDetailId) permintaanDetailId.remove();
            if (labelSpan) labelSpan.textContent = 'Pilih...';
            if (satuanDisplay) satuanDisplay.textContent = '-';
            
            // Reset select component state
            const selectContainer = row.querySelector('.select');
            if (selectContainer) {
                // Close popover
                const popover = selectContainer.querySelector('[data-popover]');
                if (popover) popover.setAttribute('aria-hidden', 'true');
                
                // Reset aria-selected
                selectContainer.querySelectorAll('[role="option"][aria-selected="true"]').forEach(opt => {
                    opt.removeAttribute('aria-selected');
                });
                
                // Clear search input
                const searchInput = selectContainer.querySelector('input[role="combobox"]');
                if (searchInput) searchInput.value = '';
                
                // Show all options
                selectContainer.querySelectorAll('[role="option"]').forEach(opt => {
                    opt.style.display = '';
                });
            }
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

        // Fetch stok barang dari server
        function fetchStokBarang(barangId, row) {
            if (!barangId) return;

            fetch(`/barang/${barangId}/stok`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    const stokInfo = row.querySelector('.stok-info');
                    const jmlInput = row.querySelector('input[type="number"][name$="[jml]"]');

                    if (stokInfo) {
                        stokInfo.textContent = `Stok tersedia: ${data.stok_tersedia}`;
                        stokInfo.dataset.stokTersedia = data.stok_tersedia;
                    }

                    if (jmlInput) {
                        const currentValue = parseInt(jmlInput.value) || 0;
                        const stokTersedia = data.stok_tersedia;

                        // Jika stok < jumlah yang diminta, isi dengan stok tersedia
                        // Jika stok >= jumlah yang diminta, biarkan sesuai permintaan
                        const newValue = Math.min(currentValue, stokTersedia);

                        jmlInput.value = newValue;
                        jmlInput.setAttribute('max', stokTersedia);
                        jmlInput.dataset.stokTersedia = stokTersedia;

                        // Trigger validasi realtime
                        if (newValue > stokTersedia) {
                            jmlInput.classList.add('border-red-500');
                            if (stokInfo) {
                                stokInfo.classList.add('text-red-500');
                                stokInfo.classList.remove('text-gray-500');
                            }
                        }
                    }
                }
            })
            .catch(error => {
                console.error('Error fetching stok barang:', error);
            });
        }

        // Validasi realtime saat input jumlah berubah
        document.addEventListener('input', function(e) {
            if (e.target.matches('input[type="number"][name$="[jml]"]')) {
                const jmlInput = e.target;
                const row = jmlInput.closest('tr');
                const stokInfo = row.querySelector('.stok-info');
                const jml = parseInt(jmlInput.value) || 0;
                const stokTersedia = parseInt(jmlInput.dataset.stokTersedia || stokInfo?.dataset.stokTersedia || 0);

                if (jml > stokTersedia) {
                    jmlInput.classList.add('border-red-500');
                    if (stokInfo) {
                        stokInfo.classList.add('text-red-500');
                        stokInfo.classList.remove('text-gray-500');
                    }
                } else {
                    jmlInput.classList.remove('border-red-500');
                    if (stokInfo) {
                        stokInfo.classList.remove('text-red-500');
                        stokInfo.classList.add('text-gray-500');
                    }
                }
            }
        });

        // Validasi form sebelum submit
        function validateForm(e) {
            console.log('Validating form...');

            const rows = document.querySelectorAll('table tbody tr');
            let hasError = false;
            let errorMessages = [];
            let hasValidItem = false;

            console.log('Total rows:', rows.length);

            rows.forEach((row, index) => {
                const barangSelect = row.querySelector('input[type="hidden"][name$="[barang_id]"]');
                const jmlInput = row.querySelector('input[type="number"][name$="[jml]"]');
                const stokInfo = row.querySelector('.stok-info');

                console.log(`Row ${index}:`, {
                    barangId: barangSelect?.value,
                    jml: jmlInput?.value,
                    stokTersedia: jmlInput?.dataset.stokTersedia || stokInfo?.dataset.stokTersedia
                });

                // Skip row yang tidak ada barang dipilih
                if (!barangSelect || !barangSelect.value) {
                    return;
                }

                hasValidItem = true;
                const jml = parseInt(jmlInput.value) || 0;
                const stokTersedia = parseInt(jmlInput.dataset.stokTersedia || stokInfo?.dataset.stokTersedia || 0);
                const barangNama = row.querySelector('.truncate')?.textContent.trim() || 'Barang';

                if (jml <= 0) {
                    hasError = true;
                    errorMessages.push(`${barangNama}: Jumlah tidak boleh 0. Silakan hapus baris ini jika tidak diperlukan.`);
                    jmlInput.classList.add('border-red-500');
                } else if (jml > stokTersedia && stokTersedia > 0) {
                    hasError = true;
                    errorMessages.push(`${barangNama}: Jumlah (${jml}) melebihi stok tersedia (${stokTersedia})`);
                    jmlInput.classList.add('border-red-500');
                } else {
                    jmlInput.classList.remove('border-red-500');
                }
            });

            console.log('Validation result:', { hasValidItem, hasError, errorMessages });

            // Cek apakah ada item yang valid
            if (!hasValidItem) {
                e.preventDefault();
                showAlert('Validasi Form', 'Silakan pilih minimal 1 barang!', 'warning');
                return false;
            }

            if (hasError) {
                e.preventDefault();
                showAlert('Validasi Form Gagal', errorMessages, 'error');
                return false;
            }

            console.log('Validation passed!');
            return true;
        }

        // Fetch permintaan detail and populate table
        function fetchPermintaanDetail(permintaanId) {
            if (!permintaanId) return;

            fetch(`/permintaan-barang/${permintaanId}/detail`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(res => res.json())
            .then(data => {
                console.log('Permintaan detail data:', data);
                if (data.success && data.data && data.data.detail) {
                    populateDetailTable(data.data.detail);
                }
            })
            .catch(error => {
                console.error('Error fetching permintaan detail:', error);
            });
        }

        // Populate detail table with fetched data
        function populateDetailTable(details) {
            const tbody = document.querySelector('table tbody');
            const barangData = @json($barang);

            // Clear existing rows
            tbody.innerHTML = '';

            if (details.length === 0) {
                addRow();
                return;
            }

            details.forEach((detail, index) => {
                const barangInfo = detail.barang;
                const satuanNama = barangInfo && barangInfo.satuan ? barangInfo.satuan.nama_satuan : '';

                // Hitung sisa yang belum terpenuhi
                const sisa = detail.sisa || (detail.jml - (detail.jml_terpenuhi || 0));
                const sudahTerpenuhi = detail.jml_terpenuhi || 0;

                const row = document.createElement('tr');
                row.className = 'bg-neutral-primary border-b border-default';
                row.innerHTML = `
                    <td scope="row" class="px-6 py-4" width="40%">
                        <div id="select-barang-${index}" class="w-full select">
                            <button type="button" class="btn-outline justify-between font-normal w-full" id="select-barang-${index}-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-barang-${index}-listbox">
                                <span class="truncate">${barangInfo ? barangInfo.nama_barang : 'Pilih...'}</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                <path d="m7 15 5 5 5-5" />
                                <path d="m7 9 5-5 5 5" />
                                </svg>
                            </button>
                            <div id="select-barang-${index}-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                <header>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                    <circle cx="11" cy="11" r="8" />
                                    <path d="m21 21-4.3-4.3" />
                                </svg>
                                <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-barang-${index}-listbox" aria-labelledby="select-barang-${index}-trigger" />
                                </header>
                                <div role="listbox" id="select-barang-${index}-listbox" aria-orientation="vertical" aria-labelledby="select-barang-${index}-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                <div role="group" aria-labelledby="group-label-select-barang-${index}">
                                    <div role="heading" id="group-label-select-barang-${index}">Barang</div>
                                    ${barangData.map(b => `
                                        <div id="select-barang-${index}-option-${b.id}" role="option" data-value="${b.id}" data-satuan="${b.satuan ? b.satuan.nama_satuan : ''}" ${detail.barang_id == b.id ? 'aria-selected="true"' : ''} data-keywords="${b.nama_barang}">
                                            ${b.nama_barang}
                                            <span class="text-xs text-muted-foreground">${b.satuan ? b.satuan.nama_satuan : ''}</span>
                                        </div>
                                    `).join('')}
                                </div>
                                </div>
                            </div>
                            <input type="hidden" name="detail[${index}][barang_id]" value="${detail.barang_id}" />
                            <input type="hidden" name="detail[${index}][permintaan_detail_id]" value="${detail.id}" />
                        </div>
                    </td>
                    <td class="px-6 py-4" width="120px">
                        <span class="satuan-display text-sm">${satuanNama || '-'}</span>
                    </td>
                    <td class="px-6 py-4" width="140px">
                        <input type="number" id="jml-${index}" class="w-full" name="detail[${index}][jml]" value="${sisa}" min="0" max="${sisa}" />
                        <small class="text-xs text-blue-600 block">Qty Permintaan: ${detail.jml}</small>
                        ${sudahTerpenuhi > 0 ? `<small class="text-xs text-gray-500 block">Sudah terpenuhi: ${sudahTerpenuhi}</small>` : ''}
                        <small class="text-xs text-gray-500 stok-info" data-stok-tersedia="0">Stok tersedia: Memuat...</small>
                    </td>
                    <td class="px-6 py-4">
                        <input type="text" id="catatan-${index}" class="w-full" name="detail[${index}][catatan]" value="${detail.catatan || ''}" placeholder="Catatan" />
                    </td>
                    <td class="px-6 py-4" width="100px">
                        <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                            <i class="fa-solid fa-close"></i>
                        </button>
                    </td>
                `;
                tbody.appendChild(row);

                // Fetch stok tersedia untuk barang ini
                if (detail.barang_id) {
                    fetchStokBarang(detail.barang_id, row);
                }
            });
        }
        // Professional alert modal using SweetAlert2
        function showAlert(title, messages, type = 'error') {
            const messagesHtml = Array.isArray(messages) 
                ? '<ul class="text-left list-disc list-inside space-y-1">' + messages.map(msg => `<li class="text-sm">${msg}</li>`).join('') + '</ul>'
                : messages;

            Swal.fire({
                title: title,
                html: messagesHtml,
                icon: type,
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn btn-primary'
                }
            });
        }

        // Initialize immediately (script is already at the end of the page via push in Blade)
        (function() {
            console.log('Initializing form validation...');

            // Attach form validation
            const form = document.querySelector('form.form');
            console.log('Form element found:', form);

            if (form) {
                console.log('Attaching submit event listener to form');
                form.addEventListener('submit', validateForm);
            } else {
                console.error('Form not found! Available forms:', document.querySelectorAll('form'));
            }

            // Load stok untuk barang yang sudah ada (mode edit atau old input)
            const rows = document.querySelectorAll('table tbody tr');
            console.log('Found rows for stock loading:', rows.length);

            rows.forEach(row => {
                const barangInput = row.querySelector('input[type="hidden"][name$="[barang_id]"]');
                if (barangInput && barangInput.value) {
                    console.log('Loading stock for barang:', barangInput.value);
                    fetchStokBarang(barangInput.value, row);
                }
            });
        })();
    </script>
    @endpush

</x-app-layout>
