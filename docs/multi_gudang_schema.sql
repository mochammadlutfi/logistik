-- =====================================================
-- PERUBAHAN DATABASE UNTUK MULTI-GUDANG
-- Database: db_logistik
-- Date: 05/02/2026
-- =====================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================
-- 1. TABEL BARU: gudang (Master Data Gudang)
-- =====================================================
DROP TABLE IF EXISTS `gudang`;
CREATE TABLE `gudang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_gudang` varchar(20) NOT NULL,
  `nama_gudang` varchar(100) NOT NULL,
  `alamat` text,
  `no_telepon` varchar(20) DEFAULT NULL,
  `penanggung_jawab` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_gudang` (`kode_gudang`),
  KEY `idx_kode_gudang` (`kode_gudang`),
  KEY `idx_nama_gudang` (`nama_gudang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 2. TABEL BARU: stok_gudang (Stok Per Gudang)
-- =====================================================
DROP TABLE IF EXISTS `stok_gudang`;
CREATE TABLE `stok_gudang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gudang_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `stok_tersedia` int DEFAULT '0',
  `stok_minimum` int DEFAULT '0',
  `stok_maksimum` int DEFAULT '0',
  `lokasi_rak` varchar(50) DEFAULT NULL COMMENT 'Lokasi rak/bin di dalam gudang',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gudang_barang` (`gudang_id`, `barang_id`),
  KEY `idx_gudang_id` (`gudang_id`),
  KEY `idx_barang_id` (`barang_id`),
  CONSTRAINT `stok_gudang_ibfk_1` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stok_gudang_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 3. TABEL BARU: transfer_barang (Transfer Antar Gudang)
-- =====================================================
DROP TABLE IF EXISTS `transfer_barang`;
CREATE TABLE `transfer_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `gudang_asal_id` bigint unsigned NOT NULL,
  `gudang_tujuan_id` bigint unsigned NOT NULL,
  `status` enum('draft','dalam_pengiriman','diterima','dibatalkan') DEFAULT 'draft',
  `user_id` bigint unsigned NOT NULL COMMENT 'User yang membuat transfer',
  `diterima_oleh` bigint unsigned DEFAULT NULL COMMENT 'User yang menerima di gudang tujuan',
  `tanggal_diterima` timestamp NULL DEFAULT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_transfer` (`kode`),
  KEY `idx_kode` (`kode`),
  KEY `idx_tanggal` (`tanggal`),
  KEY `idx_status` (`status`),
  KEY `idx_gudang_asal` (`gudang_asal_id`),
  KEY `idx_gudang_tujuan` (`gudang_tujuan_id`),
  KEY `transfer_barang_ibfk_1` (`user_id`),
  KEY `transfer_barang_ibfk_4` (`diterima_oleh`),
  CONSTRAINT `transfer_barang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `transfer_barang_ibfk_2` FOREIGN KEY (`gudang_asal_id`) REFERENCES `gudang` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `transfer_barang_ibfk_3` FOREIGN KEY (`gudang_tujuan_id`) REFERENCES `gudang` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `transfer_barang_ibfk_4` FOREIGN KEY (`diterima_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 4. TABEL BARU: transfer_barang_detail
