# KODE MERMAID SEQUENCE DIAGRAM
## Sistem Informasi Monitoring Logistik dan Alat Produksi PT Timah Tbk

---

## 1. Sequence Diagram - Login

### Prolog

**Gambar 4.7 Sequence Diagram Login**

Gambar 4.7 menunjukkan sequence diagram untuk proses login pada Sistem Informasi Monitoring Logistik dan Alat Produksi di PT Timah Tbk. Diagram ini menggambarkan interaksi antara pengguna dengan komponen sistem mulai dari membuka halaman login, memasukkan kredensial (email dan password), proses validasi oleh AuthController, pengecekan data pengguna di database, hingga pembuatan session dan pengalihan ke halaman dashboard sesuai dengan role pengguna. Diagram ini juga menampilkan skenario alternatif ketika kredensial yang dimasukkan tidak valid, sistem akan menampilkan pesan error dan mengarahkan pengguna kembali ke form login. Proses ini melibatkan empat komponen utama yaitu Pengguna sebagai aktor, Halaman Login sebagai interface, AuthController sebagai pengendali proses autentikasi, User Model sebagai pengelola logika pengguna, dan Database sebagai penyimpan data.

```mermaid
sequenceDiagram
    actor Pengguna
    participant Halaman Login
    participant AuthController
    participant User Model
    participant Database

    Pengguna->>Halaman Login: Membuka halaman
    Halaman Login->>Pengguna: Menampilkan form login
    Pengguna->>Halaman Login: Mengisi email dan password
    Pengguna->>Halaman Login: Klik tombol Login
    Halaman Login->>AuthController: POST login (email, password)
    AuthController->>User Model: Validasi kredensial
    User Model->>Database: SELECT * FROM users WHERE email = ?
    Database-->>User Model: Return data user
    
    alt Kredensial valid
        User Model-->>AuthController: User data valid
        AuthController->>AuthController: Buat session
        AuthController-->>Halaman Login: Redirect ke dashboard
        Halaman Login-->>Pengguna: Tampilkan dashboard
    else Kredensial tidak valid
        User Model-->>AuthController: Invalid credentials
        AuthController-->>Halaman Login: Error message
        Halaman Login-->>Pengguna: Tampilkan pesan error
    end
```

---

## 2. Sequence Diagram - Kelola Barang Masuk

### Prolog

**Gambar 4.8 Sequence Diagram Kelola Barang Masuk**

Gambar 4.8 menampilkan sequence diagram untuk proses pengelolaan barang masuk pada sistem. Diagram ini mengilustrasikan alur kerja lengkap mulai dari Staf Gudang Logistik membuka menu barang masuk, sistem menampilkan daftar barang masuk yang telah tercatat, penambahan data barang masuk baru melalui form input yang mencakup informasi tanggal, supplier, produk, jumlah, dan catatan, hingga penyimpanan data ke database. Proses penting yang digambarkan adalah transaksi database yang melibatkan penyimpanan data barang masuk dan pembaruan stok secara otomatis dalam satu transaksi (BEGIN TRANSACTION dan COMMIT) untuk menjaga konsistensi data. Diagram ini juga menunjukkan validasi input data dan penanganan error jika data yang dimasukkan tidak valid. Komponen yang terlibat meliputi Staf Gudang Logistik sebagai aktor, Halaman Barang Masuk, BarangMasukController, Barang Model, Stok Model, dan Database.

