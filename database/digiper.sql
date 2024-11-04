-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 05:50 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digiper`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip`
--

CREATE TABLE `arsip` (
  `id_arsip` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_validasi` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `id_user`, `nama_dokumen`, `deskripsi`, `file_path`, `status_validasi`, `created_at`, `updated_at`) VALUES
(1, 2, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban untuk kegiatan pelatihan manajemen yang dilaksanakan pada tanggal 15-16 September 2024, mencakup biaya penginapan, transportasi, dan konsumsi peserta.', 'SPJ_Kegiatan_Seminar.pdf', 0, '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(2, 2, 'SPJ Proyek Pembangunan RuangKelas', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'SPJ_Pengeluaran_BulanJanuari.pdf', 1, '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(3, 2, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'SPJ_Proyek_PembangunanA_2023.xlsx', 0, '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(4, 3, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'SPJ_Tahun2024_001.pdf.docx', 1, '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(5, 3, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'SPJ_Transportasi_Meeting_April.docx', 0, '2024-11-04 04:38:56', '2024-11-04 04:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_log` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_arsip` bigint(20) UNSIGNED NOT NULL,
  `aktivitas` enum('view','edit','delete','download') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, 'digiper', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','wonoasih','jrebengkidul','pakistaji','kedunggaleng','kedungasem','sumbertaman') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'user admin', 'admin_kecamatan', 'admin', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(2, 'user Wonoasih', 'kel_wonoasih', 'wonoasih', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(3, 'user Jrebeng Kidul', 'kel_jrebengkidul', 'jrebengkidul', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(4, 'user Pakistaji', 'kel_pakistaji', 'pakistaji', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(5, 'user Kedunggaleng', 'kel_kedunggaleng', 'kedunggaleng', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(6, 'user Kedungasem', 'kel_kedungasem', 'kedungasem', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56'),
(7, 'user Sumbertaman', 'kel_sumbertaman', 'sumbertaman', '$2y$10$79yTdGnUKQ6kmpyCJcQVf.deXusPzyjXp9b73DPOoamS1NmgT4CfG', '2024-11-04 04:38:56', '2024-11-04 04:38:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `arsip_id_user_foreign` (`id_user`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `log_aktivitas_id_user_foreign` (`id_user`),
  ADD KEY `log_aktivitas_id_arsip_foreign` (`id_arsip`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id_arsip` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id_log` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `arsip_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_id_arsip_foreign` FOREIGN KEY (`id_arsip`) REFERENCES `arsip` (`id_arsip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_aktivitas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
