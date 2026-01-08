-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 01:38 PM
-- Server version: 8.4.2
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_logistik`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `satuan_id` bigint UNSIGNED NOT NULL,
  `stok_minimum` int DEFAULT '0',
  `stok_maksimum` int DEFAULT '0',
  `stok_tersedia` int DEFAULT '0',
  `harga_satuan` decimal(15,2) DEFAULT '0.00',
  `lokasi_penyimpanan` varchar(100) DEFAULT NULL,
  `kondisi_fisik` enum('baik','rusak','habis','diperbaiki') DEFAULT 'baik',
  `foto_barang` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `satuan_id`, `stok_minimum`, `stok_maksimum`, `stok_tersedia`, `harga_satuan`, `lokasi_penyimpanan`, `kondisi_fisik`, `foto_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1001, '10000003', 'SHIM PACK', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4K7464 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1002, '10000020', 'CUP,BEARING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6I8860 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1003, '10000048', 'CUP,BEARING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6V1194 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1004, '10000086', 'ADAPTER,STRAIGHT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6V0394 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1005, '10000091', 'CONE,BEARING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7K0394/6I8849 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1006, '10000094', 'CAP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8R7091 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1007, '10000120', 'PIN ASSY', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8Y7047 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1008, '10000128', 'CAP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9V6343 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1009, '10000180', 'PIN ASSY', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 113-3791 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1010, '10000192', 'SEAL,LIP', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6K4186 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1011, '10000200', 'BOLT', 8, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8T4172 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1012, '10000219', 'BOLT', 8, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8T4194 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1013, '10000236', 'WASHER,HARD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8T4223 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1014, '10000248', 'BOLT', 8, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8T5041 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1015, '10000259', 'SEAL,LIP', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9H2258 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1016, '10000615', 'BELT,V', 7, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B62', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1017, '10000714', 'SHIM PACK', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 113-3794 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1018, '10000719', 'WASHER,HARD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8T4121 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1019, '10000729', 'SEAL,U-CUP', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 338-2445 | Brand: CATERPILLAR | Model: 924K', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1020, '10000730', 'O-RING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 340-9313 | Brand: CATERPILLAR | Model: 924K', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1021, '10000732', 'SEAL,WIPER', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 478-4177 | Brand: CATERPILLAR | Model: 924K', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1022, '10000969', 'GASKET COMPOUND', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SILICONE | Brand: 75G/TUB | Model: RTV RED', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1023, '10001017', 'FILTER,AIR', 23, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22018287 | Brand: IR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1024, '10001021', 'DEMISTER,OIL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1621-8650-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1025, '10001027', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1613-9503-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1026, '10001052', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1630-0408-99 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1027, '10001054', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1621-7378-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1028, '10001055', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1623-8012-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1029, '10001056', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1629-0537-17 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1030, '10001058', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1613-8720-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1031, '10001059', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1622-7836-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1032, '10001062', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1622-7837-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1033, '10001076', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1625-7036-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1034, '10001083', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901-2004-02 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1035, '10001088', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 47653643002 | Brand: INGERSOLL', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1036, '10001094', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901-2072-03 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1037, '10001096', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1625-7525-01 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1038, '10001097', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1625-7253-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1039, '10001098', 'FILTER ELEMENT KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1629-0263-08', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1040, '10001102', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1635-0409-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1041, '10001104', 'CARTRIDGE,FILTER', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COMPRESSOR | Brand: 110759 | Model: KURZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1042, '10001122', 'CARTRIDGE,HYDRAULIC', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20Y-60-21470 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1043, '10001130', 'LUBRICANT OIL,SYN', 62, 4, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1630204120 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1044, '10001140', 'STRAINER,HYDRAULIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22B-60-11160 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1045, '10001149', 'CARTRIDGE,HYDRAULIC', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 207-60-71182 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1046, '10001221', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6732-81-3531 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1047, '10001224', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-319-3610 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1048, '10001241', 'FILTER,WATER', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4058965 | Brand: CUMMINS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1049, '10001247', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6736-51-5142 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1050, '10001248', 'O-RING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 07000-15200 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1051, '10001249', 'FILTER ASSY,HYDRAULIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 419-60-35142', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1052, '10001250', 'FILTER ASSY,HYDRAULIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 418-18-34110', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1053, '10001251', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-311-9121 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1054, '10001252', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22U-04-21260 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1055, '10001253', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6734-81-6410 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1056, '10001254', 'CARTRIDGE,FUEL FILTER', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6732-71-6112', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1057, '10001255', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-185-2500 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1058, '10001256', 'STRAINER,HYDRAULIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 34B-66-15180 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1059, '10001257', 'FILTER ASSY,HYDRAULIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-66-43630', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1060, '10001259', 'FILTER,TORQUE', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-15-41510 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1061, '10001272', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: YM129052-5630 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1062, '10001273', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: YM129150-35160 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1063, '10001275', 'GLOW PLUG', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: YM119717-77800 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1064, '10002148', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NJ308C3DI | Brand: 40MM | Model: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1065, '10002262', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8-94396-3754 | Brand: ISUZU | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1066, '10002263', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8-98071-421 | Brand: ISUZU | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1067, '10002264', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 23414-LAA10 | Brand: HINO | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1068, '10002265', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 15607-2060L | Brand: HINO | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1069, '10002266', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 15607-2190L | Brand: HINO | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1070, '10002267', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 17801-JAA10 | Brand: HINO | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1071, '10002268', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 17801-3391L | Brand: HINO | Model: TRUCK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1072, '10002269', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ME131989 | Brand: MITSUBISHI | Model: FUSO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1073, '10002270', 'SEPARATOR,WATER', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ME971553 | Brand: MITSUBISHI | Model: FUSO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1074, '10002271', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ME995735 | Brand: MITSUBISHI | Model: FUSO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1075, '10002272', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ME073252 | Brand: MITSUBISHI | Model: FUSO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1076, '10002273', 'BODY ASSY,PUMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A6211010 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1077, '10002274', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91E6100112 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1078, '10002276', 'FILTER ELEMENT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FUEL/WTR | Brand: 30UM | Model: 16.8MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1079, '10002278', 'FILTER ELEMENT,AIR,SECONDARY', 24, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 222-9021', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1080, '10002279', 'FILTER ELEMENT,AIR,PRIMARY', 24, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 222-9020 | Brand: 924H', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1081, '10002280', 'SEPARATOR,WATER,FUEL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 326-1644 | Brand: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1082, '10002281', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 299-8229 | Brand: CATERPILLAR | Model: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1083, '10002282', 'FILTER,AIR,SECONDARY', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 256-7903 | Brand: 924HZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1084, '10002283', 'FILTER ELEMENT,AIR,PRIMARY', 24, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 256-7902', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1085, '10002284', 'FILTER ELEMENT,AIR,SECONDARY', 24, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 152-7219', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1086, '10002285', 'FILTER ELEMENT,AIR,PRIMARY', 24, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 152-7217', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1087, '10002286', 'SEPARATOR,WATER,FUEL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 131-1812 | Brand: 924GZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1088, '10002287', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 145-4501 | Brand: CATERPILLAR | Model: 924GZ', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1089, '10002288', 'BEARING,ROLLER,MAIN', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9441103800 | Brand: CAT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1090, '10002289', 'STRAINER,SUCTION', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9197500501 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1091, '10002290', 'FILTER,HYD,RETURN', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9187505900 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1092, '10002292', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3754902480 | Brand: MITSUBISHI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1093, '10002293', 'FILTER ASSY,RETURN', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9137503800 | Brand: FORKLIFT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1094, '10002294', 'PLUG,GLOW', 43, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A6603102 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1095, '10002347', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91K6101112 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1096, '10002348', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A6201020C | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1097, '10002349', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32B4020100 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1098, '10002350', 'PIN,TIE ROD', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9304404300 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1099, '10002351', 'TIE ROD,RH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91K4300900 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1100, '10002352', 'TIE ROD,LH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91K4300800 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1101, '10002353', 'BEARING,SPHERICAL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9144409600 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1102, '10002355', 'BEARING,SPERICHAL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9144409600 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1103, '10002358', 'CYLINDER,BRAKE', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91E4600112 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1104, '10002359', 'BRAKE SHOE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91E4600114 | Brand: CATERPILLAR | Model: DP30', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1105, '10002362', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A6201020C | Brand: CATERPILLAR | Model: DP30', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1106, '10002451', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A4000400 | Brand: CATERPILLAR | Model: DP30', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1107, '10002452', 'STARTER,MOTOR', 53, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 32A6610101S | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1108, '10002807', 'COOLANT,ENGINE', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 217-0616 | Brand: CATERPILLAR | Model: 3516', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1109, '10003201', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 21311E | Brand: 55MM | Model: 120MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1110, '10003792', 'POMPA CELUP / SUBMERSIBLE PUMP', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'POMPA CELUP / SUBMERSIBLE PUMP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1111, '10004030', 'SERVICE KIT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3002-6052-10 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1112, '10004031', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3001-5270-09 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1113, '10004032', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3001-5270-07 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1114, '10004033', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3001-5270-10 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1115, '10004034', 'SEPARATOR KIT,OIL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901990815 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1116, '10004035', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901-9908-17 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1117, '10004036', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901-3004-04 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1118, '10004037', 'SERVICE KIT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3001-5009-03 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1119, '10004038', 'FILTER KIT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2901-3000-03 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1120, '10004040', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22018287 | Brand: INGERSOLL', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1121, '10004042', 'PARTS KIT,VISIT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3001-5005-85 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1122, '10004043', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1621-7378-90 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1123, '10004044', 'VALVE,SOLENOID', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1635-6305-00 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1124, '10004083', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 39708466 | Brand: IR | Model: MM75/MH75', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1125, '10004084', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 39911631 | Brand: IR | Model: MM75/MH75', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1126, '10004085', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 39894597 | Brand: IR | Model: MM75/MH75', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1127, '10004086', 'SEPARATOR,OIL', 49, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 39894597 | Brand: IR | Model: MM37', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1128, '10004087', 'FILTER,AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22003095 | Brand: IR | Model: MM37', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1129, '10004088', 'FILTER,OIL,COOLANT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 54672654 | Brand: IR | Model: MM37', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1130, '10004089', 'CARTRIDGE,SEPARATOR', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 54749247 | Brand: IR | Model: MM37', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1131, '10004090', 'SEAL,ENCASED', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 85MM | Brand: 130MM | Model: 13MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1132, '10004091', 'SEAL,ENCASED', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 38MM | Brand: 74MM | Model: 11MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1133, '10004215', 'NUT LINK STYLE BELT', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12X13MM | Brand: TYPE A', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1134, '10004240', 'PULLEY,GROOVE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4 | Brand: 60MM | Model: 300MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1135, '10004346', 'ASBESTOS SHEET', 2, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10MMX10MMX5KG | Brand: SQR | Model: WHITE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1136, '10004372', 'ASBESTOS SHEET', 2, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 15MMX15MMX5KG | Brand: SQR | Model: WHITE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1137, '10004411', 'ASBESTOS SHEET', 2, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 18MMX18MMX5KG | Brand: SQR | Model: WHITE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1138, '10004449', 'WIRE FABRIC;SCREEN;80;0.11MM;1M;SS316', 61, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'WIRE FABRIC;SCREEN;80;0.11MM;1M;SS316', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1139, '10004450', 'WIRE FABRIC;SCREEN;50;0.12MM;1M;SS316', 61, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'WIRE FABRIC;SCREEN;50;0.12MM;1M;SS316', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1140, '10004452', 'WIRE FABRIC;SCREEN;20;0.12MM;1M;SS316', 61, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'WIRE FABRIC;SCREEN;20;0.12MM;1M;SS316', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1141, '10004454', 'BEARING,RLR,CYL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NU312ECMC3 | Brand: 60MM | Model: 130MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1142, '10004459', 'BEARING,RLR,CYL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NJ314ECP | Brand: 70MM | Model: 150MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1143, '10004468', 'SEAL,ENCASED', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 70MM | Brand: 90MM | Model: 10MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1144, '10004471', 'SEAL,ENCASED', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 65MM | Brand: 90MM | Model: 13MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1145, '10004485', 'LUB OIL,COMPRESSOR', 62, 7, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 209L | Brand: ROTO-H Plus', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1146, '10004488', 'FLAP,INNER TUBE,PNEUMATIC TYRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1147, '10004489', 'FLAP,INNER TUBE,PNEUMATIC TYRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 15IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1148, '10004490', 'FLAP,INNER TUBE,PNEUMATIC TYRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1149, '10004491', 'FLAP,INNER TUBE,PNEUMATIC TYRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 25IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1150, '10004492', 'STARTER,SWITCH', 53, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91A07-11900 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1151, '10004493', 'CYLINDER,BRAKE', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91A46-10100 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1152, '10004495', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91A20-00500 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1153, '11000013', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 1/2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1154, '11000018', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1155, '11000021', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1156, '11000022', 'VALVE,FOOT', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SWING | Brand: 4IN | Model: SCREWED', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1157, '11000025', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1158, '11000026', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1159, '11000032', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1160, '11000034', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1161, '11000035', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1162, '11000037', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1163, '11000038', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1164, '11000039', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1165, '11000045', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1166, '11000054', 'PIPE,METAL', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: DIN2440 | Model: 6M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1167, '11000057', 'HOSE,NONMTL', 29, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RUBBER | Brand: 1/2IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1168, '11000076', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1169, '11000080', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 6M | Model: CS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1170, '11000082', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1-1/2IN | Brand: 6M | Model: CS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1171, '11000086', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1172, '11000090', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1173, '11000091', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1174, '11000092', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1175, '11000093', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1176, '11000094', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1177, '11000095', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12IN | Brand: 6M | Model: SCH XS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1178, '11000104', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1179, '11000112', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1180, '11000115', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1181, '11000116', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1182, '11000120', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2-1/2IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1183, '11000121', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3/4IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1184, '11000122', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1185, '11000125', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1186, '11000127', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1187, '11000129', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: 6M | Model: CS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1188, '11000141', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6212-Z | Brand: 60MM | Model: 110MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1189, '11000143', 'BEARING,BALL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6316 | Brand: 80MM | Model: 170MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1190, '11000149', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 100MM | Brand: 6M | Model: UPVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1191, '11000154', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 23220-CCK-W33 | Brand: 100MM | Model: 180MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1192, '11000155', 'ROPE,FIBROUS', 46, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12MM (1/2IN) | Brand: 3 STRAND | Model: PP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1193, '11000157', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6IN | Brand: 6M | Model: UPVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1194, '11000165', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8IN | Brand: 6M | Model: UPVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1195, '11000166', 'SHACKLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2X5/8IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1196, '11000175', 'PACKING MATL', 38, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SQ | Brand: 1/2IN | Model: HEMP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1197, '11000177', 'PACKING MATL', 38, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SQ | Brand: 3/4IN | Model: HEMP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1198, '11000179', 'PACKING MATL', 38, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 3/4IN | Model: ASB YARN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1199, '11000190', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1200, '11000191', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6213 | Brand: 65MM | Model: 120MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1201, '11000198', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 1-1/2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1202, '11000202', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 3IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1203, '11000224', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1204, '11000230', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22212-E | Brand: 60MM | Model: 110MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1205, '11000243', 'PACKING MATL', 38, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SQ | Brand: 7/8IN | Model: HEMP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1206, '11000245', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B68', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1207, '11000246', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B81', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1208, '11000247', 'PACKING MATL', 38, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 1/4IN | Model: ASB YARN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1209, '11000254', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6004 | Brand: 20MM | Model: 42MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1210, '11000267', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1211, '11000270', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1212, '11000271', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1213, '11000282', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 8IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1214, '11000284', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 6IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1215, '11000288', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1-1/2IN | Brand: FNPT | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1216, '11000289', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2-1/2IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1217, '11000290', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: A80', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1218, '11000298', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12IN | Brand: 6M | Model: UPVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1219, '11000313', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1220, '11000320', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1221, '11000321', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 2-1/2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1222, '11000327', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1223, '11000332', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1224, '11000334', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1225, '11000339', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 1IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1226, '11000341', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1227, '11000343', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: FNPT | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1228, '11000344', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: FNPT | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1229, '11000345', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1230, '11000346', 'BRUSH,WIRE,SCRATCH', 11, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STEEL | Brand: WOOD', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1231, '11000349', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1232, '11000351', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1233, '11000362', 'BLADE,HAND HACKSAW', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 300MM | Brand: 25/20MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1234, '11000363', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B60', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1235, '11000364', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B75', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1236, '11000366', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2-1/2IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1237, '11000370', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 3/4IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1238, '11000384', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1239, '11000386', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1240, '11000391', 'FLANGE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LJ | Brand: FF | Model: 6IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1241, '11000395', 'VALVE,GATE', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN | Brand: FLG | Model: 6-10ATM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1242, '11000414', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 4IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1243, '11000420', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1244, '11000441', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6201 | Brand: 12MM | Model: 32MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1245, '11000444', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6306 | Brand: 30MM | Model: 72MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1246, '11000447', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6303-Z | Brand: 17MM | Model: 47MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1247, '11000448', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6210 | Brand: 50MM | Model: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1248, '11000449', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6211 | Brand: 55MM | Model: 100MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1249, '11000450', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6305 | Brand: 25MM | Model: 62MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1250, '11000458', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6307 | Brand: 35MM | Model: 80MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1251, '11000460', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6317 | Brand: 85MM | Model: 180MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1252, '11000469', 'CLAMP,ROPE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GRIP | Brand: DIN 1692 | Model: 1IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1253, '11000476', 'GLAND SIDE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P623/3 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1254, '11000478', 'CLAMP,ROPE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GRIP | Brand: DIN 1692 | Model: 3/8IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1255, '11000481', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22224-E | Brand: 120MM | Model: 215MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1256, '11000506', 'SHAFT', 50, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/8 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1257, '11000509', 'LINER,WEAR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/4 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL);
INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `satuan_id`, `stok_minimum`, `stok_maksimum`, `stok_tersedia`, `harga_satuan`, `lokasi_penyimpanan`, `kondisi_fisik`, `foto_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1258, '11000513', 'CASING,PUMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/3 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1259, '11000532', 'SHAFT', 50, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P623/8 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1260, '11000551', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6305-Z | Brand: 25MM | Model: 62MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1261, '11000563', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6306-Z | Brand: 30MM | Model: 72MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1262, '11000570', 'ROPE,WIRE', 46, 5, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 28M | Brand: 8MM | Model: 8X19 IWRC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1263, '11000619', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22220-E | Brand: 100MM | Model: 180MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1264, '11000640', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22315-EK | Brand: 75MM | Model: 160MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1265, '11000641', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22316-EK | Brand: 80MM | Model: 170MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1266, '11000643', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22310-EK | Brand: 50MM | Model: 110MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1267, '11000666', 'HOSE,NONMTL', 29, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SYN RUBBER | Brand: 100M | Model: 13.3MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1268, '11000668', 'HOSE,NONMTL', 29, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SYN RUBBER | Brand: 100M | Model: 17MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1269, '11000669', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6205 | Brand: 25MM | Model: 52MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1270, '11000670', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6324 | Brand: 120MM | Model: 260MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1271, '11000671', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6309 | Brand: 45MM | Model: 100MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1272, '11000679', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22216-EK | Brand: 80MM | Model: 140MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1273, '11000681', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6309-2Z | Brand: 45MM | Model: 100MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1274, '11000707', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6205-Z | Brand: 25MM | Model: 52MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1275, '11000708', 'HACKSAW,METALCUT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN | Brand: 3/4X1/2 | Model: NICKELTUBE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1276, '11000731', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: A53', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1277, '11000740', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B63', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1278, '11000751', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B25', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1279, '11000760', 'BEARING,BALL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2216-E-KTN9 | Brand: 80MM | Model: 140MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1280, '11000762', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6307-2Z | Brand: 35MM | Model: 80MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1281, '11000774', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1282, '11000788', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1-1/2IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1283, '11000792', 'PIPE,LANCE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BLACK STEEL | Brand: 13.7MM | Model: 3M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1284, '11000794', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 230X114X76MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1285, '11000795', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3/4IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1286, '11000797', 'PIPE,LANCE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BLACK STEEL | Brand: 1/2IN | Model: 6M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1287, '11000799', 'CLAY,REFRACT', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SCHAMOTTE | Brand: 6MM-20MM | Model: 50%AL2O3', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1288, '11000800', 'MORTAR,REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWDER | Brand: MEKSICCAR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1289, '11000802', 'MORTAR,REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK-34 | Brand: DRY POWDER | Model: 40KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1290, '11000803', 'MORTAR,REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK-36 | Brand: DRY POWDER | Model: 40KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1291, '11000805', 'CLOTH,ABRASIVE', 62, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P36 (NO.2) | Brand: 9X11IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1292, '11000806', 'WHEEL,ABRSV', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CUTTING | Brand: 405MM | Model: 4MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1293, '11000807', 'HANGER,CLIP', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6X123X64MM | Brand: BRICK', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1294, '11000808', 'RAG,WIPING', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COTTON', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1295, '11000809', 'BLADE,CIRCULAR SAW', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 14IN | Brand: 27MM | Model: 3-5MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1296, '11000811', 'REGULATOR,OXYGEN', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 150PS | Brand: G250150992 | Model: VICTOR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1297, '11000832', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6307-Z | Brand: 35MM | Model: 80MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1298, '11000833', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6308-2Z | Brand: 40MM | Model: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1299, '11000834', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6312-2Z | Brand: 60MM | Model: 130MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1300, '11000856', 'PIN,PISTON', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 01232060-67-3 | Brand: IWATA', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1301, '11000864', 'SACK', 47, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: GUNNY | Brand: 1 PLY | Model: 100KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1302, '11000872', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1303, '11000880', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B54', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1304, '11000881', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B64', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1305, '11000888', 'ROPE,FIBROUS', 46, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16MM (5/8IN) | Brand: 3 STRAND | Model: PP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1306, '11000890', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B65', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1307, '11000893', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C75', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1308, '11000899', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: A94', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1309, '11000900', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B70', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1310, '11000905', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C68', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1311, '11000907', 'DISK,FLAP,ABRASIVE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE 27 | Brand: 4IN | Model: GRIT 80', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1312, '11000939', 'TAPE,ANTISEIZING', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10M | Brand: 25MM | Model: PTFE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1313, '11000952', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: ALUM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1314, '11000963', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6310-2Z | Brand: 50MM | Model: 110MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1315, '11000968', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: UNC | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1316, '11000970', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6207 | Brand: 35MM | Model: 72MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1317, '11000971', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6311-2Z | Brand: 55MM | Model: 120MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1318, '11000972', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22213-EK | Brand: 65MM | Model: 120MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1319, '11000989', 'CLOTH,ABRASIVE', 62, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P80 (NO.0) | Brand: 9X11IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1320, '11000990', 'CLOTH,ABRASIVE', 62, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P40 (NO.1.5) | Brand: 9X11IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1321, '11000992', 'TUBE,MTL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16MM | Brand: 2MM | Model: 6M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1322, '11000993', 'TUBE,MTL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20MM | Brand: 2.5MM | Model: 6M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1323, '11001010', 'TIP,CUTTING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COPPER | Brand: GPN NO.2 | Model: ORF DIA.1MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1324, '11001012', 'TIP,CUTTING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COPPER | Brand: GPN NO.2 | Model: ORF DIA1.4MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1325, '11001013', 'TIP,CUTTING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COPPER | Brand: NO.3', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1326, '11001040', 'BEARING UNIT,BALL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILLOW | Brand: UCP-206 | Model: 30MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1327, '11001041', 'BEARING UNIT,BALL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILLOW | Brand: SY-40-TF | Model: 40MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1328, '11001042', 'BEARING UNIT,BALL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILLOW | Brand: SY-45-TF | Model: 45MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1329, '11001044', 'REGULATOR,LPG', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2-60PS | Brand: D25060511LP | Model: VICTOR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1330, '11001048', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1331, '11001049', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1332, '11001053', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALUM | Brand: 305X114X114MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1333, '11001056', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6314-Z | Brand: 70MM | Model: 150MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1334, '11001060', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6204-2Z | Brand: 20MM | Model: 47MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1335, '11001071', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6308-Z | Brand: 40MM | Model: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1336, '11001072', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6207-2Z | Brand: 35MM | Model: 72MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1337, '11001076', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6203-2Z | Brand: 17MM | Model: 40MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1338, '11001078', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6210-2Z | Brand: 50MM | Model: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1339, '11001087', 'TORCH,CUTTING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 90DEG | Brand: 1/8-5IN | Model: 1-101 TIP', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1340, '11001093', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1341, '11001154', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NU311-EC-P-C3 | Brand: 55MM | Model: 120MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1342, '11001186', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: ALUMINA | Model: 230X114X57', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1343, '11001205', 'HOLDER,ELECTRODE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600A | Brand: 3.2-15.9MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1344, '11001223', 'BEARING,ROLLER', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22218-EK-C3 | Brand: 90MM | Model: 160MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1345, '11001255', 'BOLT', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: COARSE | Model: MS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1346, '11001257', 'IMPELLER,PUMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 683/6S | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1347, '11001292', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1348, '11001293', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1349, '11001294', 'VALVE,BTRFLY', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN | Brand: 6-10ATM | Model: CI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1350, '11001382', 'BOLT,MACHINE', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: BSW | Model: SS704', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1351, '11001383', 'HOIST,CHAIN', 28, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: 1.5TON | Model: 3M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1352, '11001384', 'HOIST,CHAIN', 28, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: 2TON | Model: 3M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1353, '11001385', 'HOIST,CHAIN', 28, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: 3TON | Model: 3M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1354, '11001386', 'HOIST,CHAIN', 28, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: 5TON | Model: 3M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1355, '11001426', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 10IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1356, '11001430', 'FLANGE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LJ | Brand: FF | Model: 2-1/2IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1357, '11001431', 'FLANGE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LJ | Brand: FF | Model: 3IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1358, '11001432', 'FLANGE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LJ | Brand: FF | Model: 4IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1359, '11001433', 'NOZZLE,BURNER', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.2MM | Brand: 23X3MM | Model: ASSAB 7210M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1360, '11001434', 'NOZZLE,BURNER', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.3MM | Brand: 23X3MM | Model: ASSAB 7210M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1361, '11001435', 'NOZZLE,BURNER', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.4MM | Brand: 23X3MM | Model: ASSAB 7210M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1362, '11001436', 'NOZZLE,BURNER', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.5MM | Brand: 23X3MM | Model: ASSAB 7210M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1363, '11001460', 'STRIP,COVER', 62, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 100X10000MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1364, '11001461', 'ADHESIVE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: COLD VULCANIZING | Brand: LIQUID | Model: 1KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1365, '11001465', 'WHEEL,ABRASIVE', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: GRINDING | Brand: 7IN | Model: 1/4IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1366, '11001466', 'WHEEL,ABRASIVE', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: GRINDING | Brand: 4IN | Model: 1/4IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1367, '11001481', 'WHEEL,ABRASIVE', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CUTTING | Brand: 4IN | Model: 1/8IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1368, '11001579', 'BOLT,HOOK', 8, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CS | Brand: 300MM | Model: 1.25MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1369, '11001598', 'BEARING,BALL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6216 | Brand: 80MM | Model: 140MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1370, '11001616', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: 6M | Model: SCH 40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1371, '11001686', 'PIPE,PLASTIC', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3IN | Brand: 6M | Model: HDPE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1372, '11001781', 'PULLEY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.1.21.13.59.A4 | Brand: LINATEX', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1373, '11001790', 'OXYGEN CYLINDER VALVE;G-5/8IN', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'OXYGEN CYLINDER VALVE;G-5/8IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1374, '11001867', 'ADHESIVE', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: THREADLOCKING | Brand: LIQUID | Model: 50ML', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1375, '11001868', 'ANTISEIZE COMPND', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LIQUID | Brand: PETRLM | Model: WD-40', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1376, '11001869', 'ANTISEIZE COMPND', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LIQUID | Brand: CONTACT CLEANER', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1377, '11002073', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6206-2Z | Brand: 30MM | Model: 62MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1378, '11002215', 'O-RING ASSORTMENT', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 382PCS | Brand: 30(IN) | Model: NBR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1379, '11002216', 'O-RING ASSORTMENT', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 382PCS | Brand: 30(MM) | Model: NBR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1380, '11002274', 'RING,PISTON', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: E245100210A | Brand: DAIHATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1381, '11002612', 'HEATING ELEMENT', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KANTHAL WIRE | Brand: AF | Model: 4MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1382, '11002981', 'FLEXI,DISC,CONVEYOR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TUBE | Brand: 200 | Model: GG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1383, '11002982', 'SEAL,ENCASED', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16.5MM | Brand: 40MM | Model: 12MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1384, '11003043', 'NOZZLE', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 602.019/602.220 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1385, '11003060', 'ROOFING FELT', 62, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CORR | Brand: 3600X600X2MM | Model: FBRGLASS', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1386, '11003070', 'SACK', 47, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JUMBO BAG | Brand: 2 PLY | Model: 1000KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1387, '11003123', 'BAR', 3, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: PTFE | Model: 56.5MM DIA', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1388, '11003124', 'BAR', 3, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: PTFE | Model: 30MM DIA', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1389, '11003125', 'BAR', 3, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: PTFE | Model: 100MM DIA', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1390, '11003127', 'BAR', 3, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: PTFE | Model: 200MM DIA', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1391, '11003238', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12IN | Brand: 6M | Model: SCH 10S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1392, '11003266', 'CHAIN CONNECTOR TUBE CHAIN', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CHAIN CONNECTOR TUBE CHAIN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1393, '11003268', 'CLEANING DISC TUBE CHAIN', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CLEANING DISC TUBE CHAIN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1394, '11003269', 'HOSE,CATENARY', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AUTOTEC | Brand: TSL-AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1395, '11003272', 'SWIRLER ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: V5-913 | Brand: AUTOTEC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1396, '11003289', 'CONVEYING CHAIN TUBE CHAIN', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CONVEYING CHAIN TUBE CHAIN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1397, '11003296', 'DEMISTER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PAD | Brand: 0.28MM | Model: 3000MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1398, '11003323', 'HOUSING,BRG', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SNL-520-617 | Brand: PLUMMER | Model: 180MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1399, '11003324', 'SEAL RING,LABYRINTH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SNL-520-TC | Brand: 90MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1400, '11003325', 'SPACER,RING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 167MM | Brand: 180MM | Model: 4.85MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1401, '11003380', 'STUB END', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BF | Brand: PE100 | Model: PN6', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1402, '11003400', 'SACK', 47, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JUMBO BAG | Brand: 2 PLY | Model: 1000KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1403, '11003420', 'HOSE,NONMTL', 29, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLEXIBLE PVC | Brand: 50M | Model: 33MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1404, '11003421', 'HOSE,NONMTL', 29, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLEXIBLE PVC | Brand: 50M | Model: 62MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1405, '11003428', 'VENTURY,RETAINER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TSL AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1406, '11003429', 'FILTER,CLOTH', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TSL-AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1407, '11003430', 'SPECTACLES', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SAFETY | Brand: YELLOW | Model: HALF FRM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1408, '11003460', 'RETAINER,CAGE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4X149X2395MM | Brand: DUSTCOLLECTOR', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1409, '11003471', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: 6M | Model: HDPE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1410, '11003472', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6IN | Brand: 6M | Model: HDPE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1411, '11003480', 'SEAL,LANCE PIPE', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: NEOPRENE | Model: IT.B-24', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1412, '11003481', 'CHUCK', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.03110-23123-192.MOD-IT.B-14', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1413, '11003517', 'BEARING,BALL,ANNULAR', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6202-2Z | Brand: 15MM | Model: 35MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1414, '11003582', 'SACK', 47, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JUMBO BAG | Brand: 2 PLY | Model: 1000KG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1415, '11003630', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B86', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1416, '11003666', 'ASBESTOS SHEET', 2, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3MM | Brand: 1500MM | Model: 2000MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1417, '11003671', 'TOOTH,BUCKET', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 205-70-19570 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1418, '11003672', 'ADAPTER,TOOTH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20Y-70-14520 | Brand: KOMATSU', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1419, '11003677', 'HOIST,CHAIN', 28, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: 10TON | Model: 5M', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1420, '11003705', 'SCREW,CAP,SKT HD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CYL | Brand: M8 | Model: 50MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1421, '11003707', 'WASHER,SPRING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SPLIT | Brand: 5/8IN | Model: 0.126IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1422, '11003708', 'WASHER,FLAT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 21/32IN | Brand: 1-5/16IN | Model: 3/32IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1423, '11003718', 'SCREW,CAP,SKT HD', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CYL | Brand: M5 | Model: 25MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1424, '11003719', 'SCREW,CAP,SKT HD', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CYL | Brand: M6 | Model: 30MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1425, '11003720', 'SCREW,CAP,SKT HD', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CYL | Brand: M8 | Model: 30MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1426, '11003725', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1-1/2IN | Brand: 6M | Model: SCH 80S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1427, '11003726', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: 6M | Model: SCH 80S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1428, '11003731', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: 4M | Model: PVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1429, '11003732', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3/4IN | Brand: 4M | Model: PVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1430, '11003733', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 4M | Model: PVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1431, '11003734', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: 4M | Model: PVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1432, '11003735', 'PIPE', 41, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3IN | Brand: 4M | Model: PVC', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1433, '11003736', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PVC | Brand: 1/2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1434, '11003737', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PVC | Brand: 3/4IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1435, '11003738', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PVC | Brand: 1IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1436, '11003739', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PVC | Brand: 2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1437, '11003740', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PVC | Brand: 3IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1438, '11003741', 'COUPLING,PIPE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FULL | Brand: SKT | Model: AW', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1439, '11003742', 'COUPLING,PIPE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FULL | Brand: SKT | Model: AW', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1440, '11003743', 'COUPLING,PIPE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FULL | Brand: SKT | Model: AW', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1441, '11003744', 'COUPLING,PIPE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FULL | Brand: SKT | Model: AW', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1442, '11003745', 'COUPLING,PIPE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FULL | Brand: SKT | Model: AW', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1443, '11003760', 'ROOFING FELT', 62, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CORR 6 | Brand: 2500X1020X5MM | Model: ASB', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1444, '11003812', 'CHISEL,BREAKER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 60CM | Brand: 40MM | Model: CB-20-A', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1445, '11003813', 'WHEEL,ABRASIVE', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CUTTING | Brand: 14IN | Model: 1/8IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1446, '11003814', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: THD | Model: CL150', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1447, '11003815', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3/4IN | Brand: THD | Model: CL150', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1448, '11003816', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: THD | Model: CL150', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1449, '11003817', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1-1/2IN | Brand: THD | Model: CL150', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1450, '11003818', 'PLUG VALVE 1-1/2\"', 43, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'PLUG VALVE 1-1/2\"', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1451, '11003833', 'SPACER,RING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 275MM | Brand: 290MM | Model: 5MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1452, '11003844', 'ELBOW,PIPE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS316 | Brand: 2IN | Model: 90DEG', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1453, '11003850', 'CLAMP,HOSE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SUPERIOR HEAVY DUTY | Brand: SS316 | Model: 4IN', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1454, '11003873', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: THD NPT | Model: 6000PSI', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1455, '11004105', 'BELT CONVEYOR CV115, CEMA; BANDO', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'BELT CONVEYOR CV115, CEMA; BANDO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1456, '11004106', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8IN | Brand: 6M | Model: SCH 40S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1457, '11004120', 'TENSION UNIT 160/200 SF', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'TENSION UNIT 160/200 SF', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1458, '11004123', 'HOSE ASSY;METALLIC', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS304 | Brand: 1-1/2IN | Model: 2000MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1459, '11004126', 'HOSE ASSY;METALLIC', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS304 | Brand: 1-1/4IN | Model: 2000MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1460, '11004127', 'NOZZLE,SPIRAL', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SPRAY | Brand: 2IN | Model: SPJT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1461, '11004131', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3IN | Brand: 6M | Model: SCH 80S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1462, '11004132', 'PIPE', 41, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1/2IN | Brand: 6M | Model: SCH 40S', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1463, '11004133', 'PYROMETER,TUBE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DN20 | Brand: 6000MM | Model: SS304L', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1464, '11004134', 'PLATE', 42, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12MM | Brand: 1200MM | Model: 2400MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1465, '11004135', 'HOSE ASSY', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 1IN | Model: SS304', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1466, '11004136', 'HOSE ASSY', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 1IN | Model: SS304', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1467, '11004137', 'DRAIN,CONDENSATE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AUTO | Brand: EWD50L | Model: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1468, '11004142', 'THERMOWELL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STR | Brand: 180MM | Model: 1/2IN NPT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1469, '11004143', 'THERMOWELL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STR | Brand: 280MM | Model: 1/2IN NPT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1470, '11004145', 'THERMOWELL,TUNDISH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS316 | Brand: SCH80 | Model: 50X160MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1471, '11004146', 'THERMOWELL,TUNDISH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS316 | Brand: SCH80 | Model: 50X200MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1472, '11004148', 'BRACE ASSY,SWAY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: N048508056 | Brand: TSL-AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1473, '11004163', 'BLOCK,INSERT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: N048717905 | Brand: TSL-AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1474, '11004180', 'SPROCKET,TUBE CHAIN;101862;AUSMELT', 52, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'SPROCKET,TUBE CHAIN;101862;AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1475, '11004183', 'BEARING,BALL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 626-2Z-C3 | Brand: 6MM | Model: 19MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1476, '11004184', 'BEARING,BALL', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6206-2Z-C3 | Brand: 30MM | Model: 62MM', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1477, '11004185', 'NOZZLE,SPRAY', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T32 | Brand: 3/4IN MNPT | Model: SS316', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1478, '11004186', 'NOZZLE,SPRAY', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T72 | Brand: 1-1/2IN MNPT | Model: PTFE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1479, '11004187', 'NOZZLE,SPRAY', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: M678 | Brand: 1-1/2IN MNPT | Model: PTFE', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1480, '11004213', 'BLADE,SCRAPER,PRIMARY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: EZP1-600-50 | Brand: FLEXCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1481, '11004214', 'BLADE,SCRAPER,SECONDARY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: YT-600-Y | Brand: FLEXCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1482, '11004247', 'NOZZLE,SPRAY', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TSL-AUSMELT', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1483, '11004445', 'HOSE ASSY', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1IN | Brand: 1IN | Model: SS304', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1484, '11004446', 'REGULATOR,PRESS,AIR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 159590 | Brand: FRC-1/2 | Model: FESTO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1485, '11004447', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C85', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1486, '11004448', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C142', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1487, '11004449', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B106', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1488, '11004546', 'VALVE,BLOW,OFF', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1622-3694-80 | Brand: ATLAS COPCO', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1489, '11004550', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C146', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1490, '11004551', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C166', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1491, '11004553', 'MOUNT,RESILIENT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20X120X50MM | Brand: RUBBER', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1492, '11004555', 'VALVE,DRAIN;ELECTRONIC;FITS;2202815908', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'VALVE,DRAIN;ELECTRONIC;FITS;2202815908', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1493, '11004607', 'BELTING,FLAT', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CANVAS | Brand: 5IN | Model: 5 PLY', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1494, '11004608', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C72', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1495, '11004609', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B60', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1496, '11004610', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B66', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1497, '11004611', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B72', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1498, '11004612', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B84', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1499, '11004613', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B90', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1500, '11004615', 'BELT,V', 7, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: A78', 1, '2025-11-29 04:20:02', '2025-11-29 04:20:02', NULL),
(1501, '11004619', 'STOPPER,CRANE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: END | Brand: C-TRACK | Model: 30x32x4000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1502, '11004620', 'BRACKET,CRANE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TRACK | Brand: 30x32x4000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1503, '11004621', 'TROLLEY,CRANE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HANGER | Brand: CH-BC-3525 | Model: 55MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1504, '11004622', 'RAIL C-TRACK', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ITS | Brand: 30X32 MM | Model: CH-2010', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1505, '11004623', 'JOINT BAR,RAIL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ITS | Brand: 30X32 MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1506, '11004624', 'GEARBOX', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WPA100 | Brand: R1/20 | Model: 25MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1507, '11004625', 'CHAIN,RLR', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RIVETED | Brand: 19,050MM | Model: RS 60-1', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1508, '11004626', 'SPROCKET,WHEEL', 52, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: B | Model: RS60-15T', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1509, '11004627', 'SPROCKET,WHEEL', 52, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: B | Model: RS60-21T', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1510, '11004629', 'SPROCKET,WHEEL', 52, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SINGLE GEAR | Brand: B | Model: RS60-29T', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1511, '11004630', 'RUBBER SHEET', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1000MM | Brand: 1200MM | Model: 10MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1512, '11004631', 'ELBOW,KNEE', 21, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE D | Brand: PVC | Model: 2IN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1513, '11004632', 'ROD, CON THD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS304 | Brand: UNC | Model: 5/8IN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1514, '11004633', 'ROD, CON THD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS304 | Brand: UNC | Model: 1/2IN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL);
INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `satuan_id`, `stok_minimum`, `stok_maksimum`, `stok_tersedia`, `harga_satuan`, `lokasi_penyimpanan`, `kondisi_fisik`, `foto_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1515, '11004634', 'ROD, CON THD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SS304 | Brand: UNC | Model: 3/4IN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1516, '11004635', 'FILTER,FUEL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-319-3750 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1517, '11004636', 'RACOR,ELEMENT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2040TM-OR | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1518, '11004637', 'CARTRIDGE', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-411-1191 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1519, '11004638', 'FILTER,FUEL FREE', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600-311-362 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1520, '11004639', 'BEARING,INN', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-24-32260 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1521, '11004640', 'BEARING,OUT', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 06300-30207 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1522, '11004641', 'LINNING,ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-30-41360 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1523, '11004642', 'LINNING ASSY LH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-30-41370 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1524, '11004643', 'LINNING ASSY RH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-30-41380 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1525, '11004644', 'PIN LH', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-24-51261 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1526, '11004646', 'BEARING NEEDLE', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-24-32440 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1527, '11004647', 'BEARING THRUST', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-24-52460 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1528, '11004648', 'TIEROD ASSY LH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3BA-24-71310 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1529, '11004649', 'TIEROD ASSY RH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3BA-24-71320 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1530, '11004650', 'PIN TIEROD', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-2451281 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1531, '11004651', 'ROLLER MAINT', 45, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 37B-9AF-6120 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1532, '11004652', 'SEAL KIT LIFT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 30B-63-05050 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1533, '11004653', 'SEAL KIT TILT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-64-54280 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1534, '11004654', 'SEAL KIT STERRING', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-64-59940 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1535, '11004655', 'VALVE ASSY SELENOID', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3EB-15-58611 | Brand: KOMATSU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1536, '11004656', 'SEAL KIT LIFT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 234-1951 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1537, '11004657', 'SEAL KIT TILT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 234-1948 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1538, '11004658', 'SEAL KIT STERRING', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 233-9204 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1539, '11004659', 'PIN BUCKET', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 148-7871 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1540, '11004660', 'PIN BUCKET', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 148-7872 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1541, '11004661', 'BUSHING SLEAVE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4V-8643 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1542, '11004662', 'BUSHING SLEAVE ARM', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4V-8631 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1543, '11004663', 'BUSHING SLEAVE ARM', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3G-2797 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1544, '11004666', 'FILTER ENGINE OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 462-1171 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1545, '11004667', 'FUEL FILTER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 360-8960 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1546, '11004668', 'WATER SEPARATOR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 391-3764 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1547, '11004669', 'CRANKCASE FILTER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 273-5711 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1548, '11004670', 'FILTER AIR', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 365-7606 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1549, '11004671', 'FILTER CAB', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 353-5058 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1550, '11004674', 'SEAL KIT TILT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 94404-30160 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1551, '11004675', 'SEAL KIT LIFT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 94469-00078 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1552, '11004678', 'BEARING NEEDLE', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 64343-73800 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1553, '11004679', 'BEARING THRUST', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91843-02400 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1554, '11004680', 'BEARING ASSY PLAIN', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91K43-00028 | Brand: CAT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1555, '11004681', 'SPHERICAL BEARING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91B43-05624 | Brand: CAT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1556, '11004682', 'TIEROD RH/LH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91F43-00500 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1557, '11004683', 'PIN TIEROD', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91B43-00700 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1558, '11004684', 'PIN KING LH', 40, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91K43-00500 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1559, '11004685', 'BEARING THRUST', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91F43-00300 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1560, '11004687', 'BEARING NEEDLE', 6, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91F43-05100 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1561, '11004688', 'BUSH SPHERICAL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 05649-10170 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1562, '11004690', 'TIEROD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91F43-00520 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1563, '11004692', 'SEAL KIT TILT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 94304-40140 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1564, '11004693', 'SEAL KIT LIFT', 48, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 91F43-00710 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1565, '11004694', 'ROLLER MAIN BEARING', 45, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 94211-11800 | Brand: CAT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1566, '11004695', 'FILTER,ELEMET', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 23304-EV031 | Brand: HINO', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1567, '11004696', 'FILTER,FREE', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: YN21P01068-R100 | Brand: KOBELCO', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1568, '11004697', 'FILTER,OIL', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: VH1506072190D | Brand: KOBELCO | Model: CKS800', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1569, '11004698', 'FILTER ELEMENT', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 23414-E0020 | Brand: KOBELCO', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1570, '11004700', 'BRAKE FLUID', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DOT 3 | Brand: SYNTHETIC | Model: 1 LITER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1571, '11004755', 'BOLT&NUT', 62, 1, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6X25 MM,RING DIA. 45 MM | Brand: JACKSON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1572, '11004838', 'ROLLER,CHAIN', 45, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RS 12B-2 | Brand: 3000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1573, '11004839', 'ROLLER,CHAIN', 45, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RS 120-2 | Brand: 3000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1574, '11004845', 'SLING,ENDLESS', 62, 8, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10TON | Brand: 10METERX300MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1575, '11004950', 'BEARING,BALL', 6, 8, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6204 2Z C3 | Brand: 20MM | Model: 47MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1576, '11004960', 'CHAIN,RLR', 62, 8, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RF650F-AT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1577, '11004962', 'SPROCKET', 52, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RF650F12T-CW | Brand: CS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1578, '12000019', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PO | Brand: 16MM | Model: 0.4MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1579, '12000033', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PO | Brand: 20MM | Model: 0.45MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1580, '12000039', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SHIP | Brand: 4C | Model: 70MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1581, '12000040', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H07RNF | Brand: 4C | Model: 16MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1582, '12000042', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SHIP | Brand: 4C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1583, '12000043', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 2C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1584, '12000046', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H07RNF | Brand: 4C | Model: 10MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1585, '12000048', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 25MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1586, '12000050', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H07RNF | Brand: 4C | Model: 4MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1587, '12000053', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYA | Brand: 1C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1588, '12000058', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYMHY | Brand: 4C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1589, '12000074', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 10MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1590, '12000076', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 16MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1591, '12000077', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYA | Brand: 1C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1592, '12000079', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1593, '12000080', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1594, '12000082', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 4MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1595, '12000121', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STD | Brand: 75W | Model: 220V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1596, '12000122', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 35A | Brand: 500V | Model: BOTTLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1597, '12000132', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE.N | Brand: BRASS | Model: +/-', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1598, '12000134', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYMHY | Brand: 2C | Model: 0.75MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1599, '12000135', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIAZED | Brand: 63A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1600, '12000140', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIAZED | Brand: 50A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1601, '12000141', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYFGBY | Brand: 4C | Model: 16MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1602, '12000142', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 25A | Brand: 500V | Model: BOTTLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1603, '12000143', 'STRAP,TIEDOWN,CABLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.6MM | Brand: 150MM | Model: NYLON 66', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1604, '12000154', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 19MM | Brand: 30M | Model: COTTON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1605, '12000158', 'CABLE', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H01N2D | Brand: 1C | Model: 70MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1606, '12000159', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.40MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1607, '12000160', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.65MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1608, '12000161', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIAZED | Brand: 50A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1609, '12000163', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 4MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1610, '12000164', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1611, '12000168', 'STARTER,LAMP', 53, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: S10 | Brand: 4-65W | Model: 220-240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1612, '12000172', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SHIP | Brand: 4C | Model: 120MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1613, '12000174', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PO | Brand: 25MM | Model: 0.45MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1614, '12000175', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 15MM | Brand: 20M | Model: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1615, '12000176', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 35MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1616, '12000177', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 25MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1617, '12000178', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 16MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1618, '12000180', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 10MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1619, '12000181', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 38MM | Brand: 30M | Model: COTTON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1620, '12000183', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 6MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1621, '12000186', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 185MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1622, '12000188', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 240MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1623, '12000191', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 120MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1624, '12000193', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 95MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1625, '12000194', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 70MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1626, '12000195', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 50MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1627, '12000196', 'TERMINAL,LUG', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RING | Brand: 4MM2 | Model: CU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1628, '12000197', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 13MM | Brand: 30M | Model: COTTON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1629, '12000204', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.20MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1630, '12000210', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 70MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1631, '12000223', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 3C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1632, '12000224', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 6MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1633, '12000226', 'CABLE,POWER', 12, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 50MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1634, '12000228', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 10MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1635, '12000229', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.30MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1636, '12000233', 'CONDUIT,RIGID', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 5/8INX4M | Brand: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1637, '12000236', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 38MM | Brand: 20M | Model: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1638, '12000238', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 19MM | Brand: 20M | Model: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1639, '12000243', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: ROUND | Model: 3P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1640, '12000246', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 400A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1641, '12000247', 'TAPE,INSULATION', 55, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 25MM | Brand: 20M | Model: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1642, '12000250', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 315A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1643, '12000251', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 250A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1644, '12000252', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 4C | Model: 35MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1645, '12000257', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 1P | Model: 4A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1646, '12000259', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16A | Brand: 500V | Model: BOTTLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1647, '12000260', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 20A | Brand: 500V | Model: BOTTLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1648, '12000262', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10A | Brand: 500V | Model: BOTTLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1649, '12000265', 'THINNER', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 1KG/CAN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1650, '12000268', 'STARTER,MOTOR', 53, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ENCL | Brand: 3PH | Model: 380V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1651, '12000279', 'CONDUIT,RIGID', 62, 3, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 5/8INX4M | Brand: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1652, '12000282', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STD | Brand: 100W | Model: 220V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1653, '12000293', 'SWITCH,BOX', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: S431C/1 | Brand: 3P | Model: 125A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1654, '12000299', 'SWITCH,BOX', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SKH.400/1 | Brand: 3P | Model: 400A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1655, '12000304', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 160A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1656, '12000310', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 36A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1657, '12000342', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 200A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1658, '12000345', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 125A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1659, '12000353', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 125A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1660, '12000354', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 100A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1661, '12000366', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.85MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1662, '12000368', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.40MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1663, '12000370', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.60MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1664, '12000371', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: ROUND | Model: 2P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1665, '12000372', 'FUSEBASE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1000V | Brand: 160A | Model: 120KA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1666, '12000373', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: RD | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1667, '12000375', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.45MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1668, '12000376', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: RD | Model: 32A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1669, '12000377', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.50MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1670, '12000379', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: RD | Model: 63A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1671, '12000380', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.80MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1672, '12000381', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.55MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1673, '12000383', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: ROUND | Model: 3P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1674, '12000397', 'RELAY, THERMAL,', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 70-112 A | Brand: 3 POLE,125A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1675, '12000404', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HV | Brand: 25A | Model: 3-7.2KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1676, '12000442', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.15MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1677, '12000446', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.95MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1678, '12000448', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.70MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1679, '12000450', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.75MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1680, '12000451', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.90MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1681, '12000455', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.00MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1682, '12000474', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16A | Brand: 7.2KV | Model: CYL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1683, '12000479', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HV | Brand: 200A | Model: 3-7.2KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1684, '12000491', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOFLEX | Brand: 2MM | Model: YLW', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1685, '12000563', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYA | Brand: 1C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1686, '12000571', 'BATTERY,STORAGE', 4, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LEAD ACID | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1687, '12000573', 'TRANSFORMER,POWER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3PH | Brand: 110VA | Model: 230V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1688, '12000589', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 63A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1689, '12000591', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 2P | Model: 20A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1690, '12000592', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 2P | Model: 6A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1691, '12000596', 'BATTERY,STORAGE', 4, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LEAD ACID | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1692, '12000601', 'SWITCH,ROCKER', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1P | Brand: 10A | Model: 250V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1693, '12000605', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: SQ | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1694, '12000610', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: ROUND | Model: 2P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1695, '12000613', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CH STRIP | Brand: 1 X TL 18-20W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1696, '12000614', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CH STRIP | Brand: 1 X TL 36-40W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1697, '12000639', 'CONTROL,REMOTE SWITCH', 18, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2 INSL | Brand: MOTOR | Model: 6 BTN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1698, '12000640', 'TERMINAL BLOCK', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STUD | Brand: 2P | Model: 1000V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1699, '12000644', 'BATTERY,STORAGE', 4, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LEAD ACID | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1700, '12000651', 'FUSE', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIAZED | Brand: 25A | Model: CYL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1701, '12000657', 'HOLDER,ELEC BRUSH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NS763-8-BRUSH | Brand: HEEMAF', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1702, '12000665', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYMHY | Brand: 2C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1703, '12000666', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYMHY | Brand: 3C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1704, '12000667', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYMHY | Brand: 2C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1705, '12000679', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYY | Brand: 2C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1706, '12000681', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 2MM | Model: 0.4MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1707, '12000682', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 7MM | Model: 0.5MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1708, '12000684', 'INSULATION SHEET', 31, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.4MM | Brand: 1000MM | Model: NOMEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1709, '12000687', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYAF | Brand: 1C | Model: 35MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1710, '12000718', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 80A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1711, '12000719', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SHIP | Brand: 4C | Model: 10MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1712, '12000721', 'BATTERY,STORAGE', 4, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LEAD ACID | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1713, '12000732', 'LAMP,REFLECTOR', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 545MM | Brand: E40 | Model: BASE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1714, '12000748', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: ROUND | Model: 3P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1715, '12000782', 'BATTERY,STORAGE', 4, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LEAD ACID | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1716, '12000784', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 3P | Model: 25A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1717, '12000801', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H07RNF | Brand: 2C | Model: 1.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1718, '12000819', 'INSULATING VARNISH', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CLASS F | Brand: 1KG', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1719, '12000824', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 1.5MM | Model: 0.4MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1720, '12000827', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 10MM | Model: 0.6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1721, '12000839', 'HOLDER,LAMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 250V | Brand: E27 | Model: 300MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1722, '12000848', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYA | Brand: 1C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1723, '12000849', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 5MM | Model: 0.5MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1724, '12000851', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 2.5MM | Model: 0.4MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1725, '12000852', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 3MM | Model: 0.46MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1726, '12000853', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 3.5MM | Model: 0.46MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1727, '12000854', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 4MM | Model: 0.46MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1728, '12000856', 'INSULATION SLV', 31, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 6MM | Model: 0.5MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1729, '12000862', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 380V | Brand: 60A | Model: 230-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1730, '12000878', 'SWITCH,MAGNETIC', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9F3099 | Brand: CATERPILLAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1731, '12000886', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.25MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1732, '12000891', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NYM | Brand: 2C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1733, '12000901', 'CABLE,POWER', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H07RNF | Brand: 2C | Model: 2.5MM2', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1734, '12000903', 'STRAP,TIEDOWN,CABLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4.6MM | Brand: 200MM | Model: NYLON 66', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1735, '12000904', 'STRAP,TIEDOWN,CABLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.6MM | Brand: 300MM | Model: NYLON 66', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1736, '12000908', 'FLASHLIGHT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4 BATT | Brand: PVC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1737, '12000909', 'JUNCTION BOX', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PC | Brand: 171MM | Model: 360MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1738, '12000926', 'CONTROL,REMOTE SWITCH', 18, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2 INSL | Brand: START-STOP', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1739, '12000933', 'CURRENT, COLECTOR; FOR U 30; KST 175/30', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CURRENT, COLECTOR; FOR U 30; KST 175/30', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1740, '12000934', 'DOUBLE COLECTOR; FO U 20; KDSTL 80', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'DOUBLE COLECTOR; FO U 20; KDSTL 80', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1741, '12000935', 'PANEL,POWER DISTR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 540X270X171MM | Brand: PL | Model: IP56', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1742, '12000937', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220VAC | Brand: 250VAC/250VDC | Model: 10A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1743, '12000939', 'FUSEBASE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 690V | Brand: 1250A | Model: 120KA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1744, '12000945', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 25A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1745, '12000947', 'FUSE LINK', 26, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HRC | Brand: 50A | Model: 500V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1746, '12000950', 'MOTOR,SERVO', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 230V | Brand: 24VA | Model: L5VZU,WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1747, '12000952', 'JUNCTION BOX', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ABS | Brand: 170MM | Model: 200MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1748, '12000996', 'FILTER,AIR CLEANER', 23, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MOTOR/GENERATOR | Brand: 2X15M', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1749, '12001000', 'FLOODLIGHT', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LED | Model: 50W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1750, '12001007', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: 220-240V | Model: BA9S', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1751, '12001008', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: 220-240V | Model: BA9S', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1752, '12001015', 'CABLE,COMPENSATING', 12, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3/0.9MM | Brand: 0.28OHM | Model: E35', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1753, '12001016', 'FLOODLIGHT', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LED | Model: 150W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1754, '12001023', 'BATTERY WATER', 4, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DISTILLED | Brand: BLUE CAP | Model: 20L/CAN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1755, '12001028', 'STRAP,TIEDOWN,CABLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4.8MM | Brand: 500MM | Model: NYLON 66', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1756, '12001031', 'MOTOR,ENG STARTER', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1115540763/0 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1757, '12001250', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 1P | Model: 6A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1758, '12001251', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 1P | Model: 10A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1759, '12001252', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 1P | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1760, '12001253', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 2P | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1761, '12001254', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 3P | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1762, '12001300', 'CURRENT COLLECTOR SKN 4/40', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CURRENT COLLECTOR SKN 4/40', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1763, '12001301', 'CURRENT COLLECTOR KSW 4/40-1 HS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CURRENT COLLECTOR KSW 4/40-1 HS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1764, '12001360', 'WIRE,ELEC', 61, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1.10MM | Brand: CU | Model: 2.50KV', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1765, '12001431', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCCB | Brand: 3P | Model: 160A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1766, '12001432', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCCB | Brand: 3P | Model: 100A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1767, '12001434', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCCB | Brand: 3P | Model: 80A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1768, '12001436', 'PUSH BUTTON', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND HD | Brand: GRN | Model: 22MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1769, '12001437', 'PUSH BUTTON', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND HD | Brand: RED | Model: 22MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL);
INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `satuan_id`, `stok_minimum`, `stok_maksimum`, `stok_tersedia`, `harga_satuan`, `lokasi_penyimpanan`, `kondisi_fisik`, `foto_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1770, '12001458', 'LAMP,FLUORESCENT', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 18-20W | Brand: 220-230V | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1771, '12001459', 'LAMP,FLUORESCENT', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 36-40W | Brand: 220-230V | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1772, '12001462', 'LAMP,TFORCE', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MIX | Brand: HB HV ND | Model: 55W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1773, '12001465', 'LAMP,MERCURY', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 250W | Brand: 220V | Model: E40', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1774, '12001466', 'LAMP,MERCURY', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 400W | Brand: 220V | Model: E40', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1775, '12001469', 'LAMPHOLDER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: 220-250V | Model: E27', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1776, '12001470', 'LAMPHOLDER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ROUND | Brand: 220-250V | Model: E40', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1777, '12001473', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CH STRIP | Brand: 1 X TL 18-20W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1778, '12001474', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CH STRIP | Brand: 1 X TL 36-40W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1779, '12001488', 'LIGHT,INDICATOR', 34, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: GRN | Model: 240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1780, '12001495', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 48V | Brand: 12A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1781, '12001502', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220V | Brand: 18A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1782, '12001504', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 380V | Brand: 18A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1783, '12001505', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220V | Brand: 25A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1784, '12001506', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 380V | Brand: 25A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1785, '12001507', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220V | Brand: 32A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1786, '12001508', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 380V | Brand: 32A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1787, '12001514', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220V | Brand: 65A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1788, '12001519', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 380V | Brand: 95A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1789, '12001528', 'CONTACT ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AUX | Brand: 690VAC | Model: 10A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1790, '12001531', 'CONTACT ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 690VAC | Brand: 10A | Model: 1NO+1NC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1791, '12001532', 'CONTACT ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 690VAC | Brand: 10A | Model: 1NO+1NC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1792, '12001534', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 1-1.6A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1793, '12001535', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 1.6-2.5A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1794, '12001537', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 4-6A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1795, '12001540', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 9-13A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1796, '12001541', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 12-18A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1797, '12001543', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 23-32A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1798, '12001545', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 30-40A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1799, '12001546', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 37-50A | Model: 690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1800, '12001548', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 63-80A | Model: 1000V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1801, '12001560', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 55-70A | Model: 1000V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1802, '12001561', 'RELAY,THERMAL', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O/L | Brand: 57-225A | Model: 1000V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1803, '12001570', 'LIGHT,INDICATOR', 34, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: RED | Model: 240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1804, '12001571', 'LIGHT,INDICATOR', 34, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: ORG | Model: 240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1805, '12001572', 'LIGHT,INDICATOR', 34, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: RED | Model: 240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1806, '12001573', 'LIGHT,INDICATOR', 34, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PILOT | Brand: ORG | Model: 240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1807, '12001595', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: RD | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1808, '12001620', 'CONTACTOR', 17, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220V | Brand: 95A | Model: 220-690V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1809, '12001637', 'CIRCUIT BREAKER BOX', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1M | Brand: OB', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1810, '12001638', 'CIRCUIT BREAKER BOX', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2M | Brand: OB', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1811, '12001642', 'STARTER,MOTOR', 53, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ENCL | Brand: 3PH | Model: 3P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1812, '12001696', 'FIXTURE,LIGHT', 25, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SPOT LIGHT | Brand: 1 X HID 400 | Model: E40', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1813, '12001700', 'HANGER,PLASTIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIRE | Brand: 100MM | Model: 10-20MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1814, '12001701', 'CONNECTOR ASSY', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WELD | Brand: MALE | Model: 500A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1815, '12001720', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WT069C | Brand: 1XTLED | Model: BARE L600GM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1816, '12001724', 'FIXTURE,LIGHT', 25, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CH STRIP | Brand: 1 X TL 14.5W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1817, '12001726', 'LAMP,COREPRO', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TL LED TUBE | Brand: 15.5W | Model: G13', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1818, '12001727', 'LAMP,FLUOR', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TL | Brand: 8W | Model: 220-240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1819, '12001728', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T-SHAPE | Brand: 55W | Model: 100-277V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1820, '12001732', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T-SHAPE | Brand: 40W | Model: 220-240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1821, '12001733', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T-SHAPE | Brand: 30W | Model: 220-240V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1822, '12001734', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CLASSIC | Brand: 14.5W | Model: 230V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1823, '12001736', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CLASSIC | Brand: 10.5W | Model: 230V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1824, '12001737', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CLASSIC | Brand: 8W | Model: 230V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1825, '12001738', 'FLOODLIGHT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LED | Model: 100W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1826, '12001739', 'LAMP,LED', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T-SHAPE | Brand: 160-200W | Model: 110-277V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1827, '12001753', 'FLOODLIGHT', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: LED | Model: 300W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1828, '12001783', 'SWITCH,ROTARY', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SFT2031 | Brand: 1 POLE | Model: FORT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1829, '12001798', 'TERMINAL,BLOCK', 56, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FEED THROUGH | Brand: PT 2.5MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1830, '12001806', 'CHARGER,BATTERY', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STARTER | Brand: 12/24V | Model: 60-650A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1831, '12001822', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 3P | Model: 63A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1832, '12001841', 'CONNECTOR,PLUG', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWER | Brand: RD | Model: 2P', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1833, '12001842', 'CONNECTOR', 16, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOCKET OUTLET | Brand: RD | Model: 16A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1834, '12001872', 'SWITCH,PROX', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INDUCT | Brand: 8-15MM | Model: M30X1.5', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1835, '12001873', 'SWITCH,PROX', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INDUCT | Brand: 4MM | Model: CABLE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1836, '12001874', 'SWITCH,LIMIT', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: XCKJ-H29-ZCKE09-ZCKY71', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1837, '12001875', 'SWITCH,LIMIT', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: XCKJ-H29-ZCKE05-ZCKY41', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1838, '12001876', 'SWITCH,LIMIT', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: XCKJ-H29-ZCKE05-ZCKY43', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1839, '12001877', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12VDC | Brand: 250VAC/28VDC | Model: 6A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1840, '12001878', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12VDC | Brand: 250VAC/28VDC | Model: 15A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1841, '12001879', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220/240VAC | Brand: 250VAC/125VDC | Model: 5A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1842, '12001880', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12VDC | Brand: 250VAC/28VDC | Model: 15A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1843, '12001881', 'SWITCH,PRESS', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0-10KG/CM2 | Brand: 1/4IN | Model: SAGINOMIYA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1844, '12001882', 'RELAY', 44, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 220VAC | Brand: 250VAC/DC | Model: 10A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1845, '12001899', 'CIRCUIT BREAKER', 15, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MCB | Brand: 3P | Model: 63A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1846, '12001906', 'COMPENSATTING CABLE,THERMOCOUPLE; TYPE R', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'COMPENSATTING CABLE,THERMOCOUPLE; TYPE R', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1847, '12001908', 'FAN WHEEL,BURNER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1848, '12001911', 'TRANSFORMER,IGNITION', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1849, '12001912', 'OIL PUMP,BURNER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 21600 | Brand: OLYMPIA | Model: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1850, '12001913', 'MOTOR,ELECTRO', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1851, '12001914', 'CONTROL,BURNER', 18, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1852, '12001915', 'GAUGE,OLI,PRESS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0-20KG/CM2 | Brand: OM-2N | Model: OLYMPIA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1853, '12001916', 'VALVE,SOLENOID', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2202815906 | Brand: OM-2N | Model: DV318', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1854, '12001917', 'DIFFUSER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1855, '12001919', 'ELECTRODE,IGNITION', 22, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1856, '12001920', 'PIPE ASSY,FEED SUPPORT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1857, '12001921', 'CABLE,ELECTRODE', 12, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1858, '12001922', 'CAPACITOR,DRYER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12礔 | Brand: OLYMPIA | Model: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1859, '12001923', 'STRAINER,OIL FILTER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1860, '12001924', 'HOSE,FLEXIBLE', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1861, '12001925', 'NOZZLE,OIL BURNER', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OLYMPIA | Brand: OM-2N', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1862, '12001926', 'CABLE,THERMOCOUPLE', 12, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: K | Brand: 2X7MM | Model: 100M', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1863, '12001927', 'LIMIT SWITCH;OMRON;WLCA 12-2N,2A', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'LIMIT SWITCH;OMRON;WLCA 12-2N,2A', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1864, '12001928', 'SENSOR,PHOTOCELL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10A | Brand: ASO2203 | Model: LUMINA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1865, '12001929', 'CONTROL,TEMP', 18, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIGITAL | Brand: E5CCRX3A5M000 | Model: OMRON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1866, '12001930', 'VARIABLE FRQ DRIVE/INVERTER 5.5KW;VEICHI', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'VARIABLE FRQ DRIVE/INVERTER 5.5KW;VEICHI', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1867, '12001932', 'VARIABLE FRQ DRIVE/INVERTER 1.5KW;VEICHI', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'VARIABLE FRQ DRIVE/INVERTER 1.5KW;VEICHI', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1868, '12001933', 'LEAD WIRE', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TIN STR TC | Brand: 20AWG | Model: BELDEN 9867', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1869, '12001934', 'MOTOR,AC', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JIG-HARZ | Brand: JVT-MBS-R400 | Model: SPEECON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1870, '12001935', 'BRUSH,ROLLER', 11, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HTS | Brand: 25X1000X1600MM | Model: VILTWOOL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1871, '12001936', 'HEATING ELEMENT', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIRE | Brand: 0.5MM | Model: KANTHAL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1872, '12001939', 'INSULATION,EBONITE,SHEET', 31, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1000X2000X6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1873, '12001940', 'POTENTIOMETER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: MOD534-11 | Brand: 10K | Model: OHM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1874, '12001941', 'SWITCH,ROTARY', 54, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2P | Brand: 20A | Model: SFT20-2-1 SA16', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1875, '12001942', 'HORN ECE;ELECTRICAL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12VDC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1876, '12001944', 'LAMP;AUTO', 33, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULB-S25 | Brand: 12V | Model: 25/6W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1877, '12001945', 'LAMP;AUTO', 33, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULB-S25 | Brand: 24V | Model: 25/10W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1878, '12001946', 'LAMP;AUTO', 33, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULB-S25 | Brand: 12V | Model: 25W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1879, '12001947', 'LAMP;AUTO', 33, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULB-S25 | Brand: 24V | Model: 25W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1880, '12001948', 'LAMP;AUTO', 33, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULB-G18S | Brand: 12V | Model: 8W', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1881, '12001949', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HALOGEN | Brand: 55W | Model: 12V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1882, '12001950', 'LAMP,INCAND', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HALOGEN | Brand: 70W | Model: 24V', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1883, '12001954', 'BACK BUZZER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1280V 107DB | Brand: HKT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1884, '12001955', 'LAMP,ROTARY', 32, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LED COLOR AMBER | Brand: 12V-24V | Model: WL27', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1885, '12001998', 'COMPRESSOR UNIT,RECIPRO', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PK100300A | Brand: PUMA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1886, '12002009', 'HORN ECE;ELECTRICAL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 24VDC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1887, '12002018', 'METER,PH', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AG30BA001PHT21 | Brand: FU20 | Model: YOKOGAWA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1888, '12002019', 'SUBMERSIBLE,PUMP', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JSB | Brand: 750W | Model: 380VA', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1889, '13000052', 'ROPE,WIRE', 46, 5, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 100M | Brand: 7MM | Model: 19X7 IWRC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1890, '13000220', 'LINER,WEAR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P623/2 | Brand: LINATEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1891, '13000225', 'ROPE,WIRE', 46, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500M | Brand: 50MM | Model: 6X55 WS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1892, '13000227', 'CASING,PUMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/1 | Brand: LINATEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1893, '13000230', 'LINER,WEAR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/2 | Brand: LINATEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1894, '13000233', 'IMPELLER,PUMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/6E | Brand: LINATEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1895, '13000349', 'VALVE,BALL', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2IN | Brand: SOCKET | Model: 150PSI', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1896, '13000441', 'RING,INNER CLAMP', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.4.33.26.43.0-IT.1-3', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1897, '13000511', 'GLAND,SLEEVE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P625/17 | Brand: LINATEX', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1898, '13000772', 'COUPLING HALF', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.5.18.26.04.0-IT.75-76', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1899, '13001142', 'CYCLONE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.84-AB-9-A1-IT.4 | Brand: LOCAL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1900, '13001143', 'CYCLONE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.84-AB-9-IT.3 | Brand: LOCAL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1901, '13001159', 'WIRE FABRIC', 61, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLAT TOP | Brand: 3X10 | Model: 1210MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1902, '13001160', 'WIRE FABRIC', 61, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLAT TOP | Brand: 4X10 | Model: 1210MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1903, '13001680', 'SHAFT,DRIVE STATION', 50, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TSL-AUSMELT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1904, '13001681', 'SHAFT,DRIVE STATION', 50, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AF200 | Brand: AUTOTEC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1905, '13001682', 'SHAFT,DRIVE STATION', 50, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AV200 | Brand: AUTOTEC', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1906, '14000012', 'SACK', 47, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WOVEN | Brand: 32X55CM | Model: 1 PLY', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1907, '14000015', 'BEAKER,LAB', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: GRIFFIN | Brand: 2000ML | Model: BOROSIL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1908, '14000019', 'BEAKER,LAB', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: GRIFFIN | Brand: 250ML | Model: BOROSIL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1909, '14000024', 'PAPER,FILTER', 62, 1, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: QUAN | Brand: GRADE 42 | Model: 2.5UM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1910, '14000026', 'SUSPENSION ASSEMBLY, SAFETY HELMET', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, NULL, 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1911, '14000040', 'CRUCIBLE,LABORATORY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 50ML | Brand: 45MM | Model: NICKEL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1912, '14000046', 'FLASK,VOLUMETRIC', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLAT | Brand: 100ML | Model: BOROSIL GLS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1913, '14000048', 'CYLINDER,GRADUATED', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1914, '14000050', 'GLOVES,MENS', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WORK | Brand: LEATHER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1915, '14000074', 'PIPETTE,MEASURING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10ML | Brand: BOROSILICATE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1916, '14000077', 'CRUCIBLE,LABORATORY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 55ML | Brand: 1.75MM | Model: ZIRCNIUM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1917, '14000081', 'ASBESTOS SHEET', 2, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 5.5MM | Brand: 1000MM | Model: 1000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1918, '14000084', 'CLAMP,RING,INNER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.3.17.26-18-IT.1-3', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1919, '14000086', 'PLUG', 43, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DWG.8.45.16-39-IT.3', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1920, '14000101', 'CYLINDER,GRADUATED', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 100ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1921, '14000102', 'CYLINDER,GRADUATED', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1922, '14000103', 'FLASK,ERLENMEYER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 250ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1923, '14000105', 'PIPETTE,MEASURING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 5ML | Brand: BOROSILICATE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1924, '14000106', 'MOTOR,PNEUMATIC', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 190CFM | Brand: 4IN | Model: 112600-4', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1925, '14000112', 'THERMOCOUPLE', 57, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE-K | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1926, '14000116', 'THERMOCOUPLE,ELEMENT', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P130L-2001-4280', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1927, '14000117', 'THERMOCOUPLE', 57, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE-K | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1928, '14000122', 'CUTTER,STRAIGHT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: T-16865 | Brand: SMEG', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1929, '14000124', 'DRILL, TWIST', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE KM CAT | Brand: NO.5097=2-1/2R', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1930, '14000126', 'THERMOCOUPLE,ELEMENT', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KENT | Brand: P251-1317-M17', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1931, '14000130', 'HOSE,OIL', 29, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 491078 | Brand: WEISHAUPT | Model: M5Z', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1932, '14000133', 'VALVE,SOLENOID', 59, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 122A2351 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1933, '14000135', 'ELECTODE,IGNITION', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 212-163-1020-7 | Brand: L5VZU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1934, '14000137', 'HEAD,COMBUSTION', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 11151214127 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1935, '14000138', 'NOZZLE', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WEISHAUPT | Brand: L5VZU | Model: BURNER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1936, '14000140', 'NOZZLE', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WEISHAUPT | Brand: L5VZU | Model: BURNER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1937, '14000141', 'MOTOR,CONTROL', 36, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600177 | Brand: WEISHAUPT | Model: L5VZU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1938, '14000145', 'CONTROL STATION,PENDANT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LAC1025 | Brand: L5VZU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1939, '14000146', 'PHOTO RESISTANCE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600562 | Brand: WEISHAUPT | Model: L5VZU', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1940, '14000148', 'WHEEL,BLOWER', 60, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1115520808/2 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1941, '14000152', 'DIFFUSER ASSY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 115121407/2 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1942, '14000155', 'THERMOCOUPLE,ELEMENT', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KENT | Brand: P253-1317-M17', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1943, '14000168', 'ELECTRODE,IGNITION', 22, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WE-243-0180 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1944, '14000169', 'ELECTRODE,IGNITION', 22, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WE-395-0500 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1945, '14000170', 'TONGS,LABORATORY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CRUCIBLE | Brand: 12IN | Model: STEEL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1946, '14000176', 'CABLE ASSY,POWER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WEISHAUPT | Brand: L5VZU | Model: BURNER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1947, '14000177', 'HEAD,NOZZLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 243.0170 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1948, '14000179', 'HEAD,NOZZLE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 21216310012 | Brand: WEISHAUPT | Model: MS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1949, '14000184', 'FILTER,BAG', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DUST COLLECTOR | Brand: BAG FILTER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1950, '14000206', 'WATCH GLASS,LAB', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HD RIM | Brand: 125MM | Model: GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1951, '14000210', 'BEAKER,LABORATORY', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H/D | Brand: 600ML | Model: BOROSIL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1952, '14000213', 'CYLINDER,GRADUATED', 20, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 250ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1953, '14000219', 'HELMET,SFTY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: ALL SIZE | Model: WHT,VISITOR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1954, '14000220', 'GOGGLES', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SFTY GLASS | Brand: DIRECT VENT | Model: CLR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1955, '14000240', 'CUTTER,CONE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: OVEN', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1956, '14000241', 'FLASK,ERLENMEYER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500ML | Brand: BOROSIL GLASS', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1957, '14000243', 'BELT,FLAT', 7, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4PLY | Brand: 600MM | Model: 8.2MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1958, '14000254', 'COUPLING,HOSE', 19, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WEISHAUPT | Brand: L5VZU | Model: BURNER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1959, '14000255', 'HEAVY DUTY BACK SUPPORT BELT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'HEAVY DUTY BACK SUPPORT BELT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1960, '14000256', 'VISOR,FACESHIELD', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 250MM | Brand: 400MM | Model: POLYCARB', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1961, '14000276', 'CONTROL,TEMP', 18, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DIGITAL | Brand: E5CCRX3A5M000 | Model: OMRON', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1962, '14000296', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE K | Brand: 20MM | Model: PS05-FU001-TT81', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1963, '14000298', 'THERMOCOUPLE', 57, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE K | Brand: 3065MM | Model: PS05-FU001-TT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1964, '14000299', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE R | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1965, '14000300', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE R | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1966, '14000301', 'BEAKER,LAB', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H/D | Brand: 1000ML | Model: BOROSIL', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1967, '14000353', 'RESPIRATOR,AIR FILT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DISPOSABLE | Brand: MG001 FFP', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1968, '14000431', 'GLOVES,LEATHER', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DOUBLE | Brand: PALM | Model: 0.3MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1969, '14000481', 'PUMP,OIL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 601.152 | Brand: WEISHAUPT', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1970, '14000490', 'HARNESS,SAFETY', 62, 18, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DBL LANYARD | Brand: 44.5MM | Model: PES', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1971, '14000540', 'WIRE FABRIC', 61, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FLAT TOP | Brand: 3X10 | Model: 1490MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1972, '14000541', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE B | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1973, '14000542', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TYPE R | Brand: UNGROUND | Model: 6MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1974, '14000551', 'SLEEVE,WELDER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEAT RESISTANT | Brand: LEATHER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1975, '14000560', 'ASBESTOS SHEET', 2, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6MM | Brand: 1000MM | Model: 1000MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1976, '14000600', 'FILTER,CLOTH', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DUST COLLECTOR | Brand: 160MMX2450MM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1977, '14000610', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.39 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1978, '14000611', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.40 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1979, '14000612', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.41 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1980, '14000613', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.42 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1981, '14000614', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.43 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1982, '14000615', 'EXTINGUISHER,FIRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PORTABLE | Brand: 3KG | Model: POWDER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1983, '14000616', 'EXTINGUISHER,FIRE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PORTABLE | Brand: 6KG | Model: POWDER', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1984, '14000618', 'TOWEL,PAPER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1PLY | Brand: 31X34.5CM | Model: 70GSM', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1985, '14000620', 'ADHESIVE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SEALANT | Brand: LIQUID | Model: 250GR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1986, '14000621', 'HELMET,SAFETY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: WHT | Model: ALLSIZE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1987, '14000622', 'HELMET,SAFETY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: BLU | Model: ALLSIZE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1988, '14000623', 'HELMET,SAFETY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: YLW | Model: ALLSIZE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1989, '14000624', 'HELMET,SAFETY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: RED | Model: ALLSIZE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1990, '14000625', 'HELMET,SAFETY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: ORG | Model: ALLSIZE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1991, '14000626', 'GOGGLES', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WELD | Brand: VENTED | Model: DARK-REPLACE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1992, '14000627', 'SPECTACLES', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SAFETY | Brand: PC | Model: CLEAR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1993, '14000628', 'HEAD,HARNESS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HELMET | Brand: HXHG43 | Model: PROTECTOR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1994, '14000629', 'SPECTACLES', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SAFETY | Brand: PC | Model: BLACK', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1995, '14000630', 'LENS,WELDERS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CLEAR | Brand: AS/NZS 1338.1', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1996, '14000631', 'LENS,WELDERS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INFRARED | Brand: AS/NZS 1338.1 | Model: NR10', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1997, '14000632', 'LENS,WELDERS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INFRARED | Brand: AS/NZS 1338.1 | Model: NR11', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1998, '14000633', 'RESPIRATOR,AIR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KN95 | Brand: EN149:2001 | Model: WHITE', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(1999, '14000636', 'CARTRIDGE,RESPIRATOR', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RC69 | Brand: PROTECTOR', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(2000, '14000637', 'PLUG,EAR', 43, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DISPOSABLE | Brand: CYL | Model: 33dB', 1, '2025-11-29 04:20:34', '2025-11-29 04:20:34', NULL),
(2001, '14000638', 'PLUG,EAR', 43, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REUSEABLE | Brand: CYL | Model: 22.5dB', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2002, '14000639', 'APRON,WELDERS', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STD | Brand: 24IN | Model: 42IN', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2003, '14000640', 'DOTTING GLOVES', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'DOTTING GLOVES', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2004, '14000641', 'WELDING GLOVE', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BLUE | Brand: DOUBLE LAYERS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2005, '14000642', 'REUSABLE CHEMICAL GLOVES', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NITRILE | Brand: SIZE 9', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2006, '14000643', 'CARTRIDGE,RESPIRATOR', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3M 3303K-100', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2007, '14000644', 'APRON,WELDERS', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SLEEVE | Brand: ALL SIZE | Model: COWHIDE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2008, '14000645', 'SHOES,SAFETY', 51, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.38 | Brand: ANTI-SLIP | Model: SNI 7079', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2009, '14000649', 'RAIN-COATS;', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'RAIN-COATS;', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2010, '14000652', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.39 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2011, '14000653', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.38 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2012, '14000654', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.40 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2013, '14000655', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.41 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2014, '14000656', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.42 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2015, '14000657', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.43 | Brand: PVC | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2016, '14000662', 'SAFETY GLOVE SAFEGUARD GL111', 62, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'SAFETY GLOVE SAFEGUARD GL111', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2017, '14000663', 'LIFE VEST', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: JACKET | Brand: UNIVERSAL | Model: PVC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2018, '14000664', 'RING BUOY,LIFE', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POLYETHYLENE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2019, '14000670', 'VISOR,HOLDER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ASSEMBLY | Brand: HELMET | Model: AL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2020, '14000691', 'HELMET,WELDERS', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CAP ATTACH | Brand: FR | Model: SHADE 10/11', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2021, '14000700', 'FIRE EXTINGUISHER 1KG; FOR CAR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'FIRE EXTINGUISHER 1KG; FOR CAR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL);
INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori_id`, `satuan_id`, `stok_minimum`, `stok_maksimum`, `stok_tersedia`, `harga_satuan`, `lokasi_penyimpanan`, `kondisi_fisik`, `foto_barang`, `keterangan`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2022, '14000711', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.38 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2023, '14000712', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.39 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2024, '14000713', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.40 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2025, '14000714', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.41 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2026, '14000715', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.42 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2027, '14000716', 'BOOTS,SAFETY', 9, 13, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NO.43 | Brand: LEATHER | Model: STL TOE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2028, '14000740', 'CHINSTRAP, HELMET; PROTECTOR', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'CHINSTRAP, HELMET; PROTECTOR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2029, '14000750', 'RESPIRATOR,AIR FILT;REUSEABLE;3M 1200', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'RESPIRATOR,AIR FILT;REUSEABLE;3M 1200', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2030, '14000751', 'CARTRIDGE,RESPIRATOR', 13, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3311K55 | Brand: 3M', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2031, '14000752', 'FILTER,PARTICULATE', 23, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P2 | Brand: 3M 1744', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2032, '14000753', 'HOLDER,FILTER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SGL | Brand: USE WITH 3M 1744', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2033, '14000781', 'RAIN COAT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ANSI 107-2004 | Brand: CLASS 3 | Model: SIZE M', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2034, '14000782', 'BACK SUPPORT BELT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ES 1-1/4IN | Brand: SIZE M', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2035, '14000783', 'BACK SUPPORT BELT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ES 1-1/4IN | Brand: SIZE L', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2036, '14000792', 'RAIN COAT', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ANSI 107-2004 | Brand: CLASS 3 | Model: SIZE XL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2037, '14000795', 'HELMET,SFTY', 27, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: FR BRIM | Brand: ALL SIZE | Model: RED,VISITOR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2038, '14000796', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: K | Brand: 1/2IN | Model: 855MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2039, '14000801', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: K | Brand: 1/2IN | Model: 950MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2040, '14000802', 'THERMOCOUPLE', 57, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: K | Brand: 300MM | Model: SS316L', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2041, '20000006', 'LUBRICATING OIL,ENG', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 209L | Brand: 95 VISC | Model: SAE 40', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2042, '20000030', 'OXYGEN,TECHNICAL', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: O2 | Brand: INDUSTRIAL | Model: 99.6%', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2043, '20000034', 'LUBE OIL,HYD', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 209L | Brand: ISO 68 | Model: TURALIK 52', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2044, '20000035', 'GREASE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SOLEX-808,180KG | Brand: NLG1.2 | Model: 110CST', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2045, '20000051', 'ACETYLENE', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C2H2 | Brand: 99.6% | Model: UHP-AAS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2046, '20000058', 'ACETYLENE', 62, 6, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C2H2 | Brand: 99.6% | Model: INSTR-AAS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2047, '20000054', 'OXYGEN, TECHNICAL', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UKR  @ 70 LITER', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2048, '20000055', 'BUTANE-PROPANE MIX', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LPG | Brand: 50KG/CYL | Model: REFILL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2049, '20000056', 'ARGON,TECH', 62, 6, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: AR | Brand: 99.999% | Model: UHP', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2050, '20000059', 'CALIBRATING GAS,MIX', 62, 6, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: P-10 | Brand: NUCLEAR COUNTER', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2051, '20000071', 'NITROUS OXIDE', 62, 6, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: N2O | Brand: 99% | Model: GAS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2052, '20000162', 'GREASE,EXTRM', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 178KG/DR | Brand: NLGI 2 | Model: SUPER HDX-2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2053, '20000182', 'NITROGEN,TECHNICAL', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: N2 | Brand: UHP | Model: >99%', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2054, '20000190', 'GAS,CALIBRATION;700 PPM SO2;10L;AUSMELT', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'GAS,CALIBRATION;700 PPM SO2;10L;AUSMELT', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2055, '20000191', 'GAS,CALIBRATION;450 PPM SO2;10L;AUSMELT', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'GAS,CALIBRATION;450 PPM SO2;10L;AUSMELT', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2056, '20000192', 'NITROGEN,TECHNICAL', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: N2 | Brand: UHP | Model: 99.999%', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2057, '20000201', 'DETECTOR,GAS', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CO | Brand: 6D | Model: 103L', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2058, '20000202', 'DETECTOR,GAS', 62, 2, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500PSI | Brand: C011944 | Model: 8AL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2059, '30000003', 'ROPE,WIRE', 46, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500M | Brand: 25MM | Model: 6X21 FI', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2060, '30000006', 'ROPE,WIRE', 46, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 500M | Brand: 10MM | Model: 6X19 IWRC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2061, '30000007', 'RUBBER SHEET', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1000MM | Brand: 10000MM | Model: 3MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2062, '30000008', 'RUBBER SHEET', 62, 12, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1000MM | Brand: 10000MM | Model: 6MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2063, '30000011', 'HOOK, SCREW', 62, 16, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: \"1/2 X 8\"\" X 2-1/2\"\" X 1/2\"\"', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2064, '30000022', 'GRATING,MTL', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PLAIN | Brand: 813X2035MM | Model: CS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2065, '30000023', 'PLATE', 42, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: STAIR | Brand: 215MM | Model: 750MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2066, '30000028', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: IN-ACTIVE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2067, '30000029', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 100MM | Model: 50MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2068, '30000033', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 150MM | Model: 75MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2069, '30000034', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 200MM | Model: 80MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2070, '30000044', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 70MM | Brand: 70MM | Model: 7MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2071, '30000048', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 75MM | Brand: 75MM | Model: 8MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2072, '30000050', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INP | Brand: 200MM | Model: 90MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2073, '30000054', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 50MM | Brand: 50MM | Model: 6MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2074, '30000055', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 80MM | Brand: 80MM | Model: 8MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2075, '30000057', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 100MM | Brand: 100MM | Model: 10MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2076, '30000071', 'CALCIUM HYDROXIDE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CA(OH)2 | Brand: POWDER | Model: 16KG', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2077, '30000072', 'CALCIUM HYPOCHLORITE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CA(ClO)2 | Brand: 60% Cl2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2078, '30000075', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.2MM | Brand: 350MM | Model: A5.1-E6013', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2079, '30000076', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 16MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2080, '30000082', 'HYDROCHLORIC ACID', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HCL | Brand: LIQUID | Model: 2.5L/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2081, '30000086', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 180MM | Model: ST60.2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2082, '30000092', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 200MM | Model: DIN 17100 GR ST60.2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2083, '30000093', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: 41MM | Model: DIN 17100 GR ST37.2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2084, '30000096', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HEX | Brand: 32MM | Model: DIN 17100 GR ST37.2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2085, '30000102', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 80MM | Model: ST52.3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2086, '30000108', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 90MM | Model: AISI 4337/4340/1.6582', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2087, '30000109', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 25MM | Model: ST52.3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2088, '30000112', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 40MM | Model: ST52.3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2089, '30000115', 'SHEET,METAL', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.2MM | Brand: 1220MM | Model: 2440MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2090, '30000116', 'NITRIC ACID', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HNO3 | Brand: LIQUID | Model: 2.5L/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2091, '30000122', 'POTASSIUM IODATE', 62, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KIO3 | Brand: SOLID', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2092, '30000123', 'POTASSIUM IODIDE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KI | Brand: SOLID | Model: 1KG/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2093, '30000127', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: 75X6MM | Model: ST37.2', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2094, '30000132', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RECT | Brand: 100X9MM | Model: JIS G3112', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2095, '30000142', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 10MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2096, '30000144', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 19MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2097, '30000145', 'SODIUM CARBONATE', 62, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NA2CO3 | Brand: POWDER | Model: 5KG/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2098, '30000146', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 22MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2099, '30000147', 'HYDROGEN PEROXIDE', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H2O2 | Brand: 30% | Model: 1L/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2100, '30000148', 'SODIUM CARBONATE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NA2CO3 | Brand: POWDER | Model: 50KG/SACK', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2101, '30000153', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: CS | Model: 65MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2102, '30000157', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 60MM | Model: ST52.3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2103, '30000158', 'TAPE,MEASURING', 55, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: LEVER LOCK | Brand: 5M', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2104, '30000159', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 50MM | Model: JIS G3112', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2105, '30000163', 'SODIUM HYDROXIDE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NAOH | Brand: 99% | Model: PELLETS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2106, '30000176', 'ETHANOL,ABSOLUTE', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: C2H5OH | Brand: LIQUID', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2107, '30000182', 'RUBBER SHEET', 62, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3000MM | Brand: 10000MM | Model: 10MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2108, '30000187', 'POTASSIUM HYDROXIDE', 62, 9, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KOH | Brand: PELLETS | Model: 1KG/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2109, '30000191', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 12MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2110, '30000193', 'ALUMINIUM POTASS SULPH', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: KAL(SO4)2.12H2O', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2111, '30000211', 'BORIC ACID', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H3BO3 | Brand: SOLID | Model: 1KG/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2112, '30000215', 'CALCIUM CARBONATE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CACO3 | Brand: MARBLE | Model: 5KG/BOTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2113, '30000219', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 40MM | Brand: 40MM | Model: 4MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2114, '30000220', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 60MM | Brand: 60MM | Model: 6MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2115, '30000221', 'ANGLE', 1, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 65MM | Brand: 65MM | Model: 6MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2116, '30000222', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 250MM | Model: 90MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2117, '30000230', 'SHEET,METAL', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4.5MM | Brand: 1524MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2118, '30000235', 'BAR', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 75MM | Model: ST52.3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2119, '30000240', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 380MM | Model: 100MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2120, '30000242', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H-SECT | Brand: 150MM | Model: 150MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2121, '30000244', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: REINF | Brand: 25MM | Model: AISI 1045/C45/S45C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2122, '30000260', 'PLATE', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BORDES | Brand: 6MM | Model: 4FT', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2123, '30000268', 'HYDROCHLORIC ACID', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: HCL | Brand: LIQUID | Model: 2.5L/BTL', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2124, '30000269', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H-SECT | Brand: 200MM | Model: 200MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2125, '30000270', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: H-SECT | Brand: 250MM | Model: 250MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2126, '30000273', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIDE FLG | Brand: 400MM | Model: 200MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2127, '30000278', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4MM | Brand: 400MM | Model: A5.1-E7018', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2128, '30000279', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 5MM | Brand: 400MM | Model: A5.1-E7018', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2129, '30000281', 'ELECTRODE,WELD', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4MM | Brand: AWS A5.4 E307-16', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2130, '30000284', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIDE FLG | Brand: 200MM | Model: 100MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2131, '30000285', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIDE FLG | Brand: 300MM | Model: 150MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2132, '30000286', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6MM | Brand: 1600MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2133, '30000288', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 100MM | Model: JIS G4303-SUS304', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2134, '30000310', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4MM | Brand: 400MM | Model: A5.1-E6013', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2135, '30000311', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALUM | Brand: 230X114X76MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2136, '30000315', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NETTLE A1 | Brand: 458X229X114MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2137, '30000316', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 229X171X64/38MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2138, '30000317', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: 229X171X64/68MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2139, '30000318', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DURAX LC-170/1B-A', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2140, '30000319', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DURAX LC-170/1B-B', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2141, '30000320', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DURAX LC-170/1B-C', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2142, '30000321', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DURAX LC-170/1B-D', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2143, '30000322', 'BRICK,ARCH', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK-36 | Brand: 448X229X190/97MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2144, '30000323', 'BRICK,ARCH', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK-36 | Brand: 448X229X187/126MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2145, '30000324', 'BRICK,ARCH', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK-36 | Brand: 448X229X192/14MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2146, '30000325', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 458X230X230/135MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2147, '30000327', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 230X76X57MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2148, '30000328', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: ALUMINA | Model: 230X114X26', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2149, '30000329', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 230X114X38MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2150, '30000330', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: ALUMINA | Model: 230X114X64', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2151, '30000331', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 300X150X76/70MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2152, '30000332', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 300X152X114/108MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2153, '30000333', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 300X230X76/70MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2154, '30000335', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36-2A | Brand: ALUMINA', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2155, '30000337', 'MORTAR,REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: TEMP | Brand: 1750CELSIUS', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2156, '30000339', 'MORTAR, REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWDER | Brand: CEMENT FONDU', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2157, '30000340', 'MORTAR,REFRACTORY', 35, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 1700DEG C | Brand: 20% AL2O3', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2158, '30000341', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: ALUMINA | Model: 230X114X76', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2159, '30000344', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: 356X229X51MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2160, '30000345', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: ALUMINA | Model: 229X203X51', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2161, '30000346', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: 229X152X51MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2162, '30000349', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 584X305X152MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2163, '30000350', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: ALUM | Model: 460X355X152MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2164, '30000351', 'BRICK, REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 914MMX610MMX458MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2165, '30000352', 'CASTABLE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: POWDER | Brand: CAJ-15', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2166, '30000355', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALUM | Brand: 458X114X114MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2167, '30000357', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 330X152X76/71MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2168, '30000358', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: 300X150X76/65MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2169, '30000359', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK36 | Brand: HIGH ALUMINA', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2170, '30000360', 'CHALK,MARKING', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: METAL | Brand: WHITE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2171, '30000361', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: 254X214X102/170MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2172, '30000365', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SK34 | Brand: 230X230X78/68MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2173, '30000366', 'BRICK,INSUL,HIGH TEMP', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B-1 | Brand: 230X114X76MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2174, '30000368', 'BRICK,STRAIGHT', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALUM | Brand: 356X114X114MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2175, '30000369', 'BRICK,INSUL,HIGH TEMP', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: B-1 | Brand: 300X240X64X100', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2176, '30000376', 'BRUSH,PAINT', 11, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DBL & EXTRA | Brand: BLK/WHT | Model: WOOD', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2177, '30000377', 'BRUSH,PAINT', 11, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DBL & EXTRA | Brand: BLK/WHT | Model: WOOD', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2178, '30000378', 'BRUSH,PAINT', 11, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DBL & EXTRA | Brand: BLK/WHT | Model: WOOD', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2179, '30000379', 'BRUSH,PAINT', 11, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: DBL & EXTRA | Brand: BLK/WHT | Model: WOOD', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2180, '30000390', 'SHOVEL,HAND', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: SQ | Brand: 305X250X1.6MM | Model: 1060MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2181, '30000398', 'PAINT,HEAT RESIST', 39, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 600DEG C | Brand: ALUM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2182, '30000401', 'CALCIUM HYDROXIDE', 62, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CA(OH)2 | Brand: 50% | Model: POWDER', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2183, '30000403', 'ROLLER,PAINT', 45, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10IN | Brand: POLYESTER', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2184, '30000404', 'PAINT,HEAT,RESISTANT', 39, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 300C | Brand: GREY | Model: ALUMINIUM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2185, '30000480', 'PLASTIC SHEET', 62, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 50M | Brand: 1370MM | Model: 0.15MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2186, '30000516', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2187, '30000517', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2188, '30000518', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2189, '30000519', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2190, '30000521', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2191, '30000523', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 19MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2192, '30000524', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 22MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2193, '30000525', 'PLATE,METAL', 42, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 25MM | Brand: 1829MM | Model: 6096MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2194, '30000655', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.50-16 | Brand: 14PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2195, '30000658', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8.25-15 | Brand: 14PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2196, '30000660', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 17.5-25 | Brand: 12PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2197, '30000661', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10.00-20 | Brand: 16PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2198, '30000662', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 11.00-20 | Brand: 16PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2199, '30000663', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9.00-20 | Brand: 14PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2200, '30000664', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6.50-10 | Brand: 10PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2201, '30000665', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.00-12 | Brand: 12PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2202, '30000666', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2.50-15 | Brand: 16PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2203, '30000667', 'TYRE,SOLID', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8.25-15 | Brand: 14PR | Model: RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2204, '30000668', 'TYRE,SOLID', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.00-12 | Brand: 12PR | Model: RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2205, '30000669', 'TYRE,SOLID', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2.50-15 | Brand: 16PR | Model: RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2206, '30000670', 'TYRE,SOLID', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6.50-10 | Brand: 10PR | Model: RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2207, '30000672', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2.50-15 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2208, '30000673', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8.25-15 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2209, '30000674', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.00-12 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2210, '30000675', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 6.50-10 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2211, '30000677', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 7.50-16 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2212, '30000679', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 9.00-20 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2213, '30000680', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 10.00-20 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2214, '30000682', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 11.00-20 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2215, '30000684', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 17.5-25 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2216, '30000687', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 28X9-15 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2217, '30000688', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 28X9-15 | Brand: 12PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2218, '30000689', 'TYRE,SOLID', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.00-15 | Brand: 16PR | Model: RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2219, '30000690', 'PLATE,METAL', 42, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 12MM | Brand: 1500MM | Model: 6000MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2220, '30000718', 'THINNER', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: NC | Brand: TYPE-A | Model: 5L/CAN', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2221, '30000720', 'THINNER', 62, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: PU | Brand: 5L/CAN', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2222, '30000739', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 140MM | Model: AISI 4337/4340/1.6582', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2223, '30000770', 'BEAM', 5, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: WIDE FLG | Brand: 150MM | Model: 75MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2224, '30000783', 'BRICK,REFRACTORY', 10, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: CUPOLA | Brand: 225X75X184/164MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2225, '30000790', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: YELLOW', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2226, '30000826', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.2MM | Brand: 350MM | Model: A5.1ENIFEC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2227, '30000827', 'ELECTRODE,WELDING', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.2MM | Brand: 350MM | Model: A5.15ENICI', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2228, '30000835', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALKYD TOP | Brand: RESIN | Model: YELLOW', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2229, '30000836', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ALKYD TOP | Brand: RESIN | Model: BLACK', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2230, '30000837', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: LEAF GREEN', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2231, '30000838', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: TRAFIC RED', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2232, '30000839', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: TRAFIC BLU', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2233, '30000840', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: BLACK', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2234, '30000841', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: TRAFIC GRY', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2235, '30000842', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: TRAFIC WHT', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2236, '30000843', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: GENTIAN BLU', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2237, '30000844', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 2K | Brand: ALIPHATIC PU | Model: LIGHT GREY', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2238, '30000845', 'PAINT,FINISH', 39, 11, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ZINC PRIMER | Brand: RESIN | Model: GREY', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2239, '30000861', 'TYRE,PNEUMATIC', 58, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.00-15 | Brand: 18PR | Model: RBR-NYLON', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2240, '30000863', 'INNER TUBE,PNEU TYRE', 30, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.00-15 | Brand: BUTYL RBR', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2241, '30000864', 'ANODE,CORROSION PREV', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: ZN | Brand: 20KG', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2242, '30000940', 'BAR,METAL', 3, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RD | Brand: 16MM | Model: SCM 440/AISI 4140', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2243, '30000950', 'PLATE', 42, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 16MM | Brand: 1500MM | Model: 3000MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2244, '30000971', 'PLATE,METAL', 42, 17, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 8MM | Brand: 1500MM | Model: 6000MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2245, '30001002', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 80MM | Model: 45MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2246, '30001003', 'CHANNEL', 14, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: UNP | Brand: 120MM | Model: 55MM', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2247, '30001020', 'COVER,PAINT ROLLER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: FOAM | Model: WHITE', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2248, '30001022', 'FRAME,PAINT ROLLER', 62, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 4IN | Brand: 60CM | Model: PLASTIC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2249, '30001050', 'ELECTRODE,WELD', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 3.2MM | Brand: AWS A5.4 E308L-16', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2250, '30001150', 'NOZZLE,TAPHOLE', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: BULLION | Brand: GRAPHITE | Model: 1300DEGC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2251, '30001151', 'NOZZLE,TAPHOLE', 37, 14, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: INSERT | Brand: GRAPHITE | Model: 1300DEGC', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2252, '30001319', 'PAINT,FINISH', 39, 4, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: RUST BULLET | Brand: 18,9KG', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2253, '30001332', 'ELECTRODE,WELDING;3,2MM;350MM;SS 253 MA', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'ELECTRODE,WELDING;3,2MM;350MM;SS 253 MA', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2254, '30001333', 'ELECTRODE,WELDING;4MM;450MM;SS 253 MA', 22, 10, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'ELECTRODE,WELDING;4MM;450MM;SS 253 MA', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL),
(2255, '63000085', 'PLASTIC SHEET', 62, 15, 10, 1000, 0, 0.00, 'Gudang Utama', 'baik', NULL, 'Part Number: 0.03MM | Brand: PP', 1, '2025-11-29 04:20:51', '2025-11-29 04:20:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `kode_kategori`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KAT-001', 'ANGLE', 'Kategori ANGLE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(2, 'KAT-002', 'ASBESTOS', 'Kategori ASBESTOS', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(3, 'KAT-003', 'BAR', 'Kategori BAR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(4, 'KAT-004', 'BATTERY', 'Kategori BATTERY', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(5, 'KAT-005', 'BEAM', 'Kategori BEAM', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(6, 'KAT-006', 'BEARING', 'Kategori BEARING', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(7, 'KAT-007', 'BELT', 'Kategori BELT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(8, 'KAT-008', 'BOLT', 'Kategori BOLT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(9, 'KAT-009', 'BOOTS', 'Kategori BOOTS', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(10, 'KAT-010', 'BRICK', 'Kategori BRICK', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(11, 'KAT-011', 'BRUSH', 'Kategori BRUSH', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(12, 'KAT-012', 'CABLE', 'Kategori CABLE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(13, 'KAT-013', 'CARTRIDGE', 'Kategori CARTRIDGE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(14, 'KAT-014', 'CHANNEL', 'Kategori CHANNEL', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(15, 'KAT-015', 'CIRCUIT', 'Kategori CIRCUIT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(16, 'KAT-016', 'CONNECTOR', 'Kategori CONNECTOR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(17, 'KAT-017', 'CONTACTOR', 'Kategori CONTACTOR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(18, 'KAT-018', 'CONTROL', 'Kategori CONTROL', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(19, 'KAT-019', 'COUPLING', 'Kategori COUPLING', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(20, 'KAT-020', 'CYLINDER', 'Kategori CYLINDER', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(21, 'KAT-021', 'ELBOW', 'Kategori ELBOW', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(22, 'KAT-022', 'ELECTRODE', 'Kategori ELECTRODE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(23, 'KAT-023', 'FILTER', 'Kategori FILTER', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(24, 'KAT-024', 'FILTER ELEMENT', 'Kategori FILTER ELEMENT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(25, 'KAT-025', 'FIXTURE', 'Kategori FIXTURE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(26, 'KAT-026', 'FUSE', 'Kategori FUSE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(27, 'KAT-027', 'HELMET', 'Kategori HELMET', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(28, 'KAT-028', 'HOIST', 'Kategori HOIST', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(29, 'KAT-029', 'HOSE', 'Kategori HOSE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(30, 'KAT-030', 'INNER TUBE', 'Kategori INNER TUBE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(31, 'KAT-031', 'INSULATION', 'Kategori INSULATION', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(32, 'KAT-032', 'LAMP', 'Kategori LAMP', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(33, 'KAT-033', 'LAMP;AUTO', 'Kategori LAMP;AUTO', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(34, 'KAT-034', 'LIGHT', 'Kategori LIGHT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(35, 'KAT-035', 'MORTAR', 'Kategori MORTAR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(36, 'KAT-036', 'MOTOR', 'Kategori MOTOR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(37, 'KAT-037', 'NOZZLE', 'Kategori NOZZLE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(38, 'KAT-038', 'PACKING', 'Kategori PACKING', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(39, 'KAT-039', 'PAINT', 'Kategori PAINT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(40, 'KAT-040', 'PIN', 'Kategori PIN', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(41, 'KAT-041', 'PIPE', 'Kategori PIPE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(42, 'KAT-042', 'PLATE', 'Kategori PLATE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(43, 'KAT-043', 'PLUG', 'Kategori PLUG', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(44, 'KAT-044', 'RELAY', 'Kategori RELAY', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(45, 'KAT-045', 'ROLLER', 'Kategori ROLLER', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(46, 'KAT-046', 'ROPE', 'Kategori ROPE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(47, 'KAT-047', 'SACK', 'Kategori SACK', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(48, 'KAT-048', 'SEAL', 'Kategori SEAL', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(49, 'KAT-049', 'SEPARATOR', 'Kategori SEPARATOR', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(50, 'KAT-050', 'SHAFT', 'Kategori SHAFT', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(51, 'KAT-051', 'SHOES', 'Kategori SHOES', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(52, 'KAT-052', 'SPROCKET', 'Kategori SPROCKET', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(53, 'KAT-053', 'STARTER', 'Kategori STARTER', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(54, 'KAT-054', 'SWITCH', 'Kategori SWITCH', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(55, 'KAT-055', 'TAPE', 'Kategori TAPE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(56, 'KAT-056', 'TERMINAL', 'Kategori TERMINAL', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(57, 'KAT-057', 'THERMOCOUPLE', 'Kategori THERMOCOUPLE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(58, 'KAT-058', 'TYRE', 'Kategori TYRE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(59, 'KAT-059', 'VALVE', 'Kategori VALVE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(60, 'KAT-060', 'WHEEL', 'Kategori WHEEL', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(61, 'KAT-061', 'WIRE', 'Kategori WIRE', '2025-11-29 04:14:00', '2025-11-29 04:14:00', NULL),
(62, 'KAT-999', 'LAIN-LAIN', 'Kategori Umum Lainnya', '2025-11-29 04:14:19', '2025-11-29 04:14:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_laporan` varchar(50) NOT NULL,
  `jenis_laporan` enum('harian','mingguan','bulanan','tahunan','custom') NOT NULL,
  `judul_laporan` varchar(200) NOT NULL,
  `periode_awal` date NOT NULL,
  `periode_akhir` date NOT NULL,
  `isi_laporan` longtext,
  `file_laporan` varchar(255) DEFAULT NULL,
  `status_laporan` enum('draft','menunggu_verifikasi','diverifikasi','ditolak','final') DEFAULT 'draft',
  `dibuat_oleh` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemeliharaan_barang`
--

CREATE TABLE `pemeliharaan_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('baik','rusak','habis','diperbaiki') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'baik',
  `tanggal` date NOT NULL,
  `biaya` decimal(15,2) DEFAULT '0.00',
  `petugas_id` bigint UNSIGNED NOT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemeliharaan_barang_detaill`
--

CREATE TABLE `pemeliharaan_barang_detaill` (
  `id` bigint UNSIGNED NOT NULL,
  `pemeliharaan_id` bigint UNSIGNED DEFAULT NULL,
  `barang_id` bigint UNSIGNED DEFAULT NULL,
  `jml` int DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pencatatan_barang`
--

CREATE TABLE `pencatatan_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jenis` enum('masuk','keluar') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal` date NOT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `sumber_barang` varchar(200) DEFAULT NULL,
  `tujuan_barang` varchar(200) DEFAULT NULL,
  `no_dokumen` varchar(100) DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pencatatan_barang_detail`
--

CREATE TABLE `pencatatan_barang_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `pencatatan_id` bigint UNSIGNED DEFAULT NULL,
  `barang_id` bigint UNSIGNED DEFAULT NULL,
  `kondisi` enum('baik','rusak','diperbaiki') DEFAULT NULL,
  `jml` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_barang`
--

CREATE TABLE `permintaan_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `alasan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('diajukan','menunggu_persetujuan','disetujui','ditolak','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'diajukan',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `tanggal_approval` timestamp NULL DEFAULT NULL,
  `catatan_approval` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_barang_detail`
--

CREATE TABLE `permintaan_barang_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `permintaan_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `jml` int NOT NULL,
  `jml_approval` int DEFAULT '0',
  `catatan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_satuan` varchar(50) NOT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `nama_satuan`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'BOX', 'Box/Kotak', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(2, 'BT', 'Botol/Bottle', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(3, 'BTG', 'Batang', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(4, 'CAN', 'Kaleng/Can', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(5, 'COI', 'Coil', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(6, 'CYL', 'Cylinder/Tabung', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(7, 'DR', 'Drum', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(8, 'EA', 'Each/Buah', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(9, 'G', 'Gram', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(10, 'KG', 'Kilogram', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(11, 'L', 'Liter', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(12, 'M', 'Meter', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(13, 'PAA', 'Pasang', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(14, 'PC', 'Pieces/Unit', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(15, 'ROL', 'Roll/Gulungan', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(16, 'SET', 'Set/Paket', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(17, 'SHT', 'Sheet/Lembar', '2025-11-29 04:14:09', '2025-11-29 04:14:09'),
(18, 'UNT', 'Unit', '2025-11-29 04:14:09', '2025-11-29 04:14:09');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FYkEB3m0LlSouZ048qiCPMZkZSayaVIzaJZCXQrh', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUWZZRlZyUHhDcXhzNEhsdGFBTWdQUTVuU1duQnpmOVYxWHNzQ2p0eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2dpc3Rpay50ZXN0L2dlbmVyYXRlLWtleSI7czo1OiJyb3V0ZSI7czoxMjoiZ2VuZXJhdGUua2V5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MTp7aTowO3M6Njoic3RhdHVzIjt9czozOiJuZXciO2E6MDp7fX1zOjY6InN0YXR1cyI7czozOToiQXBwbGljYXRpb24ga2V5IGdlbmVyYXRlZCBzdWNjZXNzZnVsbHkuIjt9', 1764409911),
('tzRV0W2s00CQXY11xJrCc0tj1ErmxOAuzn5fitMQ', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaUhhRTNEcmtCVVBjSmYwNzVhM1oxMkNBZFB4YTN4VkdET3QxUm5ZQyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9naXN0aWsudGVzdC9zYXR1YW4iO3M6NToicm91dGUiO3M6MTI6InNhdHVhbi5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1764390109),
('w4sgRwFse8NToLi6ftnb5afmf7xRbVxKQQbr5w0N', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUFTa3pXT3J6MEN3eW1vUW5pZ3AxaG5Ib1JsMms4U0VWVlQ1Y2ttSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9sb2dpc3Rpay50ZXN0IjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764409915),
('Zi0f8smfPRNC4dOhpV3uxOdkYos07PTdnvqj9bXV', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGE4ZHAzRzdXVHpZaTJpOUpFVGtHc0lyZmxPZkJZY3d5WjJjT1p0ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2dpc3Rpay50ZXN0L2dlbmVyYXRlLWtleSI7czo1OiJyb3V0ZSI7czoxMjoiZ2VuZXJhdGUua2V5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MTp7aTowO3M6Njoic3RhdHVzIjt9czozOiJuZXciO2E6MDp7fX1zOjY6InN0YXR1cyI7czozOToiQXBwbGljYXRpb24ga2V5IGdlbmVyYXRlZCBzdWNjZXNzZnVsbHkuIjt9', 1764409915);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(150) NOT NULL,
  `alamat` text,
  `no_telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kontak_person` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `no_telepon`, `email`, `kontak_person`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sad', 'sad', 'sadasd', '21214', 'sad@gmail.com', 'sad', 1, '2025-11-18 15:11:09', '2025-11-18 20:39:54', '2025-11-18 20:39:54'),
(2, 'SUPP-01', 'Supplier 1', 'sad', 'SAD', 'SA@gmail.com', 'asdkd', 1, '2025-11-24 21:13:11', '2025-11-24 21:13:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '2025-11-16 08:34:56', '$2y$12$06z0Y9FQb/x84mmThZZy/./1iq4cI9vyRaI2g0awQQ8zDbh6Yq1/C', 'DjDVotjp16f6sktS28keZYP9AsdSVGXr1PbJXhLbdAA6h0F2cl2iINAbJ4Ok', '2025-11-16 08:34:56', '2025-11-16 08:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi_laporan`
--

CREATE TABLE `verifikasi_laporan` (
  `id` bigint UNSIGNED NOT NULL,
  `laporan_id` bigint UNSIGNED NOT NULL,
  `verifikator_id` bigint UNSIGNED NOT NULL,
  `status_verifikasi` enum('valid','perlu_revisi') NOT NULL,
  `catatan_verifikasi` text,
  `tanggal_verifikasi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`),
  ADD KEY `idx_kode` (`kode_barang`),
  ADD KEY `idx_nama` (`nama_barang`),
  ADD KEY `idx_kategori` (`kategori_id`),
  ADD KEY `barang_ibfk_2` (`satuan_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_kategori` (`kode_kategori`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_laporan` (`kode_laporan`),
  ADD KEY `dibuat_oleh` (`dibuat_oleh`),
  ADD KEY `idx_kode` (`kode_laporan`),
  ADD KEY `idx_jenis` (`jenis_laporan`),
  ADD KEY `idx_status` (`status_laporan`),
  ADD KEY `idx_periode` (`periode_awal`,`periode_akhir`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pemeliharaan_barang`
--
ALTER TABLE `pemeliharaan_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pemeliharaan` (`kode`),
  ADD KEY `idx_kode` (`kode`),
  ADD KEY `idx_tanggal` (`tanggal`),
  ADD KEY `pemeliharaan_barang_ibfk_2` (`petugas_id`);

--
-- Indexes for table `pemeliharaan_barang_detaill`
--
ALTER TABLE `pemeliharaan_barang_detaill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemeliharaan_barang_detail_ibfk_1` (`pemeliharaan_id`),
  ADD KEY `pemeliharaan_barang_detail_ibfk_2` (`barang_id`);

--
-- Indexes for table `pencatatan_barang`
--
ALTER TABLE `pencatatan_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_transaksi` (`kode`),
  ADD KEY `idx_kode` (`kode`),
  ADD KEY `idx_tanggal` (`tanggal`),
  ADD KEY `idx_jenis` (`jenis`),
  ADD KEY `pencatatan_barang_ibfk_2` (`supplier_id`),
  ADD KEY `pencatatan_barang_ibfk_3` (`user_id`);

--
-- Indexes for table `pencatatan_barang_detail`
--
ALTER TABLE `pencatatan_barang_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pencatatan_barang_detail_ibfk_1` (`pencatatan_id`),
  ADD KEY `pencatatan_barang_detail_ibfk_2` (`barang_id`);

--
-- Indexes for table `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_permintaan` (`kode`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `idx_kode` (`kode`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_tanggal` (`tanggal`);

--
-- Indexes for table `permintaan_barang_detail`
--
ALTER TABLE `permintaan_barang_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permintaan_id` (`permintaan_id`),
  ADD KEY `permintaan_barang_detail_ibfk_2` (`barang_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_satuan` (`nama_satuan`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_supplier` (`kode_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `verifikasi_laporan`
--
ALTER TABLE `verifikasi_laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporan_id` (`laporan_id`),
  ADD KEY `verifikator_id` (`verifikator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2257;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pemeliharaan_barang`
--
ALTER TABLE `pemeliharaan_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemeliharaan_barang_detaill`
--
ALTER TABLE `pemeliharaan_barang_detaill`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pencatatan_barang`
--
ALTER TABLE `pencatatan_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pencatatan_barang_detail`
--
ALTER TABLE `pencatatan_barang_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permintaan_barang_detail`
--
ALTER TABLE `permintaan_barang_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verifikasi_laporan`
--
ALTER TABLE `verifikasi_laporan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`dibuat_oleh`) REFERENCES `users` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `pemeliharaan_barang`
--
ALTER TABLE `pemeliharaan_barang`
  ADD CONSTRAINT `pemeliharaan_barang_ibfk_2` FOREIGN KEY (`petugas_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `pemeliharaan_barang_detaill`
--
ALTER TABLE `pemeliharaan_barang_detaill`
  ADD CONSTRAINT `pemeliharaan_barang_detail_ibfk_1` FOREIGN KEY (`pemeliharaan_id`) REFERENCES `pemeliharaan_barang` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `pemeliharaan_barang_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `pencatatan_barang`
--
ALTER TABLE `pencatatan_barang`
  ADD CONSTRAINT `pencatatan_barang_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `pencatatan_barang_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `pencatatan_barang_detail`
--
ALTER TABLE `pencatatan_barang_detail`
  ADD CONSTRAINT `pencatatan_barang_detail_ibfk_1` FOREIGN KEY (`pencatatan_id`) REFERENCES `pencatatan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pencatatan_barang_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD CONSTRAINT `permintaan_barang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `permintaan_barang_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `permintaan_barang_detail`
--
ALTER TABLE `permintaan_barang_detail`
  ADD CONSTRAINT `permintaan_barang_detail_ibfk_1` FOREIGN KEY (`permintaan_id`) REFERENCES `permintaan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permintaan_barang_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `verifikasi_laporan`
--
ALTER TABLE `verifikasi_laporan`
  ADD CONSTRAINT `verifikasi_laporan_ibfk_1` FOREIGN KEY (`laporan_id`) REFERENCES `laporan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `verifikasi_laporan_ibfk_2` FOREIGN KEY (`verifikator_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
