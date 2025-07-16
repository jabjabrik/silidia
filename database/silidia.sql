-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2025 pada 05.40
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

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
-- Struktur dari tabel `arsip`
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
  `status_retensi` enum('permanen','sementara','musnah') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_validasi` enum('proses','tervalidasi','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proses',
  `pesan_penolakan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `kode_arsip`, `id_user`, `id_sub_kategori`, `nama_dokumen`, `deskripsi`, `file_path`, `tanggal_retensi`, `status_retensi`, `status_validasi`, `pesan_penolakan`, `created_at`, `updated_at`) VALUES
(1, '0396', 3, 4, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(2, '0076', 3, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(3, '0501', 3, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', NULL, NULL, 'ditolak', 'dokumen arsip tidak sesuai', '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(4, '0376', 3, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(5, '0833', 3, 6, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(6, '0947', 3, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(7, '0638', 3, 4, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(8, '0057', 3, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(9, '0831', 4, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', '2025-04-16', 'permanen', 'tervalidasi', NULL, '2023-04-16 03:40:02', '2025-07-16 03:40:02'),
(10, '0700', 4, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', '2025-04-16', 'permanen', 'tervalidasi', NULL, '2023-04-16 03:40:02', '2025-07-16 03:40:02'),
(11, '0049', 4, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', '2025-05-16', 'musnah', 'tervalidasi', NULL, '2023-05-16 03:40:02', '2025-07-16 03:40:02'),
(12, '0676', 4, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', '2025-05-16', 'musnah', 'tervalidasi', NULL, '2023-05-16 03:40:02', '2025-07-16 03:40:02'),
(13, '0401', 4, 2, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', '2025-05-16', 'musnah', 'tervalidasi', NULL, '2023-05-16 03:40:02', '2025-07-16 03:40:02'),
(14, '0103', 4, 6, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', '2025-05-16', 'musnah', 'tervalidasi', NULL, '2023-05-16 03:40:02', '2025-07-16 03:40:02'),
(15, '0766', 4, 5, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', '2025-06-16', 'sementara', 'tervalidasi', NULL, '2023-06-16 03:40:02', '2025-07-16 03:40:02'),
(16, '0367', 4, 3, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', '2025-06-16', 'sementara', 'tervalidasi', NULL, '2023-06-16 03:40:02', '2025-07-16 03:40:02'),
(17, '0378', 5, 5, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', '2025-08-16', 'sementara', 'tervalidasi', NULL, '2023-08-16 03:40:02', '2025-07-16 03:40:02'),
(18, '0498', 5, 3, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', '2025-08-16', 'permanen', 'tervalidasi', NULL, '2023-08-16 03:40:02', '2025-07-16 03:40:02'),
(19, '0799', 5, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(20, '0937', 5, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(21, '0283', 6, 5, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(22, '0187', 6, 7, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(23, '0027', 7, 3, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(24, '0872', 8, 6, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(25, '0349', 9, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban untuk kegiatan pelatihan manajemen yang dilaksanakan pada tanggal 15-16 September 2024, mencakup biaya penginapan, transportasi, dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2023-12-05 08:23:49', '2025-07-16 03:40:02'),
(26, '0041', 10, 2, 'SPJ Proyek Pembangunan Ruang Kelas Pembangunan Ruang', 'Surat Pertanggungjawaban atas pengeluaran untuk proyek pembangunan ruang kelas baru di SDN 1 Wonoasih, dengan total biaya sebesar Rp 50.000.000 yang dilaksanakan pada bulan Agustus 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(27, '0739', 9, 2, 'SPJ Seminar Nasional Technology 2024', 'Surat Pertanggungjawaban untuk seminar nasional tentang teknologi yang diselenggarakan pada tanggal 20 Oktober 2024, mencakup semua biaya pendaftaran, penginapan, dan materi seminar.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2022-12-05 08:23:49', '2025-07-16 03:40:02'),
(28, '0582', 11, 1, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban untuk biaya transportasi rapat mingguan yang diadakan setiap hari Senin, mencakup biaya taksi dan bensin selama bulan September 2024.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(29, '0583', 12, 1, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban atas pembelian alat tulis kantor untuk keperluan administrasi, termasuk daftar barang, jumlah pengeluaran, dan tanggal pembelian pada bulan Oktober 2024.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(30, '0994', 13, 1, 'SPJ Kegiatan Pelatihan Manajemen', 'Surat Pertanggungjawaban terkait pelaksanaan pelatihan manajemen, mencakup biaya konsumsi, penginapan, dan materi pelatihan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(31, '0956', 14, 2, 'SPJ Proyek Pembangunan Ruang Kelas', 'Surat Pertanggungjawaban untuk pembangunan ruang kelas baru, meliputi biaya material, upah pekerja, dan pengawasan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(32, '0920', 9, 3, 'SPJ Seminar Nasional Teknologi 2024', 'Surat Pertanggungjawaban untuk seminar nasional bidang teknologi, mencakup biaya pendaftaran, akomodasi, dan perlengkapan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(33, '0041', 9, 4, 'SPJ Biaya Transportasi Rapat Mingguan', 'Surat Pertanggungjawaban terkait biaya transportasi untuk menghadiri rapat mingguan selama bulan berjalan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(34, '0889', 9, 1, 'SPJ Pengeluaran Kegiatan Pendidikan 2024', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan pendidikan, seperti pelatihan guru dan workshop siswa.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(35, '0788', 9, 2, 'SPJ Pembelian Alat Tulis Kantor', 'Surat Pertanggungjawaban terkait pembelian alat tulis dan perlengkapan kantor untuk menunjang aktivitas administrasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(36, '0892', 9, 3, 'SPJ Biaya Kegiatan Sosialisasi Desa', 'Surat Pertanggungjawaban untuk kegiatan sosialisasi program pemerintah kepada masyarakat desa, termasuk biaya konsumsi dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(37, '0888', 9, 4, 'SPJ Proyek Renovasi Gedung Kantor', 'Surat Pertanggungjawaban atas pengeluaran untuk renovasi gedung kantor, meliputi perbaikan atap, pengecatan, dan pemasangan listrik.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(38, '0796', 11, 1, 'SPJ Kegiatan Rapat Koordinasi 2024', 'Surat Pertanggungjawaban terkait biaya rapat koordinasi antar instansi, termasuk sewa ruang rapat dan konsumsi peserta.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(39, '0149', 12, 1, 'SPJ Pengeluaran Kegiatan Seminar Nasional', 'Surat Pertanggungjawaban atas pengeluaran untuk seminar nasional, mencakup biaya pembicara, sertifikat, dan konsumsi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(40, '0926', 9, 1, 'SPJ Pengadaan Barang Proyek Pembangunan', 'Surat Pertanggungjawaban untuk pengadaan barang yang diperlukan dalam pelaksanaan proyek pembangunan tertentu.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(41, '0450', 10, 1, 'SPJ Kegiatan Workshop Kepemimpinan 2024', 'Surat Pertanggungjawaban untuk kegiatan workshop kepemimpinan, termasuk biaya pelatihan, alat peraga, dan sertifikat.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(42, '0692', 10, 1, 'SPJ Biaya Kegiatan Pemberdayaan Masyarakat', 'Surat Pertanggungjawaban terkait biaya kegiatan pemberdayaan masyarakat, seperti pelatihan keterampilan dan bantuan sosial.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(43, '0435', 10, 1, 'SPJ Pembayaran Gaji Pegawai Januari 2024', 'Surat Pertanggungjawaban untuk pembayaran gaji pegawai selama bulan Januari 2024, termasuk rincian pengeluaran.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(44, '0042', 9, 1, 'SPJ Pengeluaran Rapat Evaluasi Proyek', 'Surat Pertanggungjawaban untuk biaya rapat evaluasi proyek, mencakup sewa ruang, konsumsi, dan transportasi.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(45, '0667', 10, 1, 'SPJ Biaya Pembangunan Infrastruktur Jalan', 'Surat Pertanggungjawaban atas pengeluaran dana untuk pembangunan jalan, meliputi biaya material dan pekerja.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(46, '0562', 9, 1, 'SPJ Proyek Pembangunan Fasilitas Umum', 'Surat Pertanggungjawaban untuk pembangunan fasilitas umum, seperti taman atau tempat ibadah, mencakup seluruh biaya yang dikeluarkan.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(47, '0992', 9, 2, 'SPJ Biaya Operasional Kegiatan Penelitian', 'Surat Pertanggungjawaban untuk biaya operasional kegiatan penelitian, termasuk alat penelitian, perjalanan, dan honorarium.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(48, '0705', 9, 3, 'SPJ Pembelian Peralatan Kegiatan Pelatihan', 'Surat Pertanggungjawaban untuk pembelian peralatan yang digunakan dalam kegiatan pelatihan, seperti laptop dan proyektor.', 'file.pdf', NULL, NULL, 'tervalidasi', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(49, '0848', 9, 4, 'SPJ Laporan Pengeluaran Dana Kegiatan Rutin', 'Surat Pertanggungjawaban atas pengeluaran dana untuk kegiatan rutin organisasi, seperti operasional harian dan administrasi.', 'file.pdf', NULL, NULL, 'proses', NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ba`
--

CREATE TABLE `ba` (
  `id_ba` bigint(20) UNSIGNED NOT NULL,
  `kode_ba` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_ba` date NOT NULL,
  `file_ba` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ba`
--

INSERT INTO `ba` (`id_ba`, `kode_ba`, `tanggal_ba`, `file_ba`) VALUES
(1, '100.001', '2025-07-16', 'file_ba.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ba_detail`
--

CREATE TABLE `ba_detail` (
  `id_ba_detail` bigint(20) UNSIGNED NOT NULL,
  `id_ba` bigint(20) UNSIGNED NOT NULL,
  `id_arsip` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ba_detail`
--

INSERT INTO `ba_detail` (`id_ba_detail`, `id_ba`, `id_arsip`) VALUES
(1, 1, 11),
(2, 1, 12),
(3, 1, 13),
(4, 1, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `kode_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`, `keterangan_kategori`) VALUES
(1, '0407', 'Perencanaan', 'Dokumen rencana program dan kegiatan'),
(2, '0396', 'Keuangan', 'Dokumen pengelolaan anggaran dan transaksi'),
(3, '0853', 'Pelaporan', 'Dokumen laporan hasil kegiatan organisasi'),
(4, '0729', 'Kepegawaian', 'Dokumen data dan manajemen pegawai'),
(5, '0418', 'SPJ', 'Surat Pertanggungjawaban berbagai kegiatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kategori`
--

CREATE TABLE `sub_kategori` (
  `id_sub_kategori` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_sub_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_sub_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_kategori`
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
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role`, `sub_role`, `login_attempts`, `last_login_attempt`, `created_at`, `updated_at`) VALUES
(1, 'admin wonoasih', 'admin_wonoasih', '$2y$12$65C4gZahZD56Ac0AkuuFxOUVey5lTVj1iAh1hh5i0nXFDweVowlXW', 'admin', 'admin', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(2, 'wakil admin wonoasih', 'wamin_wonoasih', '$2y$12$xnv5VoC0RV9Eiw3AeA8kTOAigAU1STvJpp/SN1tkLtcTPgSgw8mxK', 'validator', 'validator', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(3, 'seksi trantib', 'seksi_trantib', '$2y$12$lCyM.nBNqPK1V5t5VDDHJuWRg2CB6OiwMEw.iBef0JZkDJNGVwpL6', 'kecamatan', 'seksi trantib', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(4, 'seksi pemmas', 'seksi_pemmas', '$2y$12$0wjApbV9y6Ozg.iUc/D8Q.h0XSNi8rzi85/3tUfDfcRHUc..L2V3e', 'kecamatan', 'seksi pemmas', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(5, 'seksi pemerintahan', 'seksi_pemerintahan', '$2y$12$ucX2.7X9rZqPkqANmMLnOegVHEUr77wChryZIF.xAHxAEK3gZuE.G', 'kecamatan', 'seksi pemerintahan', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(6, 'seksi pelayanan', 'seksi_pelayanan', '$2y$12$hiE6iXmK5UN6j3oRFcDIgufRKLP2mj8opO99xamJ.3Cn8LktfhHi2', 'kecamatan', 'seksi pelayanan', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(7, 'subbag tata usaha', 'tata_usaha', '$2y$12$yXPGISZg3Pmo5SSk9rtMBOhCwrPhAWSEIkuTHN05AVx00NodnTvj2', 'kecamatan', 'subbag tata usaha', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(8, 'subbag program keuangan', 'program_keuangan', '$2y$12$52/jB9y5XTZemCj4pvm9d..7lS3e2Eu11HhoXQJWjNGUaAtIQxv.a', 'kecamatan', 'subbag prog. keuangan', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(9, 'user wonoasih', 'kel_wonoasih', '$2y$12$oCkwHqXdVOdw5r9tz1URbuvlBvdsHZwAvIziMbLI1QeV0ti27kjOW', 'kelurahan', 'wonoasih', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(10, 'user jrebengkidul', 'kel_jrebengkidul', '$2y$12$54tyUPek7EIgBVETQBe/Quq9AMI/K/UmTT2A3vPqEpdueINA1DsGO', 'kelurahan', 'jrebengkidul', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(11, 'user pakistaji', 'kel_pakistaji', '$2y$12$E80Sg2g1Y31IWbamo2Yk3uv2nV3ccTM7zZzkLr5xqWwpJKizroxji', 'kelurahan', 'pakistaji', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(12, 'user kedunggaleng', 'kel_kedunggaleng', '$2y$12$zkN0l50UTseFSvsm/VD6XuvM/4lYpFtrJh7XFDWq5XsArQUod//16', 'kelurahan', 'kedunggaleng', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(13, 'user kedungasem', 'kel_kedungasem', '$2y$12$2HFLQw.VbGnpIgf/pf8MNOn0HHDNsHFViyjyO8zCNzR/NuCiQYcYi', 'kelurahan', 'kedungasem', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02'),
(14, 'user sumbertaman', 'kel_sumbertaman', '$2y$12$xcjptS83prBePDqROUJg7.Ff2H9Deksl6WWQVjDv12rTqQfSirF1W', 'kelurahan', 'sumbertaman', 0, NULL, '2025-07-16 03:40:02', '2025-07-16 03:40:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `arsip_id_user_foreign` (`id_user`),
  ADD KEY `arsip_id_sub_kategori_foreign` (`id_sub_kategori`);

--
-- Indeks untuk tabel `ba`
--
ALTER TABLE `ba`
  ADD PRIMARY KEY (`id_ba`),
  ADD UNIQUE KEY `ba_kode_ba_unique` (`kode_ba`);

--
-- Indeks untuk tabel `ba_detail`
--
ALTER TABLE `ba_detail`
  ADD PRIMARY KEY (`id_ba_detail`),
  ADD KEY `ba_detail_id_ba_foreign` (`id_ba`),
  ADD KEY `ba_detail_id_arsip_foreign` (`id_arsip`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD KEY `sub_kategori_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id_arsip` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `ba`
--
ALTER TABLE `ba`
  MODIFY `id_ba` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ba_detail`
--
ALTER TABLE `ba_detail`
  MODIFY `id_ba_detail` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sub_kategori`
--
ALTER TABLE `sub_kategori`
  MODIFY `id_sub_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `arsip`
--
ALTER TABLE `arsip`
  ADD CONSTRAINT `arsip_id_sub_kategori_foreign` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kategori` (`id_sub_kategori`),
  ADD CONSTRAINT `arsip_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `ba_detail`
--
ALTER TABLE `ba_detail`
  ADD CONSTRAINT `ba_detail_id_arsip_foreign` FOREIGN KEY (`id_arsip`) REFERENCES `arsip` (`id_arsip`),
  ADD CONSTRAINT `ba_detail_id_ba_foreign` FOREIGN KEY (`id_ba`) REFERENCES `ba` (`id_ba`);

--
-- Ketidakleluasaan untuk tabel `sub_kategori`
--
ALTER TABLE `sub_kategori`
  ADD CONSTRAINT `sub_kategori_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
