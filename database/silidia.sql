-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 07:50 PM
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
  `id_sub_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_validasi` enum('proses','tervalidasi','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proses',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `id_user`, `id_sub_kategori`, `nama_dokumen`, `deskripsi`, `file_path`, `status_validasi`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(2, 3, 5, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', 'tervalidasi', '2022-12-05 08:23:49', '2025-06-24 17:48:37'),
(3, 5, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(4, 6, 7, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', 'proses', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(5, 7, 3, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(6, 8, 6, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(7, 3, 4, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', 'ditolak', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(8, 3, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', 'ditolak', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(9, 3, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', 'ditolak', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(10, 3, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(11, 3, 6, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(12, 3, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(13, 5, 5, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(14, 4, 3, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(15, 3, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(16, 4, 2, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(17, 5, 6, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(18, 4, 5, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(19, 3, 4, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(20, 4, 3, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(21, 3, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(22, 3, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(23, 3, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(24, 3, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', 'proses', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(25, 9, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban untuk kegiatan pelatihan manajemen yang dilaksanakan pada tanggal 15-16 September 2024, mencakup biaya penginapan, transportasi, dan konsumsi peserta.', 'file.pdf', 'tervalidasi', '2023-12-05 08:23:49', '2025-06-24 17:48:37'),
(26, 10, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(27, 9, 2, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', 'tervalidasi', '2022-12-05 08:23:49', '2025-06-24 17:48:37'),
(28, 11, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(29, 12, 1, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', 'proses', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(30, 13, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(31, 14, 2, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(32, 9, 3, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(33, 9, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(34, 9, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(35, 9, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(36, 9, 3, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(37, 9, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(38, 11, 1, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(39, 12, 1, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(40, 9, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(41, 10, 1, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(42, 10, 1, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(43, 10, 1, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(44, 9, 1, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(45, 10, 1, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(46, 9, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(47, 9, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(48, 9, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', 'tervalidasi', '2025-06-24 17:48:37', '2025-06-24 17:48:37'),
(49, 9, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', 'proses', '2025-06-24 17:48:37', '2025-06-24 17:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `kode_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`, `keterangan_kategori`) VALUES
(1, 'KTGR7755', 'Perencanaan', 'Dokumen rencana program dan kegiatan'),
(2, 'KTGR4853', 'Keuangan', 'Dokumen pengelolaan anggaran dan transaksi'),
(3, 'KTGR7608', 'Pelaporan', 'Dokumen laporan hasil kegiatan organisasi'),
(4, 'KTGR9740', 'Kepegawaian', 'Dokumen data dan manajemen pegawai'),
(5, 'KTGR2543', 'SPJ', 'Surat Pertanggungjawaban berbagai kegiatan');

-- --------------------------------------------------------

--
-- Table structure for table `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id_sub_kategori` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_sub_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_sub_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_kategori`
--

INSERT INTO `sub_kategori` (`id_sub_kategori`, `id_kategori`, `nama_sub_kategori`, `keterangan_sub_kategori`) VALUES
(1, 1, 'Rencana Kegiatan', 'Dokumen terkait rencana detail kegiatan yang direncanakan.'),
(2, 1, 'Jadwal Pelaksanaan', 'Dokumen jadwal pelaksanaan program atau kegiatan.'),
(3, 2, 'Laporan Anggaran', 'Dokumen laporan penggunaan anggaran kegiatan/program.'),
(4, 2, 'Bukti Transaksi', 'Dokumen bukti transaksi keuangan, seperti kwitansi.'),
(5, 3, 'Laporan Tahunan', 'Dokumen laporan tahunan organisasi atau kegiatan.'),
(6, 3, 'Laporan Bulanan', 'Dokumen laporan bulanan hasil kegiatan.'),
(7, 4, 'Data Pegawai', 'Dokumen yang berisi data identitas dan jabatan pegawai.'),
(8, 4, 'Absensi', 'Dokumen absensi pegawai selama periode tertentu.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `last_login_attempt` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role`, `sub_role`, `login_attempts`, `last_login_attempt`, `created_at`, `updated_at`) VALUES
(1, 'admin wonoasih', 'admin_wonoasih', '$2y$12$y16hjqB/PW3uZF0VBEBeuO5gpjEq59P4TnRufB3B.iaS/a3beVe1e', 'admin', 'admin', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(2, 'wakil admin wonoasih', 'wamin_wonoasih', '$2y$12$k1pgqAFGhT.5gwNvkUA4tuvmAMRkGX/CsRLgk7vOfuW5P/WS6ds3a', 'validator', 'validator', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(3, 'seksi trantib', 'seksi_trantib', '$2y$12$u5ifvsmS2ALPdShMPoWCu.O14icsQ1t0ZdDrSAQJhcxI0hcGgnjeO', 'kecamatan', 'seksi trantib', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(4, 'seksi pemmas', 'seksi_pemmas', '$2y$12$bMb2bLQrMKjFDoiIWjeigePhOcuxuka.GrR4PF4DVbVFMDiKnC1gO', 'kecamatan', 'seksi pemmas', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(5, 'seksi pemerintahan', 'seksi_pemerintahan', '$2y$12$8nyRqpojNlpgSB5I503TVubs8eH0fSZ7QdDKSMwi7HiRUnbkAxQ7y', 'kecamatan', 'seksi pemerintahan', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(6, 'seksi pelayanan', 'seksi_pelayanan', '$2y$12$dtM/nPMpJ7ptNzixs4XIn.cnCGjWxhfF3ze2sIOiNQRyzLkQ6yk9.', 'kecamatan', 'seksi pelayanan', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(7, 'subbag tata usaha', 'tata_usaha', '$2y$12$5xYSPZ4JRvlVcaI6Aug4COsYQOvtWu1JiNXgtOduMCFNSIXPYfWY6', 'kecamatan', 'subbag tata usaha', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(8, 'subbag program keuangan', 'program_keuangan', '$2y$12$SE2Z01NvK1p45/UTmRxBD.5u16xdmSaTl2Q/7DF0YN3uscWQ2.596', 'kecamatan', 'subbag prog. keuangan', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(9, 'user wonoasih', 'kel_wonoasih', '$2y$12$WqbkDge4ku1DxfK7CGhwFuAQbWsb3gDGVGtoneqmddGhQeHqhwovW', 'kelurahan', 'wonoasih', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(10, 'user jrebengkidul', 'kel_jrebengkidul', '$2y$12$CnSy7vt9Mx5dWwzUdjigBOajsVkiONJc/05Pr55rIiXpEtvZerdeC', 'kelurahan', 'jrebengkidul', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(11, 'user pakistaji', 'kel_pakistaji', '$2y$12$n408M8Zp8pSiLzZxO.Ed1OFRE/Kb1iDc3HOG/V1kgFVTkEvQ7MHPa', 'kelurahan', 'pakistaji', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(12, 'user kedunggaleng', 'kel_kedunggaleng', '$2y$12$pHsrpWGrrzYR1L8Poq/lSuudiOFvb4VG/zJni.ubjVCPVNG0WzeLu', 'kelurahan', 'kedunggaleng', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(13, 'user kedungasem', 'kel_kedungasem', '$2y$12$6CPDDn8Gy4q/c7Fk4jql2e/GZjlC6P6Qa64O92AK0qlZFVo4zCnk.', 'kelurahan', 'kedungasem', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36'),
(14, 'user sumbertaman', 'kel_sumbertaman', '$2y$12$2OZ9tt61e8cm5mgqIxu9Te9N7h2xrGrBEob.iz0nhvuZXdAlGth8S', 'kelurahan', 'sumbertaman', 0, NULL, '2025-06-24 17:48:36', '2025-06-24 17:48:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `arsip_id_user_foreign` (`id_user`),
  ADD KEY `arsip_id_sub_kategori_foreign` (`id_sub_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_kode_kategori_unique` (`kode_kategori`);

--
-- Indexes for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD KEY `sub_kategori_id_kategori_foreign` (`id_kategori`);

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
  MODIFY `id_arsip` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id_sub_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `arsip_id_sub_kategori_foreign` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kategori` (`id_sub_kategori`),
  ADD CONSTRAINT `arsip_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `sub_kategori_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