```mermaid
sequenceDiagram
    actor Staf Gudang Logistik
    participant Halaman Barang Masuk
    participant BarangMasukController
    participant Barang Model
    participant Stok Model
    participant Database

    Staf Gudang Logistik->>Halaman Barang Masuk: Pilih menu Barang Masuk
    Halaman Barang Masuk->>BarangMasukController: GET /barang-masuk
    BarangMasukController->>Barang Model: getBarangMasuk()
    Barang Model->>Database: SELECT * FROM barang_masuk
    Database-->>Barang Model: Return data barang masuk
    Barang Model-->>BarangMasukController: Data barang masuk
    BarangMasukController-->>Halaman Barang Masuk: Render daftar barang masuk
    Halaman Barang Masuk-->>Staf Gudang Logistik: Tampilkan daftar
    
    Staf Gudang Logistik->>Halaman Barang Masuk: Klik Tambah Barang Masuk
    Halaman Barang Masuk-->>Staf Gudang Logistik: Tampilkan form input
    
    Staf Gudang Logistik->>Halaman Barang Masuk: Isi form (tanggal, supplier, produk, jumlah, catatan)
    Staf Gudang Logistik->>Halaman Barang Masuk: Klik Simpan
    
    Halaman Barang Masuk->>BarangMasukController: POST /barang-masuk/store
    BarangMasukController->>BarangMasukController: Validasi input
    
    alt Data valid
        BarangMasukController->>Database: BEGIN TRANSACTION
        BarangMasukController->>Barang Model: insertBarangMasuk(data)
        Barang Model->>Database: INSERT INTO barang_masuk
        Database-->>Barang Model: Success
        
        BarangMasukController->>Stok Model: updateStok(produk_id, jumlah)
        Stok Model->>Database: UPDATE stok SET jumlah = jumlah + ?
        Database-->>Stok Model: Success
        
        BarangMasukController->>Database: COMMIT
        BarangMasukController-->>Halaman Barang Masuk: Success response
        Halaman Barang Masuk-->>Staf Gudang Logistik: Tampilkan notifikasi berhasil
    else Data tidak valid
        BarangMasukController-->>Halaman Barang Masuk: Error validation
        Halaman Barang Masuk-->>Staf Gudang Logistik: Tampilkan pesan error
    end
```

---

## 3. Sequence Diagram - Kelola Barang Keluar

### Prolog

**Gambar 4.9 Sequence Diagram Kelola Barang Keluar**

Gambar 4.9 memperlihatkan sequence diagram untuk proses pengeluaran barang dari gudang logistik. Diagram ini menggambarkan alur proses yang dimulai dari Gudang Logistik membuka menu barang keluar dan melihat daftar permintaan yang telah disetujui, memilih permintaan barang yang akan dipenuhi, sistem menampilkan detail permintaan tersebut, pengisian data pengeluaran barang, hingga proses penyimpanan transaksi. Aspek penting yang ditampilkan adalah pengecekan ketersediaan stok barang sebelum proses pengeluaran dilakukan. Jika stok mencukupi, sistem akan melakukan serangkaian proses dalam satu transaksi database meliputi pencatatan barang keluar, pengurangan stok secara otomatis, pembaruan status permintaan menjadi "Terpenuhi", dan pembuatan Surat Pengeluaran Barang (SPB) sebagai bukti formal. Diagram juga menunjukkan skenario alternatif ketika stok tidak mencukupi, sistem akan menampilkan pesan error. Komponen yang terlibat adalah Gudang Logistik, Halaman Barang Keluar, BarangKeluarController, Permintaan Model, Stok Model, SPB Model, dan Database.

