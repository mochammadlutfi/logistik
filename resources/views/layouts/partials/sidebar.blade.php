<aside class="sidebar" data-side="left" aria-hidden="false">
    <nav aria-label="Sidebar navigation">
        <section class="scrollbar">
            <div class="p-3">
                <img src="{{ asset('logo.png') }}" alt="logo">
            </div>
            <div role="group" aria-labelledby="group-label-content-1">
                <ul>
                    <li>
                        <a href="{{ route('dashboard') }}">
                            <i class="fa-solid fa-house mr-2"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                </ul>
                @if(in_array(auth()->user()->role, ['Admin']))
                <h3 id="group-label-content-1">Master Data</h3>
                <ul>
                    <li><a href="{{ route('barang.index') }}"><i class="fa-solid fa-chart-line mr-2"></i><span>Barang</span></a></li>
                    <li><a href="{{ url('/kategori') }}"><i class="fa-solid fa-chart-area mr-2"></i><span>Kategori Barang</span></a></li>
                    <li><a href="{{ url('/satuan') }}"><i class="fa-regular fa-bell mr-2"></i><span>Satuan Barang</span></a></li>
                    <li><a href="{{ url('/supplier') }}"><i class="fa-solid fa-bolt mr-2"></i><span>Supplier</span></a></li>
                    <li><a href="{{ route('gudang.index') }}"><i class="fa-solid fa-warehouse mr-2"></i><span>Gudang</span></a></li>
                </ul>
                @endif
                <h3 id="group-label-content-2">Transaksi</h3>
                <ul>
                    @if(in_array(auth()->user()->role, ['Admin', 'Staf Gudang Logistik']))
                    <li><a href="{{ url('/barang-masuk') }}"><i class="fa-solid fa-arrows-down-to-line mr-2"></i><span>Barang Masuk</span></a></li>
                    @endif
                    @if(in_array(auth()->user()->role, ['Admin', 'Gudang Logistik']))
                    <li><a href="{{ url('/barang-keluar') }}"><i class="fa-solid fa-arrows-up-to-line mr-2"></i><span>Barang Keluar</span></a></li>
                    @endif
                    @if(in_array(auth()->user()->role, ['Admin', 'Staf Gudang Logistik', 'Kabag Logistik']))
                    <li><a href="{{ url('/permintaan-barang') }}"><i class="fa-solid fa-hand-holding mr-2"></i><span>Permintaan Barang</span></a></li>
                    @endif
                    @if(in_array(auth()->user()->role, ['Admin', 'Gudang Logistik', 'Kabag Logistik']))
                    <li><a href="{{ url('/pemeliharaan-barang') }}"><i class="fa-solid fa-hand-holding-medical mr-2"></i><span>Pemeliharaan Barang</span></a></li>
                    @endif
                </ul>
                @if(in_array(auth()->user()->role, ['Admin', 'Kabag Logistik', 'Staf Gudang Logistik']))
                <h3 id="group-label-content-3">Laporan</h3>
                <ul>
                    <li><a href="{{ route('laporan.index') }}"><i class="fa-solid fa-file-export mr-2"></i><span>Download Laporan</span></a></li>
                </ul>
                <h3 id="group-label-content-4">Pengaturan</h3>
                <ul>
                    <li><a href="{{ url('/user') }}"><i class="fa-solid fa-user mr-2"></i><span>Pengguna</span></a></li>
                </ul>
                @endif
            </div>
        </section>
    </nav>
</aside>