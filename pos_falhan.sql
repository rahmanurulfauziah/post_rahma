-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Apr 2022 pada 06.10
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` text DEFAULT NULL,
  `barang_satuan` varchar(30) DEFAULT NULL,
  `harga_pokok` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `stok_barang` varchar(11) DEFAULT NULL,
  `stok_minimal` int(11) DEFAULT NULL,
  `barang_tgl_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_kategori` int(11) NOT NULL,
  `barang_tgl_last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama_barang`, `barang_satuan`, `harga_pokok`, `harga_jual`, `stok_barang`, `stok_minimal`, `barang_tgl_input`, `id_kategori`, `barang_tgl_last_update`) VALUES
('BR049', 'jeruk', '5', 10000, 15000, '6', 1, '2018-09-17 10:29:52', 38, '0000-00-00 00:00:00'),
('BR050', 'minyak', '4', 10000, 12000, '10', 5, '2020-04-20 02:08:53', 32, '0000-00-00 00:00:00'),
('BR051', 'ciki makroni', '3', 120000, 2, '1000', 20, '2022-04-06 01:49:43', 33, '0000-00-00 00:00:00'),
('BR052', 'makroni basah', '3', 20000, 6, '1000', 30, '2022-04-06 02:17:58', 33, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beli_suplier`
--

