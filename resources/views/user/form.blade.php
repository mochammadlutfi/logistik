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
                            <label for="nama_user">Nama</label>
                            <input type="text" id="nama_user" name="nama_user" value="{{ old('nama_user', $isEdit ? $item->nama_user : '') }}" />
                            @error('nama_user')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="role">Jabatan</label>
                            <select id="role" name="role" class="select">
                                <option value="">Pilih...</option>
                                <option>Admin</option>
                                <option>Staf Gudang Logistik</option>
                                <option>Gudang Logistik</option>
                                <option>Kabag Logistik</option>
                            </select>
                            @error('role')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        <div class="grid gap-3">
                            <label for="email">Email</label>
                            <input type="email" id="email" class="w-full" name="email"
                                value="{{ old('email', $isEdit ? $item->email : '') }}" />
                            @error('email')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
                        </div>
                        <div class="grid gap-3">
                            <label for="password">Password</label>
                            <input type="password" id="password" class="w-full" name="password"
                                value="{{ old('password', $isEdit ? $item->password : '') }}" />
                            @error('password')<div class="text-red-600 text-sm">{{ $message }}</div>@enderror
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
    </div>
    
</x-app-layout>
