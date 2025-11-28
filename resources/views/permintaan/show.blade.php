<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                Detail Barang Masuk
            </h1>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <section>
                <div class="space-y-1 mb-4">
                    <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Kode Transaksi</p>
                    <p class="text-2xl font-semibold text-gray-900">
                        {{ $item->kode }}
                    </p>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                    <div class="space-y-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Tanggal</p>
                        <p class="text-base font-semibold text-gray-900">{{ \Carbon\Carbon::parse($item->tanggal)->format('d-m-Y')  }}</p>
                    </div>

                    <div class="space-y-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Alasan</p>
                        <p class="text-base font-semibold text-gray-900">{{ $item->alasan ?? '-' }}</p>
                    </div>
                    
                </div>


                    <div class="relative bg-neutral-primary-soft shadow-xs rounded-base border border-default">
                        <table class="w-full text-sm text-left rtl:text-right text-body">
                            <thead class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <th scope="col" class="px-6 py-3 font-medium" width="40%">
                                        Produk
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium" width="140px">
                                        Jumlah
                                    </th>
                                    <th scope="col" class="px-6 py-3 font-medium">
                                        Catatan
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($item->detail as $d)
                                    <tr class="bg-neutral-primary border-b border-default">
                                        <td scope="row" class="px-6 py-4" width="40%">
                                            {{ $d->barang?->nama_barang }}
                                        </td>
                                        <td class="px-6 py-4" width="140px">
                                            {{ $d->jml ?? '0'}}
                                        </td>
                                        <td class="px-6 py-4">
                                        {{ $d->keterangan  ?? '-'}}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
            </section>
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
                const jumlah = row.querySelector('input[type="number"][name^="detail"][name$="[stok_minimum]"]');
                if (jumlah) {
                    jumlah.id = `stok_minimum-${index}`;
                    jumlah.name = `detail[${index}][stok_minimum]`;
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
            const jumlah = row.querySelector('input[type="number"][name$="[stok_minimum]"]');
            const catatan = row.querySelector('input[type="text"][name$="[keterangan]"]');
            const labelSpan = row.querySelector('.truncate');
            if (hidden) hidden.value = '';
            if (jumlah) jumlah.value = 0;
            if (catatan) catatan.value = '';
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