CREATE TABLE `tbl_beli_suplier` (
  `tanggal_beli` varchar(12) NOT NULL,
  `no_faktur` varchar(200) NOT NULL,
  `id_suplier` int(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_belanja` double NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=sudah di proses, 0 belum di proses',
  `detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_beli_suplier`
--

INSERT INTO `tbl_beli_suplier` (`tanggal_beli`, `no_faktur`, `id_suplier`, `kd_barang`, `harga`, `jumlah`, `total_belanja`, `status`, `detail`) VALUES
('2018-06-08', '29383', 1, 'BR007', 8000, 89, 712000, 1, 1),
('2018-09-17', '31', 1, 'BR003', 12000, 12, 144000, 1, 0),
('2018-06-04', '678', 1, 'BR027', 250000, 6, 1500000, 1, 1),
('2018-06-08', '78', 1, 'BR044', 250000, 90, 22500000, 1, 1),
('2018-06-08', '789', 1, 'BR044', 250000, 90, 22500000, 1, 1),
('2018-03-04', '87877', 1, 'BR003', 12000, 56, 672000, 1, 1),
('2018-03-05', '8787709', 1, 'BR006', 2500, 76, 190000, 1, 1),
('2018-03-07', '98989', 1, 'BR009', 5000, 88, 440000, 1, 1),
('2018-03-03', 'yhhshs', 1, 'BR002', 7000, 34, 238000, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(32, 'KAMAR'),
(34, 'minyak'),
(35, 'minuman ringan'),
(36, 'mie instan'),
(37, 'jajanan bocah'),
(38, 'buah'),
(39, 'snack'),
(40, 'makroni');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kriteria`
--

CREATE TABLE `tbl_kriteria` (
  `kd_kriteria` varchar(2) NOT NULL,
  `nama_kriteria` varchar(20) NOT NULL,
  `jenis_atribut` varchar(20) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kriteria`
--

INSERT INTO `tbl_kriteria` (`kd_kriteria`, `nama_kriteria`, `jenis_atribut`, `bobot`) VALUES
('C1', 'CABUT_SEKOLAH', 'benefit', 10),
('C2', 'TAWURAN', 'BENEFIT', 20),
('C3', 'MOLOR_DIKELAS', 'BENEFIT', 20),
('C4', 'NGELINDUR', 'BENEFIT', 17),
('C5', 'KERJASAMA', 'BENEFIT', 15),
('C6', 'KEPEDULIAN', 'BENEFIT', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level_user`
--

CREATE TABLE `tbl_level_user` (
  `id_level_user` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_level_user`
--

INSERT INTO `tbl_level_user` (`id_level_user`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Penjaga'),
(3, 'Bos'),
(4, 'Keuangan'),
(5, 'SECURITY'),
(6, 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(20) NOT NULL,
  `menu_engg` varchar(20) NOT NULL,
  `link` varchar(15) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `is_main_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `nama_menu`, `menu_engg`, `link`, `icon`, `is_main_menu`) VALUES
(8, 'DATA BARANG', 'INVENTORY', 'Barang', 'ei-business-card', 0),
(10, 'KATEGORI ', 'CATEGORY', 'Kategori', 'ei-diamond', 0),
(11, 'TRANSAKSI', 'TRANSACTION', 'Transaksi', 'ei-money', 0),
(12, 'PENGGUNA', ' USERS', 'User', 'ei-key', 0),
(13, 'SUPLIIER', 'SUPPLIER', 'Suplier', 'ei-office-cart', 0),
(15, 'LAPORAN ', 'REPORT', 'Laporan', 'ei-bank', 0),
(16, 'PEMBELIAN', 'PURCHASE', 'Pembelian', 'ei-shopping-cart-ful', 11),
(17, 'PENJUALAN', 'SALES', 'Penjualan', 'ei-deviantart', 11),
(20, 'Menu', 'Menu', 'Menu', 'ei-menu-7', 0),
(22, 'Sistem Cerdas', 'Smart System', 'Cerdas', 'ei-smartphone-msg', 0),
(23, 'Grafik Laporan', 'Report graph', 'Grafik', 'ei-bar-chart', 0),
(25, 'Dokumentasi', 'Documentation', 'Dokumentasi', 'ei-speech-box-text', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembeli`
--

CREATE TABLE `tbl_pembeli` (
  `tanggal_beli` timestamp NOT NULL DEFAULT current_timestamp(),
  `no_faktur` int(11) NOT NULL,
  `total_beli` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pembeli`
--

INSERT INTO `tbl_pembeli` (`tanggal_beli`, `no_faktur`, `total_beli`) VALUES
('2018-09-17 09:07:22', 538, 1),
('2018-09-17 09:08:27', 539, 1),
('2018-09-17 09:09:02', 540, 1.5),
('2018-09-17 09:09:10', 541, 1.5),
('2018-09-17 09:11:59', 542, 1),
('2018-09-17 09:12:32', 543, 1),
('2018-09-17 10:30:33', 544, 1.5),
('2018-09-17 10:31:00', 545, 1.5),
('2020-04-20 02:16:19', 546, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `id_satuan` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`id_satuan`, `satuan`) VALUES
(2, 'Bungkus'),
(3, 'kardus'),
(4, 'pcs'),
(5, 'kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_suplier`
--

CREATE TABLE `tbl_suplier` (
  `id_suplier` int(11) NOT NULL,
  `nama_suplier` text DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `No_telpon` varchar(13) DEFAULT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_suplier`
--

INSERT INTO `tbl_suplier` (`id_suplier`, `nama_suplier`, `alamat`, `No_telpon`, `keterangan`) VALUES
(3, 'TOKO YOUTUBE', 'JAKARTA BARAT', '081', '                            ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_level_user` int(11) NOT NULL,
  `foto` text NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `id_level_user`, `foto`, `nama_lengkap`) VALUES
(1, 'bobi', 'bobi', 1, '', 'bobi'),
(21, 'stok', 'stok', 3, '', 'stok'),
(25, 'kasir', 'kasir', 2, '', 'kasir'),
(26, 'bobi', 'fikri12345', 4, '', 'fikri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_rule`
--

CREATE TABLE `tbl_user_rule` (
  `id_rule` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_rule`
--

INSERT INTO `tbl_user_rule` (`id_rule`, `id_menu`, `id_level_user`) VALUES
(1, 12, 1),
(3, 10, 1),
(4, 11, 1),
(5, 13, 1),
(6, 14, 1),
(7, 15, 1),
(8, 15, 4),
(9, 8, 4),
(10, 8, 1),
(11, 16, 1),
(12, 11, 4),
(13, 17, 1),
(14, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 21, 4),
(23, 15, 4),
(28, 22, 1),
(29, 23, 1),
(30, 8, 3),
(31, 11, 2),
(32, 17, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_pembelian`
--

CREATE TABLE `transaksi_pembelian` (
  `id_transaksi` int(11) NOT NULL,
  `no_faktur` varchar(200) NOT NULL,
  `kd_barang` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `detail` int(11) NOT NULL,
  `jumlah_uang` double NOT NULL,
  `total_belanja` double NOT NULL,
  `uang_kembali` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_barang` (
`kd_barang` varchar(11)
,`nama_barang` text
,`nama_kategori` varchar(15)
,`stok_barang` varchar(11)
,`stok_minimal` int(11)
,`harga_jual` double
,`satuan` varchar(20)
,`harga_pokok` double
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_laba`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_laba` (
`total_belanja` double
,`tanggal_beli` timestamp
,`id_transaksi` int(11)
,`kd_barang` varchar(15)
,`nama_barang` text
,`Satuan` varchar(20)
,`harga_jual` double
,`harga_pokok` double
,`total_beli` double
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_transaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_transaksi` (
`status` int(11)
,`jumlah_uang` double
,`total_belanja` double
,`uang_kembali` double
,`id_transaksi` int(11)
,`kd_barang` varchar(15)
,`nama_barang` text
,`Satuan` varchar(20)
,`harga_jual` double
,`total_beli` double
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_transaksi_detail`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_transaksi_detail` (
`jumlah_uang` double
,`total_belanja` double
,`uang_kembali` double
,`detail` int(11)
,`id_transaksi` int(11)
,`kd_barang` varchar(15)
,`nama_barang` text
,`Satuan` varchar(20)
,`harga_jual` double
,`total_beli` double
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_transaksi_laporan_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_transaksi_laporan_penjualan` (
`nama_kategori` varchar(15)
,`tanggal_beli` timestamp
,`jumlah_uang` double
,`total_belanja` double
,`uang_kembali` double
,`id_transaksi` int(11)
,`kd_barang` varchar(15)
,`nama_barang` text
,`Satuan` varchar(20)
,`harga_jual` double
,`total_beli` double
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_user`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_user` (
`id_user` int(11)
,`username` varchar(30)
,`password` varchar(20)
,`id_level_user` int(11)
,`foto` text
,`nama_lengkap` varchar(30)
,`nama_level` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_barang`
--
DROP TABLE IF EXISTS `v_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang`  AS SELECT `tb`.`kd_barang` AS `kd_barang`, `tb`.`nama_barang` AS `nama_barang`, `tk`.`nama_kategori` AS `nama_kategori`, `tb`.`stok_barang` AS `stok_barang`, `tb`.`stok_minimal` AS `stok_minimal`, `tb`.`harga_jual` AS `harga_jual`, `ts`.`satuan` AS `satuan`, `tb`.`harga_pokok` AS `harga_pokok` FROM ((`tbl_barang` `tb` join `tbl_kategori` `tk`) join `tbl_satuan` `ts`) WHERE `tb`.`id_kategori` = `tk`.`id_kategori` AND `ts`.`id_satuan` = `tb`.`barang_satuan` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_laba`
--
DROP TABLE IF EXISTS `v_laba`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_laba`  AS SELECT `tpl`.`total_belanja` AS `total_belanja`, `tp`.`tanggal_beli` AS `tanggal_beli`, `tpl`.`id_transaksi` AS `id_transaksi`, `tpl`.`kd_barang` AS `kd_barang`, `tb`.`nama_barang` AS `nama_barang`, `ts`.`satuan` AS `Satuan`, `tb`.`harga_jual` AS `harga_jual`, `tb`.`harga_pokok` AS `harga_pokok`, `tp`.`total_beli` AS `total_beli` FROM (((`transaksi_pembelian` `tpl` join `tbl_barang` `tb`) join `tbl_pembeli` `tp`) join `tbl_satuan` `ts`) WHERE `tpl`.`kd_barang` = `tb`.`kd_barang` AND `tpl`.`no_faktur` = `tp`.`no_faktur` AND `tb`.`barang_satuan` = `ts`.`id_satuan` AND `tpl`.`status` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_transaksi`
--
DROP TABLE IF EXISTS `v_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi`  AS SELECT `tpl`.`status` AS `status`, `tpl`.`jumlah_uang` AS `jumlah_uang`, `tpl`.`total_belanja` AS `total_belanja`, `tpl`.`uang_kembali` AS `uang_kembali`, `tpl`.`id_transaksi` AS `id_transaksi`, `tpl`.`kd_barang` AS `kd_barang`, `tb`.`nama_barang` AS `nama_barang`, `ts`.`satuan` AS `Satuan`, `tb`.`harga_jual` AS `harga_jual`, `tp`.`total_beli` AS `total_beli` FROM (((`transaksi_pembelian` `tpl` join `tbl_barang` `tb`) join `tbl_pembeli` `tp`) join `tbl_satuan` `ts`) WHERE `tpl`.`kd_barang` = `tb`.`kd_barang` AND `tpl`.`no_faktur` = `tp`.`no_faktur` AND `tb`.`barang_satuan` = `ts`.`id_satuan` AND `tpl`.`status` = 0 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_transaksi_detail`
--
DROP TABLE IF EXISTS `v_transaksi_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi_detail`  AS SELECT `tpl`.`jumlah_uang` AS `jumlah_uang`, `tpl`.`total_belanja` AS `total_belanja`, `tpl`.`uang_kembali` AS `uang_kembali`, `tpl`.`detail` AS `detail`, `tpl`.`id_transaksi` AS `id_transaksi`, `tpl`.`kd_barang` AS `kd_barang`, `tb`.`nama_barang` AS `nama_barang`, `ts`.`satuan` AS `Satuan`, `tb`.`harga_jual` AS `harga_jual`, `tp`.`total_beli` AS `total_beli` FROM (((`transaksi_pembelian` `tpl` join `tbl_barang` `tb`) join `tbl_pembeli` `tp`) join `tbl_satuan` `ts`) WHERE `tpl`.`kd_barang` = `tb`.`kd_barang` AND `tpl`.`no_faktur` = `tp`.`no_faktur` AND `tb`.`barang_satuan` = `ts`.`id_satuan` AND `tpl`.`detail` = 0 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_transaksi_laporan_penjualan`
--
DROP TABLE IF EXISTS `v_transaksi_laporan_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi_laporan_penjualan`  AS SELECT `tk`.`nama_kategori` AS `nama_kategori`, `tp`.`tanggal_beli` AS `tanggal_beli`, `tpl`.`jumlah_uang` AS `jumlah_uang`, `tpl`.`total_belanja` AS `total_belanja`, `tpl`.`uang_kembali` AS `uang_kembali`, `tpl`.`id_transaksi` AS `id_transaksi`, `tpl`.`kd_barang` AS `kd_barang`, `tb`.`nama_barang` AS `nama_barang`, `ts`.`satuan` AS `Satuan`, `tb`.`harga_jual` AS `harga_jual`, `tp`.`total_beli` AS `total_beli` FROM ((((`transaksi_pembelian` `tpl` join `tbl_barang` `tb`) join `tbl_kategori` `tk`) join `tbl_pembeli` `tp`) join `tbl_satuan` `ts`) WHERE `tpl`.`kd_barang` = `tb`.`kd_barang` AND `tpl`.`no_faktur` = `tp`.`no_faktur` AND `tb`.`barang_satuan` = `ts`.`id_satuan` AND `tb`.`id_kategori` = `tk`.`id_kategori` AND `tpl`.`status` = 1 AND `tpl`.`detail` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_user`
--
DROP TABLE IF EXISTS `v_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user`  AS SELECT `tu`.`id_user` AS `id_user`, `tu`.`username` AS `username`, `tu`.`password` AS `password`, `tu`.`id_level_user` AS `id_level_user`, `tu`.`foto` AS `foto`, `tu`.`nama_lengkap` AS `nama_lengkap`, `tl`.`nama_level` AS `nama_level` FROM (`tbl_user` `tu` join `tbl_level_user` `tl`) WHERE `tu`.`id_level_user` = `tl`.`id_level_user` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `tbl_beli_suplier`
--
ALTER TABLE `tbl_beli_suplier`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tbl_kriteria`
--
ALTER TABLE `tbl_kriteria`
  ADD PRIMARY KEY (`kd_kriteria`);

--
-- Indeks untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  ADD PRIMARY KEY (`id_level_user`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pembeli`
--
ALTER TABLE `tbl_pembeli`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indeks untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `tbl_suplier`
--
ALTER TABLE `tbl_suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indeks untuk tabel `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  MODIFY `id_level_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembeli`
--
ALTER TABLE `tbl_pembeli`
  MODIFY `no_faktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;

--
-- AUTO_INCREMENT untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_suplier`
--
ALTER TABLE `tbl_suplier`
  MODIFY `id_suplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
