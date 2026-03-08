<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                {{ $isEdit ? 'Ubah' : 'Buat' }} Laporan Kerusakan Barang
            </h1>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="rounded-lg border p-4">
            <section>
                <form method="POST" action="{{ $isEdit ? route('laporan-kerusakan.update', $item->id) : route('laporan-kerusakan.store') }}" class="form grid gap-4">
                    @csrf
                    @if($isEdit)
                    @method('PUT')
                    @endif
                    <input type="hidden" name="detail_hapus" id="detail_hapus" value="" />

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="grid gap-3">
                            <label for="pemeliharaan_id">Sumber Pemeliharaan <span class="text-red-500">*</span></label>
                            <div id="select-pemeliharaan" class="w-full select">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-pemeliharaan-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-pemeliharaan-listbox">
                                    <span class="truncate">{{ old('pemeliharaan_id', $isEdit ? $item->pemeliharaan_id : '') ? ($pemeliharaan->where('id', old('pemeliharaan_id', $isEdit ? $item->pemeliharaan_id : ''))->first()->kode ?? 'Pilih...') : 'Pilih...' }}</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0"><path d="m7 15 5 5 5-5"/><path d="m7 9 5-5 5 5"/></svg>
                                </button>
                                <div id="select-pemeliharaan-popover" data-popover aria-hidden="true" style="max-height: 320px; overflow: hidden;">
                                    <header>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                                        <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-pemeliharaan-listbox" aria-labelledby="select-pemeliharaan-trigger" />
                                    </header>
                                    <div role="listbox" id="select-pemeliharaan-listbox" aria-orientation="vertical" aria-labelledby="select-pemeliharaan-trigger" class="scrollbar overflow-y-auto" style="max-height: 256px;">
                                        <div role="group" aria-labelledby="group-label-select-pemeliharaan">
                                            <div role="heading" id="group-label-select-pemeliharaan">Pemeliharaan Barang</div>
                                            @foreach ($pemeliharaan ?? [] as $p)
                                            @php $isSelected = old('pemeliharaan_id', $isEdit ? $item->pemeliharaan_id : '') == $p->id; @endphp
                                            <div id="select-pemeliharaan-option-{{ $p->id }}" role="option" data-value="{{ $p->id }}" data-keywords="{{ $p->kode }}" {{ $isSelected ? 'aria-selected="true"' : '' }}>
                                                {{ $p->kode }} - {{ \Carbon\Carbon::parse($p->tanggal)->format('d/m/Y') }}
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="pemeliharaan_id" value="{{ old('pemeliharaan_id', $isEdit ? $item->pemeliharaan_id : '') }}" required/>
                            </div>
                            @error('pemeliharaan_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>

                        <div class="grid gap-3">
                            <label for="tanggal">Tanggal <span class="text-red-500">*</span></label>
                            <input type="text" class="datepicker" id="tanggal" name="tanggal" value="{{ old('tanggal', $isEdit ? $item->tanggal : date('Y-m-d')) }}" required />
                            @error('tanggal')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>

                        @if($isEdit)
                        <div class="grid gap-3">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="w-full">
                                <option value="pending" {{ old('status', $item->status) == 'pending' ? 'selected' : '' }}>Pending</option>
                                <option value="diproses" {{ old('status', $item->status) == 'diproses' ? 'selected' : '' }}>Diproses</option>
                                <option value="selesai" {{ old('status', $item->status) == 'selesai' ? 'selected' : '' }}>Selesai</option>
                            </select>
                            @error('status')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        @endif
                    </div>

                    <div class="relative bg-neutral-primary-soft shadow-xs rounded-base border border-default overflow-x-auto">
                        <table class="w-full text-sm text-left rtl:text-right text-body">
                            <thead class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <th scope="col" class="px-6 py-3 font-medium">Barang</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Satuan</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Rusak Ringan</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Tindakan Rusak Ringan</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Rusak Berat</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Tindakan Rusak Berat</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Keterangan</th>
                                    <th scope="col" class="px-6 py-3 font-medium">Aksi</th>
                                </tr>
                            </thead>
                            <tbody id="detail-tbody">
                                @if($isEdit && $item->detail->count() > 0)
                                    @foreach ($item->detail as $k => $d)
                                    <tr class="bg-neutral-primary border-b border-default">
                                        <td class="px-6 py-4">
                                            <input type="hidden" name="detail[{{ $k }}][id]" value="{{ $d->id }}" />
                                            <input type="hidden" name="detail[{{ $k }}][barang_id]" value="{{ $d->barang_id }}" />
                                            <span class="text-sm">{{ $d->barang->nama_barang }}</span>
                                        </td>
                                        <td class="px-6 py-4">
                                            <span class="text-sm">{{ $d->barang->satuan->nama_satuan ?? '-' }}</span>
                                        </td>
                                        <td class="px-6 py-4" width="10%">
                                            <input type="number" name="detail[{{ $k }}][rusak_ringan]" class="w-full" value="{{ old('detail.'.$k.'.rusak_ringan', $d->rusak_ringan) }}" min="0" />
                                        </td>
                                        <td class="px-6 py-4" width="15%">
                                            <select name="detail[{{ $k }}][tindakan_rusak_ringan]" class="w-full text-sm">
                                                <option value="">Pilih Tindakan</option>
                                                <option value="diganti" {{ old('detail.'.$k.'.tindakan_rusak_ringan', $d->tindakan_rusak_ringan) == 'diganti' ? 'selected' : '' }}>Diganti</option>
                                                <option value="masih_bisa_dipakai" {{ old('detail.'.$k.'.tindakan_rusak_ringan', $d->tindakan_rusak_ringan) == 'masih_bisa_dipakai' ? 'selected' : '' }}>Masih Bisa Dipakai</option>
                                            </select>
                                        </td>
                                        <td class="px-6 py-4" width="10%">
                                            <input type="number" name="detail[{{ $k }}][rusak_berat]" class="w-full" value="{{ old('detail.'.$k.'.rusak_berat', $d->rusak_berat) }}" min="0" />
                                        </td>
                                        <td class="px-6 py-4" width="15%">
                                            <select name="detail[{{ $k }}][tindakan_rusak_berat]" class="w-full text-sm">
                                                <option value="">Pilih Tindakan</option>
                                                <option value="diprovinsiin" {{ old('detail.'.$k.'.tindakan_rusak_berat', $d->tindakan_rusak_berat) == 'diprovinsiin' ? 'selected' : '' }}>Diprovinsiin</option>
                                                <option value="dimusnahkan" {{ old('detail.'.$k.'.tindakan_rusak_berat', $d->tindakan_rusak_berat) == 'dimusnahkan' ? 'selected' : '' }}>Dimusnahkan</option>
                                                <option value="diganti_baru" {{ old('detail.'.$k.'.tindakan_rusak_berat', $d->tindakan_rusak_berat) == 'diganti_baru' ? 'selected' : '' }}>Diganti Baru</option>
                                            </select>
                                        </td>
                                        <td class="px-6 py-4">
                                            <input type="text" name="detail[{{ $k }}][keterangan]" class="w-full" value="{{ old('detail.'.$k.'.keterangan', $d->keterangan) }}" />
                                        </td>
                                        <td class="px-6 py-4" width="10%">
                                            <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                                                <i class="fa-solid fa-close"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    @endforeach
                                @else
                                <tr class="bg-neutral-primary border-b border-default">
                                    <td colspan="8" class="px-6 py-4 text-center text-gray-500">
                                        Pilih sumber pemeliharaan untuk memuat data barang rusak
                                    </td>
                                </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>

                    <div class="grid gap-3">
                        <label for="catatan">Catatan</label>
                        <textarea id="catatan" name="catatan" rows="3">{{ old('catatan', $isEdit ? $item->catatan : '') }}</textarea>
                    </div>

                    <footer class="flex gap-2 justify-end mt-2">
                        <a href="{{ route('laporan-kerusakan.index') }}" class="btn-outline">Batal</a>
                        <button class="btn" type="submit">Simpan</button>
                    </footer>
                </form>
            </section>
        </div>
    </div>

    @push('scripts')
    <script>
        // Custom select handler
        document.addEventListener('click', function (e) {
            const trigger = e.target.closest('[id$="-trigger"]');
            if (trigger && trigger.closest('.select')) {
                e.preventDefault();
                e.stopPropagation();
                const container = trigger.closest('.select');
                const popover = container.querySelector('[id$="-popover"]');
                const isHidden = popover && popover.getAttribute('aria-hidden') !== 'false';

                document.querySelectorAll('.select [data-popover]').forEach(p => {
                    if (p !== popover) p.setAttribute('aria-hidden', 'true');
                });

                if (popover) {
                    popover.setAttribute('aria-hidden', isHidden ? 'false' : 'true');
                    if (isHidden) {
                        const searchInput = popover.querySelector('input[role="combobox"]');
                        if (searchInput) setTimeout(() => searchInput.focus(), 50);
                    }
                }
                return;
            }

            const option = e.target.closest('[role="option"]');
            if (option && option.closest('.select')) {
                e.preventDefault();
                const container = option.closest('.select');
                const labelSpan = container.querySelector('.truncate');
                const hiddenInput = container.querySelector('input[type="hidden"]');
                const permintaanInput = container.querySelector('input[name="pemeliharaan_id"]');

                if (labelSpan) labelSpan.textContent = option.textContent.trim();
                if (hiddenInput) hiddenInput.value = option.dataset.value || '';
                if (permintaanInput) permintaanInput.value = option.dataset.value || '';

                container.querySelectorAll('[role="option"][aria-selected="true"]').forEach(el => el.removeAttribute('aria-selected'));
                option.setAttribute('aria-selected', 'true');

                const popover = container.querySelector('[id$="-popover"]');
                if (popover) popover.setAttribute('aria-hidden', 'true');

                const searchInput = popover?.querySelector('input[role="combobox"]');
                if (searchInput) {
                    searchInput.value = '';
                    const listbox = container.querySelector('[role="listbox"]');
                    if (listbox) {
                        listbox.querySelectorAll('[role="option"]').forEach(opt => {
                            opt.style.display = '';
                        });
                    }
                }

                // Fetch pemeliharaan detail
                if (permintaanInput && option.dataset.value) {
                    fetchPemeliharaanDetail(option.dataset.value);
                }
                return;
            }

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

        // Keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                document.querySelectorAll('.select [data-popover]').forEach(p => p.setAttribute('aria-hidden', 'true'));
            }
        });

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
            row.remove();
        }

        // Fetch pemeliharaan detail and populate table
        function fetchPemeliharaanDetail(pemeliharaanId) {
            if (!pemeliharaanId) return;

            fetch(`/laporan-kerusakan/${pemeliharaanId}/pemeliharaan-detail`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(res => res.json())
            .then(data => {
                console.log('Pemeliharaan detail data:', data);
                if (data.success && data.data && data.data.detail) {
                    populateDetailTable(data.data.detail);
                }
            })
            .catch(error => {
                console.error('Error fetching pemeliharaan detail:', error);
            });
        }

        // Populate detail table
        function populateDetailTable(details) {
            const tbody = document.getElementById('detail-tbody');
            tbody.innerHTML = '';

            if (details.length === 0) {
                tbody.innerHTML = '<tr class="bg-neutral-primary border-b border-default"><td colspan="8" class="px-6 py-4 text-center text-gray-500">Tidak ada data barang rusak</td></tr>';
                return;
            }

            details.forEach((detail, index) => {
                const barangInfo = detail.barang;
                const satuanNama = barangInfo && barangInfo.satuan ? barangInfo.satuan.nama_satuan : '-';

                const row = document.createElement('tr');
                row.className = 'bg-neutral-primary border-b border-default';
                row.innerHTML = `
                    <td class="px-6 py-4">
                        <input type="hidden" name="detail[${index}][barang_id]" value="${detail.barang_id}" />
                        <span class="text-sm">${barangInfo ? barangInfo.nama_barang : '-'}</span>
                    </td>
                    <td class="px-6 py-4">
                        <span class="text-sm">${satuanNama}</span>
                    </td>
                    <td class="px-6 py-4" width="10%">
                        <input type="number" name="detail[${index}][rusak_ringan]" class="w-full" value="${detail.rusak_ringan || 0}" min="0" />
                    </td>
                    <td class="px-6 py-4" width="15%">
                        <select name="detail[${index}][tindakan_rusak_ringan]" class="w-full text-sm">
                            <option value="">Pilih Tindakan</option>
                            <option value="diganti">Diganti</option>
                            <option value="masih_bisa_dipakai">Masih Bisa Dipakai</option>
                        </select>
                    </td>
                    <td class="px-6 py-4" width="10%">
                        <input type="number" name="detail[${index}][rusak_berat]" class="w-full" value="${detail.rusak_berat || 0}" min="0" />
                    </td>
                    <td class="px-6 py-4" width="15%">
                        <select name="detail[${index}][tindakan_rusak_berat]" class="w-full text-sm">
                            <option value="">Pilih Tindakan</option>
                            <option value="diprovinsiin">Diprovinsiin</option>
                            <option value="dimusnahkan">Dimusnahkan</option>
                            <option value="diganti_baru">Diganti Baru</option>
                        </select>
                    </td>
                    <td class="px-6 py-4">
                        <input type="text" name="detail[${index}][keterangan]" class="w-full" value="${detail.keterangan || ''}" />
                    </td>
                    <td class="px-6 py-4" width="10%">
                        <button type="button" class="btn-destructive btn-sm" onclick="removeRow(this)">
                            <i class="fa-solid fa-close"></i>
                        </button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }
    </script>
    @endpush
</x-app-layout>