```mermaid
sequenceDiagram
    actor Gudang Logistik
    participant Halaman Barang Keluar
    participant BarangKeluarController
    participant Permintaan Model
    participant Stok Model
    participant SPB Model
    participant Database

    Gudang Logistik->>Halaman Barang Keluar: Pilih menu Barang Keluar
    Halaman Barang Keluar->>BarangKeluarController: GET /barang-keluar
    BarangKeluarController->>Permintaan Model: getPermintaanDisetujui()
    Permintaan Model->>Database: SELECT * FROM permintaan WHERE status = 'Disetujui'
    Database-->>Permintaan Model: Return data permintaan
    Permintaan Model-->>BarangKeluarController: Data permintaan
    BarangKeluarController-->>Halaman Barang Keluar: Render daftar permintaan
    Halaman Barang Keluar-->>Gudang Logistik: Tampilkan daftar permintaan
    
    Gudang Logistik->>Halaman Barang Keluar: Klik Tambah Barang Keluar
    Halaman Barang Keluar-->>Gudang Logistik: Tampilkan form input
    
    Gudang Logistik->>Halaman Barang Keluar: Pilih permintaan barang
    Halaman Barang Keluar->>BarangKeluarController: GET /permintaan/detail/{id}
    BarangKeluarController->>Permintaan Model: getDetailPermintaan(id)
    Permintaan Model->>Database: SELECT * FROM permintaan WHERE id = ?
    Database-->>Permintaan Model: Detail permintaan
    Permintaan Model-->>BarangKeluarController: Detail data
    BarangKeluarController-->>Halaman Barang Keluar: Return detail
    Halaman Barang Keluar-->>Gudang Logistik: Tampilkan detail permintaan
    
    Gudang Logistik->>Halaman Barang Keluar: Isi data barang keluar (tanggal, jumlah, catatan)
    Gudang Logistik->>Halaman Barang Keluar: Klik Simpan
    
    Halaman Barang Keluar->>BarangKeluarController: POST /barang-keluar/store
    BarangKeluarController->>BarangKeluarController: Validasi input
    BarangKeluarController->>Stok Model: checkStok(produk_id)
    Stok Model->>Database: SELECT jumlah FROM stok WHERE produk_id = ?
    Database-->>Stok Model: Jumlah stok
    Stok Model-->>BarangKeluarController: Return stok
    
    alt Stok mencukupi
        BarangKeluarController->>Database: BEGIN TRANSACTION
        
        BarangKeluarController->>BarangKeluarController: insertBarangKeluar(data)
        BarangKeluarController->>Database: INSERT INTO barang_keluar
        Database-->>BarangKeluarController: Success
        
        BarangKeluarController->>Stok Model: kurangiStok(produk_id, jumlah)
        Stok Model->>Database: UPDATE stok SET jumlah = jumlah - ?
        Database-->>Stok Model: Success
        
        BarangKeluarController->>Permintaan Model: updateStatus(id, 'Terpenuhi')
        Permintaan Model->>Database: UPDATE permintaan SET status = 'Terpenuhi'
        Database-->>Permintaan Model: Success
        
        BarangKeluarController->>SPB Model: generateSPB(data)
        SPB Model->>Database: INSERT INTO spb
        Database-->>SPB Model: SPB created
        
        BarangKeluarController->>Database: COMMIT
        BarangKeluarController-->>Halaman Barang Keluar: Success response with SPB
        Halaman Barang Keluar-->>Gudang Logistik: Tampilkan notifikasi berhasil & SPB
    else Stok tidak mencukupi
        BarangKeluarController-->>Halaman Barang Keluar: Error stok tidak cukup
        Halaman Barang Keluar-->>Gudang Logistik: Tampilkan pesan stok tidak cukup
    end
```

---

## 4. Sequence Diagram - Permintaan Barang

### Prolog

**Gambar 4.10 Sequence Diagram Permintaan Barang**

Gambar 4.10 menampilkan sequence diagram untuk proses pengajuan permintaan barang oleh unit kerja. Diagram ini menjelaskan alur lengkap dimulai dari Staf Gudang membuka menu permintaan barang dan melihat riwayat permintaan yang pernah diajukan, membuat permintaan baru melalui form yang berisi informasi tanggal, unit pemohon, produk yang diminta, jumlah, dan keperluan penggunaan barang. Setelah validasi input, sistem melakukan pengecekan ketersediaan stok di gudang. Berdasarkan hasil pengecekan, sistem akan menentukan status permintaan: jika stok tersedia maka status diset "Menunggu Persetujuan", namun jika stok tidak tersedia maka status diset "Menunggu Stok". Proses selanjutnya adalah penyimpanan data permintaan ke database dan pengiriman notifikasi otomatis kepada Kabag Logistik untuk proses persetujuan. Diagram ini juga menangani validasi data dan menampilkan nomor permintaan kepada pemohon sebagai bukti pengajuan. Komponen yang terlibat meliputi Staf Gudang, Halaman Permintaan, PermintaanController, Permintaan Model, Stok Model, Notifikasi Service, dan Database.

