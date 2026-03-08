-- ====================================================
-- LAPORAN KERUSAKAN BARANG TABLES
-- ====================================================

-- ----------------------------
-- Table structure for laporan_kerusakan
-- ----------------------------
DROP TABLE IF EXISTS `laporan_kerusakan`;
CREATE TABLE `laporan_kerusakan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemeliharaan_id` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `petugas_id` bigint unsigned NOT NULL,
  `status` enum('pending','diproses','selesai') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_laporan_kerusakan` (`kode`),
  KEY `idx_kode` (`kode`),
  KEY `idx_tanggal` (`tanggal`),
  KEY `idx_status` (`status`),
  KEY `laporan_kerusakan_pemeliharaan_id_foreign` (`pemeliharaan_id`),
  KEY `laporan_kerusakan_petugas_id_foreign` (`petugas_id`),
  CONSTRAINT `laporan_kerusakan_pemeliharaan_id_foreign` FOREIGN KEY (`pemeliharaan_id`) REFERENCES `pemeliharaan_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `laporan_kerusakan_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for laporan_kerusakan_detail
-- ----------------------------
DROP TABLE IF EXISTS `laporan_kerusakan_detail`;
CREATE TABLE `laporan_kerusakan_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `laporan_kerusakan_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `rusak_ringan` int NOT NULL DEFAULT '0',
  `tindakan_rusak_ringan` enum('diganti','masih_bisa_dipakai','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rusak_berat` int NOT NULL DEFAULT '0',
  `tindakan_rusak_berat` enum('diprovinsiin','dimusnahkan','diganti_baru','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `laporan_kerusakan_detail_laporan_id_foreign` (`laporan_kerusakan_id`),
  KEY `laporan_kerusakan_detail_barang_id_foreign` (`barang_id`),
  CONSTRAINT `laporan_kerusakan_detail_laporan_id_foreign` FOREIGN KEY (`laporan_kerusakan_id`) REFERENCES `laporan_kerusakan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `laporan_kerusakan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
