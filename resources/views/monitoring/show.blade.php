<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">
                Detail Monitoring Barang
            </h1>
            <div class="flex items-center gap-2">
                <a href="{{ route('monitoring-barang.edit', $item->id) }}" class="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">
                    <i class="fas fa-edit"></i> Ubah
                </a>
            </div>
        </div>

        @if (session('status'))
            <div class="mb-4 rounded border border-green-200 bg-green-50 text-green-700 px-3 py-2 text-sm">{{ session('status') }}</div>
        @endif

        <div class="overflow-hidden rounded-lg border p-4">
            <section>
                <div class="space-y-1 mb-4">
                    <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Kode Monitoring</p>
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
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Petugas</p>
                        <p class="text-base font-semibold text-gray-900">{{ $item->petugas->name ?? '-' }}</p>
                    </div>

                    <div class="space-y-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Lokasi</p>
                        <p class="text-base font-semibold text-gray-900">{{ $item->lokasi ?? '-' }}</p>
                    </div>

                    <div class="space-y-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Keterangan</p>
                        <p class="text-base font-semibold text-gray-900">{{ $item->keterangan ?? '-' }}</p>
                    </div>
                </div>


                    <div class="relative bg-neutral-primary-soft shadow-xs rounded-base border border-default">
                        <table class="w-full text-sm text-left rtl:text-right text-body">
                            <thead class="text-sm text-body bg-neutral-secondary-soft border-b rounded-base border-default">
                                <tr>
                                    <th scope="col" class="px-6 py-3 font-medium">Barang</th>
                                    <th scope="col" class="px-6 py-3 font-medium text-center">Satuan</th>
                                    <th scope="col" class="px-6 py-3 font-medium text-center">Baik</th>
                                    <th scope="col" class="px-6 py-3 font-medium text-center">Rusak Ringan</th>
                                    <th scope="col" class="px-6 py-3 font-medium text-center">Rusak Berat</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($item->detail as $d)
                                    <tr class="bg-neutral-primary border-b border-default">
                                        <td scope="row" class="px-6 py-4">
                                            {{ $d->barang?->nama_barang }}
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            {{ $d->barang?->satuan?->nama_satuan ?? '-' }}
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800">{{ $d->baik ?? '0'}}</span>
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-yellow-100 text-yellow-800">{{ $d->rusak_ringan ?? '0'}}</span>
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-red-100 text-red-800">{{ $d->rusak_berat ?? '0'}}</span>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
            </section>
        </div>
    </div>
</x-app-layout>