```mermaid
sequenceDiagram
    actor Staf Gudang
    participant Halaman Permintaan
    participant PermintaanController
    participant Permintaan Model
    participant Stok Model
    participant Notifikasi Service
    participant Database

    Staf Gudang->>Halaman Permintaan: Pilih menu Permintaan Barang
    Halaman Permintaan->>PermintaanController: GET /permintaan
    PermintaanController->>Permintaan Model: getPermintaanByUser(user_id)
    Permintaan Model->>Database: SELECT * FROM permintaan WHERE user_id = ?
    Database-->>Permintaan Model: Return data permintaan
    Permintaan Model-->>PermintaanController: Data permintaan
    PermintaanController-->>Halaman Permintaan: Render daftar permintaan
    Halaman Permintaan-->>Staf Gudang: Tampilkan daftar permintaan
    
    Staf Gudang->>Halaman Permintaan: Klik Buat Permintaan
    Halaman Permintaan-->>Staf Gudang: Tampilkan form permintaan
    
    Staf Gudang->>Halaman Permintaan: Isi form (tanggal, unit, produk, jumlah, keperluan)
    Staf Gudang->>Halaman Permintaan: Klik Ajukan Permintaan
    
    Halaman Permintaan->>PermintaanController: POST /permintaan/store
    PermintaanController->>PermintaanController: Validasi input
    
    alt Data valid
        PermintaanController->>Stok Model: checkStok(produk_id)
        Stok Model->>Database: SELECT jumlah FROM stok WHERE produk_id = ?
        Database-->>Stok Model: Jumlah stok
        Stok Model-->>PermintaanController: Return stok tersedia
        
        alt Stok tersedia
            PermintaanController->>PermintaanController: Set status = "Menunggu Persetujuan"
        else Stok tidak tersedia
            PermintaanController->>PermintaanController: Set status = "Menunggu Stok"
        end
        
        PermintaanController->>Permintaan Model: insertPermintaan(data)
        Permintaan Model->>Database: INSERT INTO permintaan
        Database-->>Permintaan Model: Success, return ID
        Permintaan Model-->>PermintaanController: Permintaan ID
        
        PermintaanController->>Notifikasi Service: kirimNotifikasi(kabag_id, permintaan_id)
        Notifikasi Service->>Database: INSERT INTO notifikasi
        Database-->>Notifikasi Service: Success
        
        PermintaanController-->>Halaman Permintaan: Success response
        Halaman Permintaan-->>Staf Gudang: Tampilkan notifikasi berhasil & nomor permintaan
    else Data tidak valid
        PermintaanController-->>Halaman Permintaan: Error validation
        Halaman Permintaan-->>Staf Gudang: Tampilkan pesan error
    end
```

---

## 5. Sequence Diagram - Pemeliharaan Barang

### Prolog

**Gambar 4.11 Sequence Diagram Pemeliharaan Barang**

Gambar 4.11 mengilustrasikan sequence diagram untuk proses pemeliharaan dan perawatan barang atau alat produksi. Diagram ini menggambarkan alur kerja yang dimulai dari Bagian Pemeliharaan membuka menu pemeliharaan dan melihat riwayat pemeliharaan yang telah dilakukan, menambah catatan pemeliharaan baru dengan terlebih dahulu memilih barang dari daftar yang tersedia, sistem menampilkan detail barang yang dipilih, kemudian pengisian form pemeliharaan yang mencakup tanggal pemeriksaan, kondisi barang, jenis kerusakan, tindakan yang dilakukan, dan catatan tambahan. Setelah validasi, sistem melakukan transaksi database yang mencakup penyimpanan data pemeliharaan dan pembaruan status barang sesuai kondisinya. Diagram ini juga menampilkan logika kondisional dimana jika terjadi kerusakan berat atau rusak total, sistem akan secara otomatis mengirimkan notifikasi kepada Kabag Logistik dan dapat membuat permintaan barang pengganti secara otomatis jika diperlukan. Proses ini melibatkan komponen Bagian Pemeliharaan, Halaman Pemeliharaan, PemeliharaanController, Pemeliharaan Model, Barang Model, Permintaan Model, Notifikasi Service, dan Database.

