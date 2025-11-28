-- Tabel Kategori Barang
CREATE TABLE kategori_barang (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_kategori VARCHAR(20) NOT NULL UNIQUE,
    nama_kategori VARCHAR(100) NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
) ENGINE=InnoDB;

-- Tabel Satuan
CREATE TABLE satuan (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_satuan VARCHAR(50) NOT NULL UNIQUE,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabel Supplier/Mitra
CREATE TABLE suppliers (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_supplier VARCHAR(20) NOT NULL UNIQUE,
    nama_supplier VARCHAR(150) NOT NULL,
    alamat TEXT,
    no_telepon VARCHAR(20),
    email VARCHAR(100),
    kontak_person VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
) ENGINE=InnoDB;

-- Tabel Master Barang
CREATE TABLE barang (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_barang VARCHAR(50) NOT NULL UNIQUE,
    nama_barang VARCHAR(200) NOT NULL,
    kategori_id BIGINT UNSIGNED NOT NULL,
    satuan_id BIGINT UNSIGNED NOT NULL,
    stok_minimum INT DEFAULT 0,
    stok_maksimum INT DEFAULT 0,
    stok_tersedia INT DEFAULT 0,
    harga_satuan DECIMAL(15,2) DEFAULT 0,
    lokasi_penyimpanan VARCHAR(100),
    kondisi_fisik ENUM('baik', 'rusak', 'habis', 'diperbaiki') DEFAULT 'baik',
    foto_barang VARCHAR(255),
    keterangan TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    FOREIGN KEY (kategori_id) REFERENCES kategori_barang(id) ON DELETE RESTRICT,
    FOREIGN KEY (satuan_id) REFERENCES satuan(id) ON DELETE RESTRICT,
    INDEX idx_kode (kode_barang),
    INDEX idx_nama (nama_barang),
    INDEX idx_kategori (kategori_id)
) ENGINE=InnoDB;

-- ============================================
-- TABEL TRANSAKSI
-- ============================================

-- Tabel Pencatatan Barang (Barang Masuk/Keluar)
CREATE TABLE pencatatan_barang (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_transaksi VARCHAR(50) NOT NULL UNIQUE,
    barang_id BIGINT UNSIGNED NOT NULL,
    jenis_transaksi ENUM('masuk', 'keluar') NOT NULL,
    jumlah INT NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    supplier_id BIGINT UNSIGNED NULL,
    sumber_barang VARCHAR(200),
    tujuan_barang VARCHAR(200),
    no_dokumen VARCHAR(100),
    kondisi_barang ENUM('baik', 'rusak', 'diperbaiki') DEFAULT 'baik',
    user_id BIGINT UNSIGNED NOT NULL,
    catatan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barang(id) ON DELETE RESTRICT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
    INDEX idx_kode (kode_transaksi),
    INDEX idx_tanggal (tanggal_transaksi),
    INDEX idx_jenis (jenis_transaksi)
) ENGINE=InnoDB;

-- Tabel Permintaan Barang
CREATE TABLE permintaan_barang (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_permintaan VARCHAR(50) NOT NULL UNIQUE,
    user_id BIGINT UNSIGNED NOT NULL,
    tanggal_permintaan DATE NOT NULL,
    alasan_permintaan TEXT NOT NULL,
    status_permintaan ENUM('diajukan', 'menunggu_persetujuan', 'disetujui', 'ditolak', 'selesai') DEFAULT 'diajukan',
    approved_by BIGINT UNSIGNED NULL,
    tanggal_approval TIMESTAMP NULL,
    catatan_approval TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_kode (kode_permintaan),
    INDEX idx_status (status_permintaan),
    INDEX idx_tanggal (tanggal_permintaan)
) ENGINE=InnoDB;

-- Tabel Detail Permintaan Barang
CREATE TABLE detail_permintaan_barang (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    permintaan_id BIGINT UNSIGNED NOT NULL,
    barang_id BIGINT UNSIGNED NOT NULL,
    jumlah_diminta INT NOT NULL,
    jumlah_disetujui INT DEFAULT 0,
    catatan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (permintaan_id) REFERENCES permintaan_barang(id) ON DELETE CASCADE,
    FOREIGN KEY (barang_id) REFERENCES barang(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Tabel Laporan
CREATE TABLE laporan (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_laporan VARCHAR(50) NOT NULL UNIQUE,
    jenis_laporan ENUM('harian', 'mingguan', 'bulanan', 'tahunan', 'custom') NOT NULL,
    judul_laporan VARCHAR(200) NOT NULL,
    periode_awal DATE NOT NULL,
    periode_akhir DATE NOT NULL,
    isi_laporan LONGTEXT,
    file_laporan VARCHAR(255),
    status_laporan ENUM('draft', 'menunggu_verifikasi', 'diverifikasi', 'ditolak', 'final') DEFAULT 'draft',
    dibuat_oleh BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dibuat_oleh) REFERENCES users(id) ON DELETE RESTRICT,
    INDEX idx_kode (kode_laporan),
    INDEX idx_jenis (jenis_laporan),
    INDEX idx_status (status_laporan),
    INDEX idx_periode (periode_awal, periode_akhir)
) ENGINE=InnoDB;

-- Tabel Verifikasi Laporan
CREATE TABLE verifikasi_laporan (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    laporan_id BIGINT UNSIGNED NOT NULL,
    verifikator_id BIGINT UNSIGNED NOT NULL,
    status_verifikasi ENUM('valid', 'perlu_revisi') NOT NULL,
    catatan_verifikasi TEXT,
    tanggal_verifikasi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    FOREIGN KEY (verifikator_id) REFERENCES users(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Tabel Pemeliharaan
CREATE TABLE pemeliharaan (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode_pemeliharaan VARCHAR(50) NOT NULL UNIQUE,
    barang_id BIGINT UNSIGNED NULL,
    jenis_pemeliharaan ENUM('barang', 'sistem') NOT NULL,
    deskripsi_pemeliharaan TEXT NOT NULL,
    status_pemeliharaan ENUM('baik', 'rusak', 'habis', 'diperbaiki') DEFAULT 'baik',
    tanggal_pemeliharaan DATE NOT NULL,
    biaya_pemeliharaan DECIMAL(15,2) DEFAULT 0,
    petugas_id BIGINT UNSIGNED NOT NULL,
    catatan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barang(id) ON DELETE SET NULL,
    FOREIGN KEY (petugas_id) REFERENCES users(id) ON DELETE RESTRICT,
    INDEX idx_kode (kode_pemeliharaan),
    INDEX idx_jenis (jenis_pemeliharaan),
    INDEX idx_tanggal (tanggal_pemeliharaan)
) ENGINE=InnoDB;

-- ============================================
-- TABEL LOG & NOTIFIKASI
-- ============================================

-- Tabel Log Aktivitas
CREATE TABLE log_aktivitas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NULL,
    aktivitas VARCHAR(200) NOT NULL,
    deskripsi TEXT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user (user_id),
    INDEX idx_created (created_at)
) ENGINE=InnoDB;