-- =====================================================
DROP TABLE IF EXISTS `transfer_barang_detail`;
CREATE TABLE `transfer_barang_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `jml_kirim` int NOT NULL COMMENT 'Jumlah yang dikirim',
  `jml_diterima` int DEFAULT NULL COMMENT 'Jumlah yang diterima',
  `kondisi` enum('baik','rusak','diperbaiki') DEFAULT 'baik',
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_transfer_id` (`transfer_id`),
  KEY `idx_barang_id` (`barang_id`),
  CONSTRAINT `transfer_barang_detail_ibfk_1` FOREIGN KEY (`transfer_id`) REFERENCES `transfer_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfer_barang_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 5. ALTER TABLE: users (Tambah kolom gudang_id)
-- =====================================================
ALTER TABLE `users`
ADD COLUMN `gudang_id` bigint unsigned DEFAULT NULL AFTER `role`,
ADD KEY `idx_users_gudang` (`gudang_id`),
ADD CONSTRAINT `users_ibfk_gudang` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE SET NULL;

-- =====================================================
-- 6. ALTER TABLE: pencatatan_barang (Tambah kolom gudang_id)
-- =====================================================
ALTER TABLE `pencatatan_barang`
ADD COLUMN `gudang_id` bigint unsigned DEFAULT NULL AFTER `kode`,
ADD KEY `idx_pencatatan_gudang` (`gudang_id`),
ADD CONSTRAINT `pencatatan_barang_ibfk_gudang` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE RESTRICT;

-- =====================================================
-- 7. ALTER TABLE: permintaan_barang (Tambah kolom gudang)
-- =====================================================
ALTER TABLE `permintaan_barang`
ADD COLUMN `gudang_pemohon_id` bigint unsigned DEFAULT NULL AFTER `user_id` COMMENT 'Gudang yang mengajukan permintaan',
ADD COLUMN `gudang_tujuan_id` bigint unsigned DEFAULT NULL AFTER `gudang_pemohon_id` COMMENT 'Gudang tujuan pengambilan barang',
ADD KEY `idx_permintaan_gudang_pemohon` (`gudang_pemohon_id`),
ADD KEY `idx_permintaan_gudang_tujuan` (`gudang_tujuan_id`),
ADD CONSTRAINT `permintaan_barang_ibfk_gudang_pemohon` FOREIGN KEY (`gudang_pemohon_id`) REFERENCES `gudang` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `permintaan_barang_ibfk_gudang_tujuan` FOREIGN KEY (`gudang_tujuan_id`) REFERENCES `gudang` (`id`) ON DELETE SET NULL;

-- =====================================================
-- 8. ALTER TABLE: pemeliharaan_barang (Tambah kolom gudang_id)
-- =====================================================
ALTER TABLE `pemeliharaan_barang`
ADD COLUMN `gudang_id` bigint unsigned DEFAULT NULL AFTER `kode`,
ADD KEY `idx_pemeliharaan_gudang` (`gudang_id`),
ADD CONSTRAINT `pemeliharaan_barang_ibfk_gudang` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE SET NULL;

-- =====================================================
-- 9. ALTER TABLE: barang (Update kolom stok)
-- =====================================================
ALTER TABLE `barang`
CHANGE COLUMN `stok_tersedia` `stok_total` int DEFAULT '0' COMMENT 'Total stok di semua gudang';

-- =====================================================
-- 10. DATA AWAL: Insert gudang default
-- =====================================================
INSERT INTO `gudang` (`kode_gudang`, `nama_gudang`, `alamat`, `is_active`)
VALUES ('GDG-001', 'Gudang Utama', 'Alamat Gudang Utama', 1);

-- =====================================================
-- 11. MIGRASI DATA: Pindahkan stok existing ke stok_gudang
-- =====================================================
INSERT INTO `stok_gudang` (`gudang_id`, `barang_id`, `stok_tersedia`, `stok_minimum`, `stok_maksimum`, `lokasi_rak`)
SELECT
    (SELECT id FROM gudang WHERE kode_gudang = 'GDG-001'),
    b.id,
    b.stok_total,
    b.stok_minimum,
    b.stok_maksimum,
    b.lokasi_penyimpanan
FROM barang b
WHERE b.deleted_at IS NULL;

-- =====================================================
-- 12. MIGRASI DATA: Update tabel existing dengan gudang default
-- =====================================================
UPDATE `pencatatan_barang`
SET `gudang_id` = (SELECT id FROM gudang WHERE kode_gudang = 'GDG-001')
WHERE `gudang_id` IS NULL;

UPDATE `pemeliharaan_barang`
SET `gudang_id` = (SELECT id FROM gudang WHERE kode_gudang = 'GDG-001')
WHERE `gudang_id` IS NULL;

SET FOREIGN_KEY_CHECKS = 1;
