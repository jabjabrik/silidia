-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 09:39 AM
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
-- Database: `silidia`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip`
--

CREATE TABLE `arsip` (
  `id_arsip` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `arsip` (`id_arsip`, `id_user`, `id_kategori`, `nama_dokumen`, `deskripsi`, `file_path`, `status_validasi`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban untuk kegiatan pelatihan manajemen yang dilaksanakan pada tanggal 15-16 September 2024, mencakup biaya penginapan, transportasi, dan konsumsi peserta.', 'file.pdf', 1, '2023-12-05 08:23:49', '2024-12-05 08:30:42'),
(2, 4, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(3, 3, 2, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', 1, '2022-12-05 08:23:49', '2024-12-05 08:30:42'),
(4, 5, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(5, 6, 1, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', 0, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(6, 7, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(7, 8, 2, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(8, 3, 3, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(9, 3, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(10, 3, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(11, 3, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(12, 3, 3, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(13, 3, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(14, 1, 1, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(15, 2, 1, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(16, 3, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(17, 4, 1, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(18, 1, 1, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(19, 2, 1, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(20, 3, 1, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(21, 4, 1, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(22, 3, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(23, 3, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(24, 3, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', 1, '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(25, 3, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', 0, '2024-12-05 08:30:42', '2024-12-05 08:30:42');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Perencanaan', 'Dokumen rencana program dan kegiatan', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(2, 'Keuangan', 'Dokumen pengelolaan anggaran dan transaksi', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(3, 'Pelaporan', 'Dokumen laporan hasil kegiatan organisasi', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(4, 'Kepegawaian', 'Dokumen data dan manajemen pegawai', '2024-12-05 08:30:42', '2024-12-05 08:30:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','validator','wonoasih','jrebengkidul','pakistaji','kedunggaleng','kedungasem','sumbertaman') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin wonoasih', 'admin_wonoasih', 'admin', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(2, 'wakil admin wonasih', 'wamin_wonoasih', 'validator', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(3, 'user wonoasih', 'kel_wonoasih', 'wonoasih', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(4, 'user jrebengkidul', 'kel_jrebengkidul', 'jrebengkidul', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(5, 'user pakistaji', 'kel_pakistaji', 'pakistaji', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(6, 'user kedunggaleng', 'kel_kedunggaleng', 'kedunggaleng', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(7, 'user kedungasem', 'kel_kedungasem', 'kedungasem', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42'),
(8, 'user sumbertaman', 'kel_sumbertaman', 'sumbertaman', '$2y$10$kVIrvx5nLsfcKpMzpvo2ae/g9Hd4w.MNyIkiAblRI3vyijYU48s.u', '2024-12-05 08:30:42', '2024-12-05 08:30:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `arsip_id_user_foreign` (`id_user`),
  ADD KEY `arsip_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

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
  MODIFY `id_arsip` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `arsip_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `arsip_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
