-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 05:04 PM
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
  `kode_arsip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_sub_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_retensi` date DEFAULT NULL,
  `status_retensi` enum('permanen','musnah') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_validasi` enum('proses','tervalidasi','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proses',
  `pesan_penolakan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `kode_arsip`, `id_user`, `id_sub_kategori`, `nama_dokumen`, `deskripsi`, `file_path`, `tanggal_retensi`, `status_retensi`, `status_validasi`, `pesan_penolakan`, `created_at`, `updated_at`) VALUES
(1, '0130', 3, 4, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(2, '0157', 3, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(3, '0177', 3, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(4, '0511', 3, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(5, '0934', 3, 6, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(6, '0786', 3, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(7, '0124', 3, 4, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(8, '0787', 3, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(9, '0027', 4, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', '2025-04-13', 'permanen', 'tervalidasi', NULL, '2023-04-13 15:03:25', '2025-07-13 15:03:25'),
(10, '0215', 4, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', '2025-04-13', 'permanen', 'tervalidasi', NULL, '2023-04-13 15:03:25', '2025-07-13 15:03:25'),
(11, '0745', 4, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', '2025-05-13', 'musnah', 'tervalidasi', NULL, '2023-05-13 15:03:25', '2025-07-13 15:03:25'),
(12, '0123', 4, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', '2025-05-13', 'musnah', 'tervalidasi', NULL, '2023-05-13 15:03:25', '2025-07-13 15:03:25'),
(13, '0214', 4, 2, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', '2025-05-13', 'musnah', 'tervalidasi', NULL, '2023-05-13 15:03:25', '2025-07-13 15:03:25'),
(14, '0136', 4, 6, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', '2025-05-13', 'musnah', 'tervalidasi', NULL, '2023-05-13 15:03:25', '2025-07-13 15:03:25'),
(15, '0063', 4, 5, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', '2025-06-13', 'musnah', 'tervalidasi', NULL, '2023-06-13 15:03:25', '2025-07-13 15:03:25'),
(16, '0286', 4, 3, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', '2025-06-13', 'musnah', 'tervalidasi', NULL, '2023-06-13 15:03:25', '2025-07-13 15:03:25'),
(17, '0215', 5, 5, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', '2025-08-13', 'musnah', 'tervalidasi', NULL, '2023-08-13 15:03:25', '2025-07-13 15:03:25'),
(18, '0755', 5, 3, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', '2025-08-13', 'permanen', 'tervalidasi', NULL, '2023-08-13 15:03:25', '2025-07-13 15:03:25'),
(19, '0475', 5, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(20, '0586', 5, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(21, '0705', 6, 5, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(22, '0949', 6, 7, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(23, '0586', 7, 3, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(24, '0251', 8, 6, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(25, '0641', 9, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban untuk kegiatan pelatihan manajemen yang dilaksanakan pada tanggal 15-16 September 2024, mencakup biaya penginapan, transportasi, dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2023-12-05 08:23:49', '2025-07-13 15:03:25'),
(26, '0789', 10, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(27, '0231', 9, 2, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2022-12-05 08:23:49', '2025-07-13 15:03:25'),
(28, '0313', 11, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(29, '0342', 12, 1, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(30, '0740', 13, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(31, '0640', 14, 2, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(32, '0374', 9, 3, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(33, '0011', 9, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(34, '0374', 9, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(35, '0760', 9, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(36, '0203', 9, 3, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(37, '0959', 9, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(38, '0919', 11, 1, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(39, '0341', 12, 1, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(40, '0991', 9, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(41, '0598', 10, 1, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(42, '0426', 10, 1, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(43, '0525', 10, 1, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(44, '0762', 9, 1, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(45, '0424', 10, 1, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(46, '0685', 9, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(47, '0433', 9, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(48, '0885', 9, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(49, '0160', 9, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `ba`
--

CREATE TABLE `ba` (
  `id_ba` bigint(20) UNSIGNED NOT NULL,
  `kode_ba` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_ba` date NOT NULL,
  `file_ba` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ba`
--

INSERT INTO `ba` (`id_ba`, `kode_ba`, `tanggal_ba`, `file_ba`) VALUES
(1, '100.001', '2025-07-13', 'file_ba.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `ba_detail`
--

CREATE TABLE `ba_detail` (
  `id_ba_detail` bigint(20) UNSIGNED NOT NULL,
  `id_ba` bigint(20) UNSIGNED NOT NULL,
  `id_arsip` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ba_detail`
--

INSERT INTO `ba_detail` (`id_ba_detail`, `id_ba`, `id_arsip`) VALUES
(1, 1, 11),
(2, 1, 12),
(3, 1, 13),
(4, 1, 14);

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
(1, '0237', 'Perencanaan', 'Dokumen rencana program dan kegiatan'),
(2, '0165', 'Keuangan', 'Dokumen pengelolaan anggaran dan transaksi'),
(3, '0195', 'Pelaporan', 'Dokumen laporan hasil kegiatan organisasi'),
(4, '0088', 'Kepegawaian', 'Dokumen data dan manajemen pegawai'),
(5, '0993', 'SPJ', 'Surat Pertanggungjawaban berbagai kegiatan');

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
(1, 'admin wonoasih', 'admin_wonoasih', '$2y$12$xTcH5etY2jWarOfVauw14uyh8LVxjtjYg7leB4daX1bWCMYhJNFuK', 'admin', 'admin', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(2, 'wakil admin wonoasih', 'wamin_wonoasih', '$2y$12$atLvlgf2b.iAXe9FST8JyuIEyM1421heKlEc7K0b.qN5.J6.wAvMS', 'validator', 'validator', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(3, 'seksi trantib', 'seksi_trantib', '$2y$12$8m3MyFzA7bXPIrOi4sSiQ.Z6OBCVuxF9FRp7pxUJ3.McqTVU6oJny', 'kecamatan', 'seksi trantib', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(4, 'seksi pemmas', 'seksi_pemmas', '$2y$12$dTGkw4/mQfK7koB3ht3VCez2/kSXVMvNRrOAnjvsMNEocqxDm7YFa', 'kecamatan', 'seksi pemmas', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(5, 'seksi pemerintahan', 'seksi_pemerintahan', '$2y$12$8aSNE.O0g3WtuRWwUbWxZeg7xKvmrza/qiNVzerCb2N0zEQQK4UFW', 'kecamatan', 'seksi pemerintahan', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(6, 'seksi pelayanan', 'seksi_pelayanan', '$2y$12$MHUov6PCFz.Rev6UR2/q7OCH/OyZsVAwuKplXJFrtp//sngsSCpnq', 'kecamatan', 'seksi pelayanan', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(7, 'subbag tata usaha', 'tata_usaha', '$2y$12$BODZiB9zOPVNcwU07nXzrOA/SQHVwhqoftaarJ/CmEesZCfbjBTJS', 'kecamatan', 'subbag tata usaha', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(8, 'subbag program keuangan', 'program_keuangan', '$2y$12$ME8pkhNXTYc7ZnfwjQ9CXeR557LTLn5Sc7vKNhqEdJFx6v9MC1zba', 'kecamatan', 'subbag prog. keuangan', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(9, 'user wonoasih', 'kel_wonoasih', '$2y$12$yV5NhKYGGapOEDLPvohER.BLLACE3TbK4vzImCJbn9aVrjPhIO7MO', 'kelurahan', 'wonoasih', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(10, 'user jrebengkidul', 'kel_jrebengkidul', '$2y$12$lmaD2BgUihCPAEz1shXKLuOsZzD5R2Izv10rfGeZ9np2abRNvaTRi', 'kelurahan', 'jrebengkidul', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(11, 'user pakistaji', 'kel_pakistaji', '$2y$12$Vma.sFjC4HaichnufQwfq.ag9ow12Kzdv3RJg.byuC7VSRd6jsv3m', 'kelurahan', 'pakistaji', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(12, 'user kedunggaleng', 'kel_kedunggaleng', '$2y$12$B9RpxmlDducVvYkzd9Hr5uZIZrvgryn9mxV6lYn39LUUpAhO7ACeq', 'kelurahan', 'kedunggaleng', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(13, 'user kedungasem', 'kel_kedungasem', '$2y$12$2P.A38VpUN.u9XsebKia8OpPNYMupb57xL6YXDMBRwAkFY58YATRK', 'kelurahan', 'kedungasem', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25'),
(14, 'user sumbertaman', 'kel_sumbertaman', '$2y$12$oLs52KFYNlyHsl.yepLvFOVQB63IXo5wpMPR307fdpYYfNYfhqbH.', 'kelurahan', 'sumbertaman', 0, NULL, '2025-07-13 15:03:25', '2025-07-13 15:03:25');

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
-- Indexes for table `ba`
--
ALTER TABLE `ba`
  ADD PRIMARY KEY (`id_ba`),
  ADD UNIQUE KEY `ba_kode_ba_unique` (`kode_ba`);

--
-- Indexes for table `ba_detail`
--
ALTER TABLE `ba_detail`
  ADD PRIMARY KEY (`id_ba_detail`),
  ADD KEY `ba_detail_id_ba_foreign` (`id_ba`),
  ADD KEY `ba_detail_id_arsip_foreign` (`id_arsip`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

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
-- AUTO_INCREMENT for table `ba`
--
ALTER TABLE `ba`
  MODIFY `id_ba` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ba_detail`
--
ALTER TABLE `ba_detail`
  MODIFY `id_ba_detail` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `ba_detail`
--
ALTER TABLE `ba_detail`
  ADD CONSTRAINT `ba_detail_id_arsip_foreign` FOREIGN KEY (`id_arsip`) REFERENCES `arsip` (`id_arsip`),
  ADD CONSTRAINT `ba_detail_id_ba_foreign` FOREIGN KEY (`id_ba`) REFERENCES `ba` (`id_ba`);

--
-- Constraints for table `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `sub_kategori_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
