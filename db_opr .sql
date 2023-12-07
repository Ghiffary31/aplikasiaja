-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Des 2023 pada 03.44
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_opr`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `asuransi`
--

CREATE TABLE `asuransi` (
  `id_asuransi` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `berlaku_asuransi` date NOT NULL,
  `biaya_asuransi` int(8) UNSIGNED DEFAULT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `barang` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `status` enum('history','active') NOT NULL,
  `id_fpk` int(11) NOT NULL,
  `id_master_asuransi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `asuransi`
--

INSERT INTO `asuransi` (`id_asuransi`, `id_kendaraan`, `berlaku_asuransi`, `biaya_asuransi`, `tgl_input`, `tgl_pelaksanaan`, `id_user`, `keterangan`, `barang`, `harga`, `status`, `id_fpk`, `id_master_asuransi`) VALUES
(9, 16, '2018-02-02', 33639002, '2017-03-09 19:21:17', '2017-03-07', 1, 'PERIODE AWAL', '', '', 'active', 0, 8),
(10, 18, '2018-02-01', 4552101, '2017-03-07 11:09:34', '2017-03-07', 1, 'PERIODE AWAL', '', '', 'active', 0, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barcode`
--

CREATE TABLE `barcode` (
  `id_barcode` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `tgl_cari` datetime NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barcode`
--

INSERT INTO `barcode` (`id_barcode`, `id_kendaraan`, `tgl_cari`, `id_user`, `keterangan`) VALUES
(1, 13, '2017-03-08 21:47:48', 2, ''),
(2, 16, '2017-03-08 21:58:56', 2, ''),
(3, 19, '2017-03-09 19:14:40', 3, ''),
(4, 19, '2017-03-09 19:14:50', 2, ''),
(5, 17, '2017-03-09 19:40:25', 3, ''),
(6, 15, '2017-03-09 19:40:41', 2, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_pengajuan_kerja`
--

CREATE TABLE `form_pengajuan_kerja` (
  `id_fpk` int(11) NOT NULL,
  `tgl_persetujuan` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status_fpk` enum('pending','approve','reject') NOT NULL,
  `status_pelaksanaan` enum('active','history') NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `peruntukan` enum('asuransi','kir','pajak','service','stnk') NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `no_polisi` enum('komputer','laptop','printer') NOT NULL,
  `nama_stnk` varchar(35) NOT NULL,
  `merk` varchar(25) NOT NULL,
  `jenis` enum('komputer','laptop','printer') NOT NULL,
  `tahun_pembuatan` enum('ketua','wakil','hakim','sekretaris','panitera','panitera pengganti','kesekretariatan','kepaniteraan','ptsp') NOT NULL,
  `no_rangka` varchar(35) NOT NULL,
  `no_mesin` varchar(35) NOT NULL,
  `posisi_stnk` varchar(35) NOT NULL,
  `nama_bpkb` varchar(35) NOT NULL,
  `posisi_bpkb` varchar(35) NOT NULL,
  `status_kendaraan` varchar(10) NOT NULL,
  `id_master_asuransi` tinyint(2) UNSIGNED DEFAULT NULL,
  `id_penggunakendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `no_polisi`, `nama_stnk`, `merk`, `jenis`, `tahun_pembuatan`, `no_rangka`, `no_mesin`, `posisi_stnk`, `nama_bpkb`, `posisi_bpkb`, `status_kendaraan`, `id_master_asuransi`, `id_penggunakendaraan`) VALUES
(16, 'komputer', 'WEGA', 'EGERAG', 'komputer', 'ketua', '', '', '', 'SERVICE', '', '', 0, 21),
(17, 'komputer', 'WEGA', 'ASUS', 'komputer', 'ketua', '', '', '', 'SERVICE', '', '', 0, 21),
(18, 'komputer', 'WEGA', 'EGERAG', 'komputer', 'ketua', '', '', '', 'SERVICE', '', '', 0, 22),
(19, 'laptop', 'WEGA', 'EGERAG', 'laptop', 'ketua', '', '', '', 'SERVICE', '', '', 0, 19),
(20, 'laptop', 'WEGA', 'EGERAG', 'laptop', 'wakil', '', '', '', 'SERVICE', '', '', 0, 20),
(21, 'laptop', 'WEGA', 'ASUS', 'laptop', 'ketua', '', '', '', 'SERVICE', '', '', 0, 16),
(22, 'laptop', 'WEGA', 'ASUS', 'laptop', 'ketua', '', '', '', 'SERVICE', '', '', 0, 16),
(23, 'laptop', 'WEGA', 'EGERAG', 'laptop', 'ketua', '', '', '', 'SERVICE', '', '', 0, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kir`
--

CREATE TABLE `kir` (
  `id_kir` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `berlaku_kir` date NOT NULL,
  `biaya_kir` int(8) UNSIGNED DEFAULT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` enum('history','active') NOT NULL,
  `id_fpk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kir`
--

INSERT INTO `kir` (`id_kir`, `id_kendaraan`, `berlaku_kir`, `biaya_kir`, `tgl_input`, `tgl_pelaksanaan`, `id_user`, `keterangan`, `status`, `id_fpk`) VALUES
(10, 13, '2017-08-22', 96000, '2017-03-07 11:02:05', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(11, 17, '2017-06-06', 85000, '2017-03-10 07:39:51', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_asuransi`
--

CREATE TABLE `master_asuransi` (
  `id_master_asuransi` int(11) NOT NULL,
  `pengguna` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master_asuransi`
--

INSERT INTO `master_asuransi` (`id_master_asuransi`, `pengguna`) VALUES
(11, 'KOMPUTER'),
(12, 'Laptop');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `judul_notifikasi` varchar(255) NOT NULL,
  `isi_notifikasi` varchar(255) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `tgl_kirim_notifikasi` datetime NOT NULL,
  `status` enum('success','failed') NOT NULL,
  `pemilik` enum('asuransi','kir','pajak','service','stnk') NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `judul_notifikasi`, `isi_notifikasi`, `id_kendaraan`, `tgl_kirim_notifikasi`, `status`, `pemilik`, `id_pemilik`, `id_user`) VALUES
(201, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 07:19:11', 'success', 'service', 15, 2),
(202, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 07:19:11', 'success', 'service', 15, 3),
(233, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 07:40:04', 'success', 'service', 15, 2),
(234, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 07:40:04', 'success', 'service', 15, 3),
(235, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:01:33', 'success', 'service', 15, 2),
(236, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:01:33', 'success', 'service', 15, 3),
(237, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:02:13', 'success', 'service', 15, 2),
(238, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:02:13', 'success', 'service', 15, 3),
(239, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:03:13', 'success', 'service', 15, 2),
(240, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:03:13', 'success', 'service', 15, 3),
(241, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:04:13', 'success', 'service', 15, 2),
(242, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:04:13', 'success', 'service', 15, 3),
(243, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:05:13', 'success', 'service', 15, 2),
(244, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:05:13', 'success', 'service', 15, 3),
(245, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:06:13', 'success', 'service', 15, 2),
(246, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:06:13', 'success', 'service', 15, 3),
(247, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:07:13', 'success', 'service', 15, 2),
(248, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:07:13', 'success', 'service', 15, 3),
(249, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:08:13', 'success', 'service', 15, 2),
(250, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:08:13', 'success', 'service', 15, 3),
(251, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:09:13', 'success', 'service', 15, 2),
(252, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:09:13', 'success', 'service', 15, 3),
(253, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:10:13', 'success', 'service', 15, 2),
(254, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:10:13', 'success', 'service', 15, 3),
(255, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:11:13', 'success', 'service', 15, 2),
(256, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:11:13', 'success', 'service', 15, 3),
(257, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:12:13', 'success', 'service', 15, 2),
(258, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:12:13', 'success', 'service', 15, 3),
(259, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:13:13', 'success', 'service', 15, 2),
(260, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:13:13', 'success', 'service', 15, 3),
(261, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:14:13', 'success', 'service', 15, 2),
(262, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:14:13', 'success', 'service', 15, 3),
(263, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:15:13', 'success', 'service', 15, 2),
(264, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:15:13', 'success', 'service', 15, 3),
(265, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:16:13', 'success', 'service', 15, 2),
(266, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:16:13', 'success', 'service', 15, 3),
(267, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:17:13', 'success', 'service', 15, 2),
(268, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:17:13', 'success', 'service', 15, 3),
(269, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:18:13', 'success', 'service', 15, 2),
(270, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:18:13', 'success', 'service', 15, 3),
(271, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:19:13', 'success', 'service', 15, 2),
(272, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:19:13', 'success', 'service', 15, 3),
(273, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:20:13', 'success', 'service', 15, 2),
(274, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:20:13', 'success', 'service', 15, 3),
(275, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:21:13', 'success', 'service', 15, 2),
(276, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:21:13', 'success', 'service', 15, 3),
(277, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:22:13', 'success', 'service', 15, 2),
(278, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:22:13', 'success', 'service', 15, 3),
(279, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:23:13', 'success', 'service', 15, 2),
(280, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:23:13', 'success', 'service', 15, 3),
(281, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:24:13', 'success', 'service', 15, 2),
(282, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:24:13', 'success', 'service', 15, 3),
(283, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:25:13', 'success', 'service', 15, 2),
(284, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:25:13', 'success', 'service', 15, 3),
(285, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:26:13', 'success', 'service', 15, 2),
(286, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:26:13', 'success', 'service', 15, 3),
(287, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:27:13', 'success', 'service', 15, 2),
(288, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:27:13', 'success', 'service', 15, 3),
(289, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:28:13', 'success', 'service', 15, 2),
(290, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:28:13', 'success', 'service', 15, 3),
(291, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:29:13', 'success', 'service', 15, 2),
(292, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:29:13', 'success', 'service', 15, 3),
(293, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:30:13', 'success', 'service', 15, 2),
(294, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:30:13', 'success', 'service', 15, 3),
(295, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:31:13', 'success', 'service', 15, 2),
(296, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:31:13', 'success', 'service', 15, 3),
(297, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:32:13', 'success', 'service', 15, 2),
(298, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:32:13', 'success', 'service', 15, 3),
(299, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:33:13', 'success', 'service', 15, 2),
(300, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:33:13', 'success', 'service', 15, 3),
(301, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:34:13', 'success', 'service', 15, 2),
(302, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:34:13', 'success', 'service', 15, 3),
(303, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:35:13', 'success', 'service', 15, 2),
(304, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:35:13', 'success', 'service', 15, 3),
(305, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:36:13', 'success', 'service', 15, 2),
(306, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:36:13', 'success', 'service', 15, 3),
(307, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:37:13', 'success', 'service', 15, 2),
(308, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:37:13', 'success', 'service', 15, 3),
(309, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:38:13', 'success', 'service', 15, 2),
(310, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:38:13', 'success', 'service', 15, 3),
(311, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:39:13', 'success', 'service', 15, 2),
(312, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:39:13', 'success', 'service', 15, 3),
(313, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:40:13', 'success', 'service', 15, 2),
(314, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:40:13', 'success', 'service', 15, 3),
(315, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:41:13', 'success', 'service', 15, 2),
(316, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:41:13', 'success', 'service', 15, 3),
(317, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:42:13', 'success', 'service', 15, 2),
(318, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:42:13', 'success', 'service', 15, 3),
(319, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:43:13', 'success', 'service', 15, 2),
(320, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:43:13', 'success', 'service', 15, 3),
(321, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:44:13', 'success', 'service', 15, 2),
(322, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:44:13', 'success', 'service', 15, 3),
(323, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:45:13', 'success', 'service', 15, 2),
(324, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:45:13', 'success', 'service', 15, 3),
(325, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:46:13', 'success', 'service', 15, 2),
(326, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:46:13', 'success', 'service', 15, 3),
(327, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:47:13', 'success', 'service', 15, 2),
(328, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:47:13', 'success', 'service', 15, 3),
(329, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:48:13', 'success', 'service', 15, 2),
(330, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:48:13', 'success', 'service', 15, 3),
(331, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:49:13', 'success', 'service', 15, 2),
(332, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:49:13', 'success', 'service', 15, 3),
(333, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:50:13', 'success', 'service', 15, 2),
(334, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:50:13', 'success', 'service', 15, 3),
(335, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:51:13', 'success', 'service', 15, 2),
(336, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:51:13', 'success', 'service', 15, 3),
(337, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:52:13', 'success', 'service', 15, 2),
(338, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:52:13', 'success', 'service', 15, 3),
(339, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:53:13', 'success', 'service', 15, 2),
(340, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:53:13', 'success', 'service', 15, 3),
(341, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:54:13', 'success', 'service', 15, 2),
(342, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:54:13', 'success', 'service', 15, 3),
(343, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:55:13', 'success', 'service', 15, 2),
(344, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:55:13', 'success', 'service', 15, 3),
(345, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:56:13', 'success', 'service', 15, 2),
(346, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:56:13', 'success', 'service', 15, 3),
(347, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:57:13', 'failed', 'service', 15, 2),
(348, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:57:13', 'failed', 'service', 15, 3),
(349, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:58:13', 'failed', 'service', 15, 2),
(350, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:58:13', 'failed', 'service', 15, 3),
(351, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:59:13', 'failed', 'service', 15, 2),
(352, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 11:59:13', 'failed', 'service', 15, 3),
(353, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:00:13', 'failed', 'service', 15, 2),
(354, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:00:13', 'failed', 'service', 15, 3),
(355, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:01:13', 'failed', 'service', 15, 2),
(356, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:01:13', 'failed', 'service', 15, 3),
(357, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:02:13', 'failed', 'service', 15, 2),
(358, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:02:13', 'failed', 'service', 15, 3),
(359, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:03:13', 'failed', 'service', 15, 2),
(360, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:03:13', 'failed', 'service', 15, 3),
(361, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:04:13', 'failed', 'service', 15, 2),
(362, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:04:13', 'failed', 'service', 15, 3),
(363, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:05:13', 'failed', 'service', 15, 2),
(364, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:05:13', 'failed', 'service', 15, 3),
(365, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:06:13', 'failed', 'service', 15, 2),
(366, 'Notifikasi SERVICE', 'Masa berlaku SERVICE kendaraan BM 1018 NY akan berakhir pada 11 Mar 2017', 19, '2017-03-10 12:06:13', 'failed', 'service', 15, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pajak`
--

CREATE TABLE `pajak` (
  `id_pajak` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `berlaku_pajak` date NOT NULL,
  `biaya_pajak` int(8) UNSIGNED DEFAULT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` enum('history','active') NOT NULL,
  `id_fpk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pajak`
--

INSERT INTO `pajak` (`id_pajak`, `id_kendaraan`, `berlaku_pajak`, `biaya_pajak`, `tgl_input`, `tgl_pelaksanaan`, `id_user`, `keterangan`, `status`, `id_fpk`) VALUES
(10, 13, '2018-01-30', 4272000, '2017-03-07 11:02:05', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(11, 14, '2017-06-01', 170000, '2017-03-09 19:37:36', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(12, 15, '2017-12-20', 3466000, '2017-03-07 10:55:27', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(13, 16, '2017-12-28', 12675000, '2017-03-09 19:21:17', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(14, 17, '2018-01-15', 1355000, '2017-03-10 07:39:51', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(15, 18, '2018-02-02', 2445000, '2017-03-07 11:09:34', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(16, 19, '2018-02-02', 2288000, '2017-03-10 07:11:44', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(17, 20, '2018-01-12', 110000, '2017-03-07 11:17:01', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(18, 21, '2017-03-14', 5678, '2017-03-10 11:40:52', '2017-03-10', 1, 'SDFGYHJBN', 'active', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna_kendaraan`
--

CREATE TABLE `pengguna_kendaraan` (
  `id_penggunakendaraan` int(11) NOT NULL,
  `nama_pengguna` varchar(35) NOT NULL,
  `jabatan_pengguna` varchar(35) NOT NULL,
  `no_telp` varchar(16) NOT NULL,
  `tgl_input` date NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna_kendaraan`
--

INSERT INTO `pengguna_kendaraan` (`id_penggunakendaraan`, `nama_pengguna`, `jabatan_pengguna`, `no_telp`, `tgl_input`, `id_user`) VALUES
(15, 'MAHRUS IRFAN', 'DRIVER', '', '0000-00-00', 0),
(16, 'SAHAT MARULI AMBARITA', 'KEPALA GUDANG', '', '0000-00-00', 0),
(17, 'LIYANTI', 'HEAD OF EXPORT-IMPORT', '', '0000-00-00', 0),
(18, 'TONI', 'CEO', '', '0000-00-00', 0),
(19, 'ARIS GIARTO', 'DRIVER', '', '0000-00-00', 0),
(20, 'ENI', 'HEAD OF SUPPLY CHAIN', '', '0000-00-00', 0),
(21, 'ANTON', 'DRIVER', '', '0000-00-00', 0),
(22, 'DESLIANO', 'HEAD OF TECHNICAL SUPPORT', '', '0000-00-00', 0),
(23, 'ABDUL MALIK', 'SALES LUAR KOTA', '', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id_asuransi` int(11) NOT NULL,
  `nama_pengguna` varchar(122) NOT NULL,
  `nama_stnk` varchar(122) NOT NULL,
  `jenis` varchar(122) NOT NULL,
  `merk` varchar(122) NOT NULL,
  `barang` varchar(155) NOT NULL,
  `harga` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `berlaku_service` date NOT NULL,
  `biaya_service` int(8) UNSIGNED DEFAULT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` enum('history','active') NOT NULL,
  `id_penggunakendaraan` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`id_service`, `id_kendaraan`, `berlaku_service`, `biaya_service`, `tgl_input`, `tgl_pelaksanaan`, `id_user`, `keterangan`, `status`, `id_penggunakendaraan`) VALUES
(16, 16, '2023-12-23', 700000000, '2023-12-07 09:27:31', '2023-12-19', 1, '', 'active', 0),
(17, 16, '2023-12-16', 5000, '2023-12-07 09:27:55', '2023-12-19', 1, '', 'active', 0),
(18, 16, '2023-12-29', 150000, '2023-12-07 09:28:23', '2023-12-20', 1, '', 'active', 0),
(19, 19, '2023-12-31', 5000, '2023-12-07 09:29:43', '2023-12-30', 1, '', 'active', 0),
(20, 19, '2023-12-30', 5000, '2023-12-07 09:31:14', '2023-12-24', 1, '', 'active', 0),
(21, 19, '2023-12-31', 111, '2023-12-07 09:38:18', '2023-12-23', 1, '', 'active', 0),
(22, 19, '2023-12-23', 4294967295, '2023-12-07 09:39:22', '2023-12-07', 1, '', 'active', 0),
(23, 19, '2023-12-31', 11111, '2023-12-07 09:41:33', '2023-12-27', 1, '', 'active', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stnk`
--

CREATE TABLE `stnk` (
  `id_stnk` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `berlaku_stnk` date NOT NULL,
  `biaya_stnk` int(8) UNSIGNED DEFAULT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `id_user` tinyint(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` enum('history','active') NOT NULL,
  `id_fpk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stnk`
--

INSERT INTO `stnk` (`id_stnk`, `id_kendaraan`, `berlaku_stnk`, `biaya_stnk`, `tgl_input`, `tgl_pelaksanaan`, `id_user`, `keterangan`, `status`, `id_fpk`) VALUES
(24, 13, '2018-03-30', 7433280, '2017-03-07 11:02:05', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(25, 14, '2021-06-01', 295800, '2017-03-09 19:37:36', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(26, 15, '2018-12-20', 6030840, '2017-03-07 10:55:27', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(27, 16, '2018-12-28', 22054500, '2017-03-09 19:21:17', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(28, 17, '2020-01-15', 2357700, '2017-03-10 07:39:51', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(29, 18, '2020-02-02', 4254300, '2017-03-07 11:09:34', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(30, 19, '2020-02-02', 3981120, '2017-03-10 07:11:44', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(31, 20, '2021-01-12', 191400, '2017-03-07 11:17:01', '2017-03-07', 1, 'PERIODE AWAL', 'active', 0),
(32, 21, '2017-03-23', 567890, '2017-03-10 11:40:52', '2017-03-10', 1, 'DXFCJHBKNL', 'active', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` tinyint(2) NOT NULL,
  `username` varchar(35) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `password` char(40) NOT NULL,
  `tipe_user` enum('manager','admin','slapangan') NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `terakhir_login` datetime NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `namalengkap`, `password`, `tipe_user`, `no_telp`, `terakhir_login`, `token`) VALUES
(1, 'admin', 'M.AbidzarGhiffaryyy', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', '+6281212121212', '2023-12-07 07:51:15', ''),
(2, 'staff', 'Staff Lapangan', '6ccb4b7c39a6e77f76ecfa935a855c6c46ad5611', 'slapangan', '+6281234343434', '2017-03-10 11:43:36', 'dRaJs0BnVXA:APA91bH4UaSAgK-aTKNKQ0JPAy0NzJx4_nGx0Hm0CBJn77DtxR0FXmTXXFGK8qQpMMlwo5CsSSjOY0B21u5mWibYHp-1Xg6L4QWpfATT_eVCUuw3K8G1NkDTDUw5j3Q7v9TU0V4ZUgNl'),
(3, 'manager', 'Manager', '1a8565a9dc72048ba03b4156be3e569f22771f23', 'manager', '+6281256565656', '2017-03-10 10:51:45', 'fJF4G4u2UWM:APA91bFET1NTdaCJCORgLc3WpzoprFGSar11Ngrbj6o6SppK74UgARZLgUcCgQRlD_NqXXTM2-gB_ti-sqwGJhLqNYAqT6cssdqlW4m35_WAd-0YZO1z5VfshZAiwAeYZKrr7OSZBr4p'),
(4, 'pac', 'Pengadilan Agama Ciamis', '3ae967658a9b4b19a502a5cca6e1831f2a60e4d5', 'slapangan', '+6281212121212', '2023-12-06 10:40:15', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `asuransi`
--
ALTER TABLE `asuransi`
  ADD PRIMARY KEY (`id_asuransi`);

--
-- Indeks untuk tabel `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id_barcode`);

--
-- Indeks untuk tabel `form_pengajuan_kerja`
--
ALTER TABLE `form_pengajuan_kerja`
  ADD PRIMARY KEY (`id_fpk`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indeks untuk tabel `kir`
--
ALTER TABLE `kir`
  ADD PRIMARY KEY (`id_kir`);

--
-- Indeks untuk tabel `master_asuransi`
--
ALTER TABLE `master_asuransi`
  ADD PRIMARY KEY (`id_master_asuransi`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`);

--
-- Indeks untuk tabel `pajak`
--
ALTER TABLE `pajak`
  ADD PRIMARY KEY (`id_pajak`);

--
-- Indeks untuk tabel `pengguna_kendaraan`
--
ALTER TABLE `pengguna_kendaraan`
  ADD PRIMARY KEY (`id_penggunakendaraan`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_asuransi`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indeks untuk tabel `stnk`
--
ALTER TABLE `stnk`
  ADD PRIMARY KEY (`id_stnk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `asuransi`
--
ALTER TABLE `asuransi`
  MODIFY `id_asuransi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `barcode`
--
ALTER TABLE `barcode`
  MODIFY `id_barcode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `form_pengajuan_kerja`
--
ALTER TABLE `form_pengajuan_kerja`
  MODIFY `id_fpk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `kir`
--
ALTER TABLE `kir`
  MODIFY `id_kir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `master_asuransi`
--
ALTER TABLE `master_asuransi`
  MODIFY `id_master_asuransi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

--
-- AUTO_INCREMENT untuk tabel `pajak`
--
ALTER TABLE `pajak`
  MODIFY `id_pajak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `pengguna_kendaraan`
--
ALTER TABLE `pengguna_kendaraan`
  MODIFY `id_penggunakendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_asuransi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `stnk`
--
ALTER TABLE `stnk`
  MODIFY `id_stnk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