```mermaid
sequenceDiagram
    actor Bagian Pemeliharaan
    participant Halaman Pemeliharaan
    participant PemeliharaanController
    participant Pemeliharaan Model
    participant Barang Model
    participant Permintaan Model
    participant Notifikasi Service
    participant Database

    Bagian Pemeliharaan->>Halaman Pemeliharaan: Pilih menu Pemeliharaan Barang
    Halaman Pemeliharaan->>PemeliharaanController: GET /pemeliharaan
    PemeliharaanController->>Pemeliharaan Model: getPemeliharaan()
    Pemeliharaan Model->>Database: SELECT * FROM pemeliharaan
    Database-->>Pemeliharaan Model: Return data pemeliharaan
    Pemeliharaan Model-->>PemeliharaanController: Data pemeliharaan
    PemeliharaanController-->>Halaman Pemeliharaan: Render daftar pemeliharaan
    Halaman Pemeliharaan-->>Bagian Pemeliharaan: Tampilkan daftar
    
    Bagian Pemeliharaan->>Halaman Pemeliharaan: Klik Tambah Pemeliharaan
    Halaman Pemeliharaan->>PemeliharaanController: GET /barang/list
    PemeliharaanController->>Barang Model: getBarang()
    Barang Model->>Database: SELECT * FROM barang
    Database-->>Barang Model: Return data barang
    Barang Model-->>PemeliharaanController: Data barang
    PemeliharaanController-->>Halaman Pemeliharaan: Return list barang
    Halaman Pemeliharaan-->>Bagian Pemeliharaan: Tampilkan form input
    
    Bagian Pemeliharaan->>Halaman Pemeliharaan: Pilih barang
    Halaman Pemeliharaan->>PemeliharaanController: GET /barang/detail/{id}
    PemeliharaanController->>Barang Model: getDetailBarang(id)
    Barang Model->>Database: SELECT * FROM barang WHERE id = ?
    Database-->>Barang Model: Detail barang
    Barang Model-->>PemeliharaanController: Return detail
    PemeliharaanController-->>Halaman Pemeliharaan: Detail barang
    Halaman Pemeliharaan-->>Bagian Pemeliharaan: Tampilkan detail barang
    
    Bagian Pemeliharaan->>Halaman Pemeliharaan: Isi data (tanggal, kondisi, jenis kerusakan, tindakan, catatan)
    Bagian Pemeliharaan->>Halaman Pemeliharaan: Klik Simpan
    
    Halaman Pemeliharaan->>PemeliharaanController: POST /pemeliharaan/store
    PemeliharaanController->>PemeliharaanController: Validasi input
    
    alt Data valid
        PemeliharaanController->>Database: BEGIN TRANSACTION
        
        PemeliharaanController->>Pemeliharaan Model: insertPemeliharaan(data)
        Pemeliharaan Model->>Database: INSERT INTO pemeliharaan
        Database-->>Pemeliharaan Model: Success
        
        PemeliharaanController->>Barang Model: updateStatusBarang(barang_id, status)
        Barang Model->>Database: UPDATE barang SET status = ?
        Database-->>Barang Model: Success
        
        alt Kerusakan berat atau rusak total
            PemeliharaanController->>Notifikasi Service: kirimNotifikasiKabag(kabag_id, data)
            Notifikasi Service->>Database: INSERT INTO notifikasi
            Database-->>Notifikasi Service: Success
            
            alt Memerlukan penggantian
                PemeliharaanController->>Permintaan Model: buatPermintaanBaru(barang_id)
                Permintaan Model->>Database: INSERT INTO permintaan
                Database-->>Permintaan Model: Success
            end
        end
        
        PemeliharaanController->>Database: COMMIT
        PemeliharaanController-->>Halaman Pemeliharaan: Success response
        Halaman Pemeliharaan-->>Bagian Pemeliharaan: Tampilkan notifikasi berhasil
    else Data tidak valid
        PemeliharaanController-->>Halaman Pemeliharaan: Error validation
        Halaman Pemeliharaan-->>Bagian Pemeliharaan: Tampilkan pesan error
    end
```

---

## 6. Sequence Diagram - Laporan Logistik

