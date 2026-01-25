<x-app-layout>
    <div class="p-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between gap-2 mb-6">
            <h1 class="text-xl font-semibold">Download Laporan</h1>
        </div>

        <div class="max-w-xl">
            <div class="rounded-lg border p-6 w-full">
                <form id="form-laporan" method="GET" class="grid gap-4">
                    <!-- Jenis Laporan -->
                    <div class="grid gap-2">
                        <label for="jenis_laporan" class="font-medium">Jenis Laporan</label>
                        <select name="jenis_laporan" id="jenis_laporan" class="w-full select" required>
                            <option value="">Pilih Jenis Laporan</option>
                            <option value="stok-barang">Laporan Stok Barang</option>
                            <option value="barang-masuk">Laporan Barang Masuk</option>
                            <option value="barang-keluar">Laporan Barang Keluar</option>
                            <option value="permintaan-barang">Laporan Permintaan Barang</option>
                            <option value="pemeliharaan-barang">Laporan Pemeliharaan Barang</option>
                        </select>
                    </div>

                    <!-- Periode (Conditional) -->
                    <div id="field-periode" class="grid gap-2 hidden">
                        <label class="font-medium">Periode</label>
                        <div class="grid grid-cols-2 gap-3">
                            <div class="grid gap-1">
                                <label class="text-sm text-muted-foreground">Tanggal Awal</label>
                                <input type="text" name="tanggal_awal" id="tanggal_awal" class="input w-full datepicker" placeholder="Pilih tanggal" readonly>
                            </div>
                            <div class="grid gap-1">
                                <label class="text-sm text-muted-foreground">Tanggal Akhir</label>
                                <input type="text" name="tanggal_akhir" id="tanggal_akhir" class="input w-full datepicker" placeholder="Pilih tanggal" readonly>
                            </div>
                        </div>
                    </div>

                    <!-- Status (Conditional - for Permintaan Barang) -->
                    <div id="field-status" class="grid gap-2 hidden">
                        <label for="status" class="font-medium">Status</label>
                        <select name="status" id="status" class="w-full select">
                            <option value="">Semua Status</option>
                            <option value="diajukan">Diajukan</option>
                            <option value="menunggu_persetujuan">Menunggu Persetujuan</option>
                            <option value="disetujui">Disetujui</option>
                            <option value="ditolak">Ditolak</option>
                            <option value="selesai">Selesai</option>
                        </select>
                    </div>

                    <!-- Format Laporan -->
                    <div class="grid gap-2">
                        <label class="font-medium">Format Laporan</label>
                        <div class="flex gap-6">
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="format" value="excel" checked class="w-4 h-4">
                                <span><i class="fa-solid fa-file-excel text-green-600 mr-1"></i> Excel</span>
                            </label>
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="format" value="pdf" class="w-4 h-4">
                                <span><i class="fa-solid fa-file-pdf text-red-600 mr-1"></i> PDF</span>
                            </label>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="pt-2">
                        <button type="submit" class="btn btn-primary w-full" id="btn-download" disabled>
                            <i class="fa-solid fa-download mr-2"></i>Download Laporan
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const jenisLaporan = document.getElementById('jenis_laporan');
            const fieldPeriode = document.getElementById('field-periode');
            const fieldStatus = document.getElementById('field-status');
            const btnDownload = document.getElementById('btn-download');
            const form = document.getElementById('form-laporan');
            const tanggalAwal = document.getElementById('tanggal_awal');
            const tanggalAkhir = document.getElementById('tanggal_akhir');

            // Initialize flatpickr
            const fpAwal = flatpickr(tanggalAwal, {
                altInput: true,
                altFormat: "d F Y",
                dateFormat: "Y-m-d",
                defaultDate: new Date().setDate(1),
                onChange: function(selectedDates) {
                    if (selectedDates[0]) {
                        fpAkhir.set('minDate', selectedDates[0]);
                    }
                }
            });

            const fpAkhir = flatpickr(tanggalAkhir, {
                altInput: true,
                altFormat: "d F Y",
                dateFormat: "Y-m-d",
                defaultDate: new Date()
            });

            // Reports that need periode
            const needsPeriode = ['barang-masuk', 'barang-keluar', 'permintaan-barang', 'pemeliharaan-barang'];

            // Reports that need status
            const needsStatus = ['permintaan-barang'];

            jenisLaporan.addEventListener('change', function() {
                const value = this.value;

                // Toggle periode field
                if (needsPeriode.includes(value)) {
                    fieldPeriode.classList.remove('hidden');
                    tanggalAwal.required = true;
                    tanggalAkhir.required = true;
                } else {
                    fieldPeriode.classList.add('hidden');
                    tanggalAwal.required = false;
                    tanggalAkhir.required = false;
                }

                // Toggle status field
                if (needsStatus.includes(value)) {
                    fieldStatus.classList.remove('hidden');
                } else {
                    fieldStatus.classList.add('hidden');
                }

                // Enable/disable button
                btnDownload.disabled = !value;
            });

            // Form submission
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const jenis = jenisLaporan.value;
                if (!jenis) return;

                const baseUrl = '{{ url("laporan") }}/' + jenis;
                const params = new URLSearchParams();

                // Add format
                const format = document.querySelector('input[name="format"]:checked').value;
                params.append('format', format);

                // Add periode if visible
                if (needsPeriode.includes(jenis)) {
                    if (!tanggalAwal.value || !tanggalAkhir.value) {
                        alert('Silakan pilih periode terlebih dahulu');
                        return;
                    }
                    params.append('tanggal_awal', tanggalAwal.value);
                    params.append('tanggal_akhir', tanggalAkhir.value);
                }

                // Add status if visible and has value
                if (needsStatus.includes(jenis)) {
                    const status = document.getElementById('status').value;
                    if (status) {
                        params.append('status', status);
                    }
                }

                // Redirect to download
                window.location.href = baseUrl + '?' + params.toString();
            });
        });
    </script>
    @endpush
</x-app-layout>
