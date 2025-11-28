@php($title = 'Kategori Barang')
<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8" x-data="{ edit: { id: null, kode_kategori: '', nama_kategori: '', keterangan: '' } }">
        <div class="flex items-center justify-between   mb-4">
            <h1 class="text-xl font-semibold">{{ $title }}</h1>
            <div class="flex items-center gap-2">
                <button type="button" onclick="document.getElementById('demo-dialog-edit-profile').showModal()" class="btn-outline">
                    <i class="fa-solid fa-plus"></i>
                    Tambah Kategori
                </button>
            </div>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <table id="default-table">
                <thead>
                    <tr>
                        <th>
                            <span class="flex items-center">
                                Name
                                <svg class="w-4 h-4 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m8 15 4 4 4-4m0-6-4-4-4 4"/>
                                </svg>
                            </span>
                        </th>
                        <th data-type="date" data-format="YYYY/DD/MM">
                            <span class="flex items-center">
                                Release Date
                                <svg class="w-4 h-4 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m8 15 4 4 4-4m0-6-4-4-4 4"/>
                                </svg>
                            </span>
                        </th>
                        <th>
                            <span class="flex items-center">
                                NPM Downloads
                                <svg class="w-4 h-4 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m8 15 4 4 4-4m0-6-4-4-4 4"/>
                                </svg>
                            </span>
                        </th>
                        <th>
                            <span class="flex items-center">
                                Growth
                                <svg class="w-4 h-4 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m8 15 4 4 4-4m0-6-4-4-4 4"/>
                                </svg>
                            </span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Flowbite</td>
                        <td>2021/25/09</td>
                        <td>269000</td>
                        <td>49%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">React</td>
                        <td>2013/24/05</td>
                        <td>4500000</td>
                        <td>24%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Angular</td>
                        <td>2010/20/09</td>
                        <td>2800000</td>
                        <td>17%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Vue</td>
                        <td>2014/12/02</td>
                        <td>3600000</td>
                        <td>30%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Svelte</td>
                        <td>2016/26/11</td>
                        <td>1200000</td>
                        <td>57%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Ember</td>
                        <td>2011/08/12</td>
                        <td>500000</td>
                        <td>44%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Backbone</td>
                        <td>2010/13/10</td>
                        <td>300000</td>
                        <td>9%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">jQuery</td>
                        <td>2006/28/01</td>
                        <td>6000000</td>
                        <td>5%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Bootstrap</td>
                        <td>2011/19/08</td>
                        <td>1800000</td>
                        <td>12%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Foundation</td>
                        <td>2011/23/09</td>
                        <td>700000</td>
                        <td>8%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Bulma</td>
                        <td>2016/24/10</td>
                        <td>500000</td>
                        <td>7%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Next.js</td>
                        <td>2016/25/10</td>
                        <td>2300000</td>
                        <td>45%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Nuxt.js</td>
                        <td>2016/16/10</td>
                        <td>900000</td>
                        <td>50%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Meteor</td>
                        <td>2012/17/01</td>
                        <td>1000000</td>
                        <td>10%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Aurelia</td>
                        <td>2015/08/07</td>
                        <td>200000</td>
                        <td>20%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Inferno</td>
                        <td>2016/27/09</td>
                        <td>100000</td>
                        <td>35%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Preact</td>
                        <td>2015/16/08</td>
                        <td>600000</td>
                        <td>28%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Lit</td>
                        <td>2018/28/05</td>
                        <td>400000</td>
                        <td>60%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Alpine.js</td>
                        <td>2019/02/11</td>
                        <td>300000</td>
                        <td>70%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Stimulus</td>
                        <td>2018/06/03</td>
                        <td>150000</td>
                        <td>25%</td>
                    </tr>
                    <tr>
                        <td class="font-medium text-heading whitespace-nowrap">Solid</td>
                        <td>2021/05/07</td>
                        <td>250000</td>
                        <td>80%</td>
                    </tr>
                </tbody>
            </table>

        </div>

        <div class="mt-4"></div>
    </div>

    <dialog id="demo-dialog-edit-profile" class="dialog w-full sm:max-w-[425px] max-h-[612px]" aria-labelledby="demo-dialog-edit-profile-title" aria-describedby="demo-dialog-edit-profile-description" onclick="if (event.target === this) this.close()">
        <div>
            <header>
            <h2 id="demo-dialog-edit-profile-title">Tambah Kategori</h2>
            <p id="demo-dialog-edit-profile-description">Isi data kategori barang di bawah ini.</p>
            </header>

            <section>
            <form class="form grid gap-4">
                <div class="grid gap-3">
                <label for="demo-dialog-edit-profile-name">Name</label>
                <input type="text" value="Pedro Duarte" id="demo-dialog-edit-profile-name" autofocus />
                </div>
                <div class="grid gap-3">
                <label for="demo-dialog-edit-profile-username">Username</label>
                <input type="text" value="@peduarte" id="demo-dialog-edit-profile-username" />
                </div>
            </form>
            </section>

            <footer>
            <button class="btn-outline" onclick="this.closest('dialog').close()">Cancel</button>
            <button class="btn" onclick="this.closest('dialog').close()">Save changes</button>
            </footer>

            <button type="button" aria-label="Close dialog" onclick="this.closest('dialog').close()">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
                <path d="M18 6 6 18" />
                <path d="m6 6 12 12" />
            </svg>
            </button>
        </div>
        </dialog>
    <x-modal name="create-kategori" :show="false" maxWidth="xl">
        <div class="p-6">
            <h2 class="text-lg font-semibold mb-4">Tambah Kategori</h2>
            <form method="POST" action="{{ route('kategori.store') }}" class="space-y-4">
                @csrf
                <div>
                    <x-input-label for="kode_kategori" value="Kode Kategori" />
                    <x-text-input id="kode_kategori" name="kode_kategori" type="text" class="mt-1 block w-full" value="{{ old('kode_kategori') }}" />
                    <x-input-error :messages="$errors->get('kode_kategori')" class="mt-2" />
                </div>
                <div>
                    <x-input-label for="nama_kategori" value="Nama Kategori" />
                    <x-text-input id="nama_kategori" name="nama_kategori" type="text" class="mt-1 block w-full" value="{{ old('nama_kategori') }}" />
                    <x-input-error :messages="$errors->get('nama_kategori')" class="mt-2" />
                </div>
                <div>
                    <x-input-label for="keterangan" value="Keterangan" />
                    <textarea id="keterangan" name="keterangan" class="mt-1 block w-full border rounded px-3 py-2">{{ old('keterangan') }}</textarea>
                    <x-input-error :messages="$errors->get('keterangan')" class="mt-2" />
                </div>
                <div class="flex items-center justify-end gap-2">
                    <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 rounded px-3 py-2 text-sm" x-on:click="$dispatch('close-modal', 'create-kategori')">Batal</button>
                    <button class="bg-blue-600 hover:bg-blue-700 text-white rounded px-3 py-2 text-sm">Simpan</button>
                </div>
            </form>
        </div>
    </x-modal>

    <x-modal name="edit-kategori" :show="false" maxWidth="xl">
        <div class="p-6">
            <h2 class="text-lg font-semibold mb-4">Edit Kategori</h2>
            <template x-if="edit && edit.id">
                <form method="POST" x-bind:action="'{{ url('/kategori') }}/' + edit.id" class="space-y-4">
                    @csrf
                    @method('PUT')
                    <div>
                        <x-input-label for="edit_kode_kategori" value="Kode Kategori" />
                        <x-text-input id="edit_kode_kategori" name="kode_kategori" type="text" class="mt-1 block w-full" x-model="edit.kode_kategori" />
                        <x-input-error :messages="$errors->get('kode_kategori')" class="mt-2" />
                    </div>
                    <div>
                        <x-input-label for="edit_nama_kategori" value="Nama Kategori" />
                        <x-text-input id="edit_nama_kategori" name="nama_kategori" type="text" class="mt-1 block w-full" x-model="edit.nama_kategori" />
                        <x-input-error :messages="$errors->get('nama_kategori')" class="mt-2" />
                    </div>
                    <div>
                        <x-input-label for="edit_keterangan" value="Keterangan" />
                        <textarea id="edit_keterangan" name="keterangan" class="mt-1 block w-full border rounded px-3 py-2" x-model="edit.keterangan"></textarea>
                        <x-input-error :messages="$errors->get('keterangan')" class="mt-2" />
                    </div>
                    <div class="flex items-center justify-end gap-2">
                        <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 rounded px-3 py-2 text-sm" x-on:click="$dispatch('close-modal', 'edit-kategori')">Batal</button>
                        <button class="bg-blue-600 hover:bg-blue-700 text-white rounded px-3 py-2 text-sm">Simpan</button>
                    </div>
                </form>
            </template>
        </div>
    </x-modal>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            $('#default-table').DataTable();
        });
    </script>
    @endpush
</x-app-layout>