### Prolog

**Gambar 4.12 Sequence Diagram Laporan Logistik**

Gambar 4.12 menunjukkan sequence diagram untuk proses pembuatan dan ekspor laporan logistik. Diagram ini menggambarkan alur proses yang dimulai dari Kabag Logistik membuka menu laporan dan memilih jenis laporan yang diinginkan (barang masuk, barang keluar, stok, atau pemeliharaan), mengisi kriteria filter seperti periode tanggal, kategori barang, dan supplier, kemudian sistem melakukan validasi filter dan mengambil data dari database sesuai jenis laporan yang dipilih. Diagram menampilkan empat percabangan alternatif untuk masing-masing jenis laporan yang memiliki query database berbeda. Setelah data diambil, sistem memproses dan memformat data kemudian menampilkannya dalam bentuk tabel di halaman laporan. Fitur penting yang digambarkan adalah kemampuan ekspor laporan ke dalam format PDF atau Excel melalui Export Service yang akan memformat data sesuai format file yang dipilih, kemudian file hasil ekspor dapat diunduh oleh pengguna. Proses ini melibatkan komponen Kabag Logistik, Halaman Laporan, LaporanController, Barang Model, Stok Model, Export Service, dan Database.

```mermaid
sequenceDiagram
    actor Kabag Logistik
    participant Halaman Laporan
    participant LaporanController
    participant Barang Model
    participant Stok Model
    participant Export Service
    participant Database

    Kabag Logistik->>Halaman Laporan: Pilih menu Laporan
    Halaman Laporan-->>Kabag Logistik: Tampilkan pilihan jenis laporan
    
    Kabag Logistik->>Halaman Laporan: Pilih jenis laporan
    Halaman Laporan-->>Kabag Logistik: Tampilkan form filter
    
    Kabag Logistik->>Halaman Laporan: Isi filter (periode, kategori, supplier)
    Kabag Logistik->>Halaman Laporan: Klik Generate Laporan
    
    Halaman Laporan->>LaporanController: POST /laporan/generate
    LaporanController->>LaporanController: Validasi input filter
    
    alt Laporan Barang Masuk
        LaporanController->>Barang Model: getBarangMasuk(filter)
        Barang Model->>Database: SELECT * FROM barang_masuk WHERE ...
        Database-->>Barang Model: Return data
        Barang Model-->>LaporanController: Data barang masuk
    else Laporan Barang Keluar
        LaporanController->>Barang Model: getBarangKeluar(filter)
        Barang Model->>Database: SELECT * FROM barang_keluar WHERE ...
        Database-->>Barang Model: Return data
        Barang Model-->>LaporanController: Data barang keluar
    else Laporan Stok
        LaporanController->>Stok Model: getStok(filter)
        Stok Model->>Database: SELECT * FROM stok WHERE ...
        Database-->>Stok Model: Return data
        Stok Model-->>LaporanController: Data stok
    else Laporan Pemeliharaan
        LaporanController->>Barang Model: getPemeliharaan(filter)
        Barang Model->>Database: SELECT * FROM pemeliharaan WHERE ...
        Database-->>Barang Model: Return data
        Barang Model-->>LaporanController: Data pemeliharaan
    end
    
    LaporanController->>LaporanController: Proses dan format data
    LaporanController-->>Halaman Laporan: Return data laporan
    Halaman Laporan-->>Kabag Logistik: Tampilkan laporan dalam tabel
    
    Kabag Logistik->>Halaman Laporan: Klik Export PDF/Excel
    Halaman Laporan->>LaporanController: POST /laporan/export
    
    alt Export PDF
        LaporanController->>Export Service: generatePDF(data)
        Export Service->>Export Service: Format data ke PDF
        Export Service-->>LaporanController: Return PDF file
    else Export Excel
        LaporanController->>Export Service: generateExcel(data)
        Export Service->>Export Service: Format data ke Excel
        Export Service-->>LaporanController: Return Excel file
    end
    
    LaporanController-->>Halaman Laporan: Return file untuk download
    Halaman Laporan-->>Kabag Logistik: Download file laporan
```

---