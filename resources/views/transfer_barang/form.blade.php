<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                Buat Transfer Barang
            </h1>
            <a href="{{ route('transfer-barang.index') }}" class="btn btn-sm btn-outline">
                <i class="fas fa-arrow-left mr-2"></i>
                Kembali
            </a>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">

            <section>
                <form method="POST" action="{{ route('transfer-barang.store') }}" class="form grid gap-4">
                    @csrf
                    
                    <input type="hidden" name="detail_hapus" id="detail_hapus" value="" />
                    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
                        <div class="grid gap-3">
                            <label for="tanggal">Tanggal Transfer</label>
                            <input type="text" class="datepicker" id="tanggal" name="tanggal" readonly value="{{ old('tanggal', date('Y-m-d')) }}"
                                autofocus />
                            @error('tanggal')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="catatan">Catatan</label>
                            <input type="text" id="catatan" name="catatan" value="{{ old('catatan') }}" placeholder="Keterangan tambahan..." />
                            @error('catatan')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="gudang_asal_id">Gudang Asal</label>
                            <div id="select-gudang-asal" class="select w-full">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-gudang-asal-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-gudang-asal-listbox">
                                    <span class="truncate">
                                        {{ old('gudang_asal_id') ? $gudang->firstWhere('id', old('gudang_asal_id'))->nama_gudang : 'Pilih Gudang Asal...' }}
                                    </span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                    <path d="m7 15 5 5 5-5" />
                                    <path d="m7 9 5-5 5 5" />
                                    </svg>
                                </button>
                                <div id="select-gudang-asal-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                    <header>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                        <circle cx="11" cy="11" r="8" />
                                        <path d="m21 21-4.3-4.3" />
                                    </svg>
                                    <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-gudang-asal-listbox" aria-labelledby="select-gudang-asal-trigger" />
                                    </header>
                                    <div role="listbox" id="select-gudang-asal-listbox" aria-orientation="vertical" aria-labelledby="select-gudang-asal-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                    <div role="group" aria-labelledby="group-label-select-gudang-asal">
                                        <div role="heading" id="group-label-select-gudang-asal">Gudang</div>
                                        @foreach ($gudang as $g)
                                        <div id="select-gudang-asal-option-{{ $g->id }}" role="option" data-value="{{ $g->id }}" {{ old('gudang_asal_id') == $g->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $g->nama_gudang }}">
                                            {{ $g->nama_gudang }}
                                        </div>
                                        @endforeach
                                    </div>
                                    </div>
                                </div>
                                <input type="hidden" name="gudang_asal_id" value="{{ old('gudang_asal_id') }}" />
                            </div>
                            @error('gudang_asal_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="gudang_tujuan_id">Gudang Tujuan</label>
                            <div id="select-gudang-tujuan" class="select w-full">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-gudang-tujuan-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-gudang-tujuan-listbox">
                                    <span class="truncate">
                                        {{ old('gudang_tujuan_id') ? $gudang->firstWhere('id', old('gudang_tujuan_id'))->nama_gudang : 'Pilih Gudang Tujuan...' }}
                                    </span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                    <path d="m7 15 5 5 5-5" />
                                    <path d="m7 9 5-5 5 5" />
                                    </svg>
                                </button>
                                <div id="select-gudang-tujuan-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                    <header>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                        <circle cx="11" cy="11" r="8" />
                                        <path d="m21 21-4.3-4.3" />
                                    </svg>
                                    <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-gudang-tujuan-listbox" aria-labelledby="select-gudang-tujuan-trigger" />
                                    </header>
                                    <div role="listbox" id="select-gudang-tujuan-listbox" aria-orientation="vertical" aria-labelledby="select-gudang-tujuan-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                    <div role="group" aria-labelledby="group-label-select-gudang-tujuan">
                                        <div role="heading" id="group-label-select-gudang-tujuan">Gudang</div>
                                        @foreach ($gudang as $g)
                                        <div id="select-gudang-tujuan-option-{{ $g->id }}" role="option" data-value="{{ $g->id }}" {{ old('gudang_tujuan_id') == $g->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $g->nama_gudang }}">
                                            {{ $g->nama_gudang }}
                                        </div>
                                        @endforeach
                                    </div>
                                    </div>
                                </div>
                                <input type="hidden" name="gudang_tujuan_id" value="{{ old('gudang_tujuan_id') }}" />
                            </div>
                            @error('gudang_tujuan_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
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
                                        Total Stok
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Jumlah
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-neutral-primary border-b border-default">
                                    <td scope="row" class="px-6 py-4" width="40%">
                                        <div id="select-barang-0" class="w-full select">
                                            <button type="button" class="btn-outline justify-between font-normal w-full" id="select-barang-0-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-barang-0-listbox">
                                                <span class="truncate">{{ old('detail[0][barang_id]') ? $barang->where('id', old('detail[0][barang_id]'))->first()->nama_barang : 'Pilih...'  }}</span>
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
                                                    <div id="select-barang-0-option-{{ $b->id }}" role="option" data-value="{{ $b->id }}" data-satuan="{{ $b->satuan->nama_satuan }}" data-stok="{{ $b->stok_total ?? 0 }}" {{ old('detail[0][barang_id]') == $b->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $b->nama_barang }}">
                                                        {{ $b->nama_barang }}
                                                        <span class="text-xs text-muted-foreground">{{ $b->satuan->nama_satuan }}</span>
                                                    </div>
                                                    @endforeach
                                                </div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="detail[0][barang_id]" value="{{ old('detail[0][barang_id]') }}" />
                                        </div>
                                    </td>
                                    <td class="px-6 py-4" width="120px">
                                        <span class="satuan-display text-sm">-</span>
                                    </td>
                                    <td class="px-6 py-4" width="120px">
                                        <span class="stok-display text-sm">-</span>
                                    </td>
                                    <td class="px-6 py-4" width="140px">
                                        <input type="number" id="jml-0" class="w-full" name="detail[0][jml_kirim]"
                                            value="{{ old('detail[0][jml_kirim]', 0) }}" min="1" />
                                    </td>
                                    <td class="px-6 py-4" width="100px">
                                        <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                                            <i class="fa-solid fa-close"></i>
                                        </button>
                                    </td>
                                </tr>
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
                        @error('detail')<div class="text-red-600 text-sm p-4">{{ $message }}</div>@enderror
                    </div>

                    <footer class="flex gap-2 justify-end mt-2">
                        <button type="button" class="btn-outline" onclick="window.history.back()">Batal</button>
                        <button class="btn" type="submit">Simpan</button>
                    </footer>
                </form>
            </section>
        </div>
    </div>
    
    @push('scripts')
    <script>
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
                // Find ANY hidden input in this container to set the value
                const hiddenInput = container.querySelector('input[type="hidden"]');
                
                if (labelSpan) labelSpan.textContent = option.textContent.trim();
                
                if (hiddenInput) {
                     hiddenInput.value = option.dataset.value || '';
                }

                // Update satuan/stok display if applicable
                const row = container.closest('tr');
                if (row) {
                    const satuanDisplay = row.querySelector('.satuan-display');
                    if (satuanDisplay) {
                        satuanDisplay.textContent = option.dataset.satuan || '-';
                    }
                    const stokDisplay = row.querySelector('.stok-display');
                    if (stokDisplay) {
                         stokDisplay.textContent = option.dataset.stok || '0';
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
                const idHidden = row.querySelector('input[type="hidden"][name^="detail"][name$="[id]"]');
                if (idHidden) idHidden.name = `detail[${index}][id]`;
                const jumlah = row.querySelector('input[type="number"][name^="detail"][name$="[jml_kirim]"]');
                if (jumlah) {
                    jumlah.id = `jml-${index}`;
                    jumlah.name = `detail[${index}][jml_kirim]`;
                }
                
                const delBtn = row.querySelector('button.btn-destructive');
                if (delBtn) delBtn.setAttribute('onclick', 'removeRow(this)');
                if (labelSpan && !hidden.value) labelSpan.textContent = 'Pilih...';
            });
        }

        function resetRowValues(row) {
            const hidden = row.querySelector('input[type="hidden"][name$="[barang_id]"]');
            const jumlah = row.querySelector('input[type="number"][name$="[jml_kirim]"]');
            const idHidden = row.querySelector('input[type="hidden"][name$="[id]"]');
            const labelSpan = row.querySelector('.truncate');
            const satuanDisplay = row.querySelector('.satuan-display');
            const stokDisplay = row.querySelector('.stok-display');
            if (hidden) hidden.value = '';
            if (jumlah) jumlah.value = 0;
            if (idHidden) idHidden.value = '';
            if (labelSpan) labelSpan.textContent = 'Pilih...';
            if (satuanDisplay) satuanDisplay.textContent = '-';
            if (stokDisplay) stokDisplay.textContent = '-';
            
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
