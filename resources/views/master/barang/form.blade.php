<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                {{ $isEdit ? 'Ubah' : 'Tambah' }} Barang
            </h1>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">

            <section>
                <form method="POST" action="{{ $isEdit ? route('barang.update', $item->id) : route('barang.store') }}" class="form grid gap-4">
                    @csrf
                    @if($isEdit)
                    @method('PUT')
                    @endif
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="kode_barang">Kode Barang</label>
                            <input type="text" id="kode_barang" name="kode_barang" value="{{ old('kode_barang', $isEdit ? $item->kode_barang : '') }}"
                                autofocus />
                            @error('kode_barang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="nama_barang">Nama Barang</label>
                            <input type="text" id="nama_barang" name="nama_barang" value="{{ old('nama_barang', $isEdit ? $item->nama_barang : '') }}" />
                            @error('nama_barang')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="kategori_id">Kategori</label>
                            <div id="select-kategori" class="select">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-kategori-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-kategori-listbox">
                                    <span class="truncate">{{ old('kategori_id', $isEdit ? $item->kategori_id : '') ? $kategoris->where('id', old('kategori_id', $isEdit ? $item->kategori_id : ''))->first()->nama_kategori : 'Pilih...'  }}</span>

                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                    <path d="m7 15 5 5 5-5" />
                                    <path d="m7 9 5-5 5 5" />
                                    </svg>
                                </button>
                                <div id="select-kategori-popover" data-popover aria-hidden="true">
                                    <header>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                        <circle cx="11" cy="11" r="8" />
                                        <path d="m21 21-4.3-4.3" />
                                    </svg>
                                    <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-kategori-listbox" aria-labelledby="select-kategori-trigger" />
                                    </header>

                                    <div role="listbox" id="select-kategori-listbox" aria-orientation="vertical" aria-labelledby="select-kategori-trigger">
                                    <div role="group" aria-labelledby="group-label-select-kategori-items-1">
                                        <div role="heading" id="group-label-select-kategori-items-1">Kategori</div>

                                        @foreach ($kategoris as $k)
                                        <div id="select-kategori-items-1-{{ $k->id }}" role="option" data-value="{{ $k->id }}" {{ old('kategori_id') == $k->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $k->nama_kategori }}">
                                            {{ $k->nama_kategori }}
                                        </div>
                                        @endforeach
                                    </div>
                                    </div>
                                </div>
                                <input type="hidden" name="kategori_id" value="{{ old('kategori_id', $isEdit ? $item->kategori_id : '') }}" />
                            </div>
                            @error('kategori_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="satuan_id">Satuan</label>
                            <div id="select-satuan" class="select">
                                <button type="button" class="btn-outline justify-between font-normal w-full" id="select-satuan-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-satuan-listbox">
                                    <span class="truncate">{{ old('satuan_id', $isEdit ? $item->satuan_id : '') ? $satuans->where('id', old('satuan_id', $isEdit ? $item->satuan_id : ''))->first()->nama_satuan : 'Pilih...'  }}</span>

                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-up-down-icon lucide-chevrons-up-down text-muted-foreground opacity-50 shrink-0">
                                    <path d="m7 15 5 5 5-5" />
                                    <path d="m7 9 5-5 5 5" />
                                    </svg>
                                </button>
                                <div id="select-satuan-popover" data-popover aria-hidden="true">
                                    <header>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                                        <circle cx="11" cy="11" r="8" />
                                        <path d="m21 21-4.3-4.3" />
                                    </svg>
                                    <input type="text" class="w-full border-0 focus:border-0" value="" placeholder="Search entries..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="false" aria-controls="select-satuan-listbox" aria-labelledby="select-satuan-trigger" />
                                    </header>

                                    <div role="listbox" id="select-satuan-listbox" aria-orientation="vertical" aria-labelledby="select-satuan-trigger">
                                    <div role="group" aria-labelledby="group-label-select-satuan-items-1">
                                        <div role="heading" id="group-label-select-satuan-items-1">Satuan</div>

                                        @foreach ($satuans as $s)
                                        <div id="select-satuan-items-1-{{ $s->id }}" role="option" data-value="{{ $s->id }}" {{ old('satuan_id') == $s->id ? 'aria-selected="true"' : '' }} data-keywords="{{ $s->nama_satuan }}">
                                            {{ $s->nama_satuan }}
                                        </div>
                                        @endforeach
                                    </div>
                                    </div>
                                </div>
                                <input type="hidden" name="satuan_id" value="{{ old('satuan_id', $isEdit ? $item->satuan_id : '') }}" />
                            </div>
                            @error('satuan_id')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        <div class="grid gap-3">
                            <label for="stok_tersedia">Stok Tersedia</label>
                            <input type="number" id="stok_tersedia" class="w-full" name="stok_tersedia"
                                value="{{ old('stok_tersedia', $isEdit ? $item->stok_tersedia : 0) }}" min="0" />
                        </div>
                        <div class="grid gap-3">
                            <label for="stok_minimum">Stok Minimum</label>
                            <input type="number" id="stok_minimum" class="w-full" name="stok_minimum"
                                value="{{ old('stok_minimum', $isEdit ? $item->stok_minimum : 0) }}" min="0" />
                        </div>
                        <div class="grid gap-3">
                            <label for="stok_maksimum">Stok Maksimum</label>
                            <input type="number" id="stok_maksimum" class="w-full" name="stok_maksimum"
                                value="{{ old('stok_maksimum', $isEdit ? $item->stok_maksimum : 0) }}" min="0" />
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="grid gap-3">
                            <label for="harga_satuan">Harga Satuan</label>
                            <input type="number" step="0.01" id="harga_satuan" name="harga_satuan" value="{{ old('harga_satuan', $isEdit ? $item->harga_satuan : 0) }}" min="0" />
                        </div>
                        <div class="grid gap-3">
                            <label for="lokasi_penyimpanan">Lokasi Penyimpanan</label>
                            <input type="text" id="lokasi_penyimpanan" name="lokasi_penyimpanan" value="{{ old('lokasi_penyimpanan', $isEdit ? $item->lokasi_penyimpanan : '') }}" />
                        </div>
                        <div class="grid gap-3">
                            <label for="kondisi_fisik">Kondisi Fisik</label>
                            <select id="kondisi_fisik" name="kondisi_fisik" class="w-full">
                                @foreach (['baik','rusak','habis','diperbaiki'] as $opt)
                                    <option value="{{ $opt }}" {{ old('kondisi_fisik', $isEdit ? $item->kondisi_fisik : 'baik') == $opt ? 'selected' : '' }}>{{ ucfirst($opt) }}</option>
                                @endforeach
                            </select>
                            @error('kondisi_fisik')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="is_active">Status Aktif</label>
                            <select id="is_active" name="is_active" class="w-full">
                                <option value="1" {{ old('is_active', $isEdit ? $item->is_active : '1') == '1' ? 'selected' : '' }}>Aktif</option>
                                <option value="0" {{ old('is_active', $isEdit ? $item->is_active : '0') == '0' ? 'selected' : '' }}>Nonaktif</option>
                            </select>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
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
    
</x-app-layout>
