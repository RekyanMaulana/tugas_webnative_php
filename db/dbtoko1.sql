-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2023 at 12:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtoko1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `addJenis_produk` (`nama` VARCHAR(20), `ket` VARCHAR(50))   begin
insert into jenis_produk(nama, ket) values(nama, ket);
end$$

CREATE DEFINER=`` PROCEDURE `addPesanan` (`tanggal` DATE, `total` DOUBLE, `pelanggan_id` INT)   begin
insert into pesanan(tanggal, total, pelanggan_id) values (tanggal, total, pelanggan_id);
end$$

CREATE DEFINER=`` PROCEDURE `inputPelanggan` (`kode` VARCHAR(10), `nama` VARCHAR(50), `jk` CHAR(1), `tmp_lahir` VARCHAR(30), `tgl_lahir` DATE, `email` VARCHAR(30), `kartu_id` INT(11))   begin
insert into pelanggan(kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id)
values (kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id);
end$$

CREATE DEFINER=`` PROCEDURE `inputProduk` (`kode` VARCHAR(10), `nama` VARCHAR(45), `harga_beli` DOUBLE, `harga_jual` DOUBLE, `stok` INT(11), `min_stok` INT(11), `jenis_produk_id` INT(11))   begin
insert into produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
values (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
end$$

CREATE DEFINER=`` PROCEDURE `seluruhPesanan` ()   begin
select pelanggan.nama, pesanan.tanggal, pesanan.total from pelanggan
join pesanan on pelanggan.id = pesanan.pelanggan_id;
end$$

CREATE DEFINER=`` PROCEDURE `showPelanggan` ()   begin
select * from pelanggan;
end$$

CREATE DEFINER=`` PROCEDURE `showProduk` ()   begin
select * from produk;
end$$

CREATE DEFINER=`` PROCEDURE `showProduks` ()   begin
select nama, harga_beli, harga_jual from produk;
end$$

CREATE DEFINER=`` PROCEDURE `totalPesanan` ()   begin
select pelanggan.nama as nama_pelanggan, sum(pesanan.total) as total_pesanan from pelanggan
join pesanan on pelanggan.id = pesanan.pelanggan_id
group by pelanggan.nama;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_produk_vw`
-- (See below for the actual view)
--
CREATE TABLE `detail_produk_vw` (
`id` int(11)
,`kode` varchar(10)
,`nama` varchar(45)
,`harga_beli` double
,`harga_jual` double
,`stok` int(11)
,`min_stok` int(11)
,`jenis_produk_id` int(11)
,`jenis` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_produk`
--

INSERT INTO `jenis_produk` (`id`, `nama`, `ket`) VALUES
(1, 'elektronik', 'tersedia'),
(2, 'makanan', 'tersedia'),
(3, 'minuman', 'tidak tersedia'),
(4, 'furniture', 'tersedia'),
(5, 'Alat Kebersihan', 'Tersedia'),
(6, 'Perabot', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kartu`
--

CREATE TABLE `kartu` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(30) NOT NULL,
  `diskon` double DEFAULT 0,
  `iuran` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kartu`
--

INSERT INTO `kartu` (`id`, `kode`, `nama`, `diskon`, `iuran`) VALUES
(1, '10111', 'Gold', 20000, 2000),
(2, '10112', 'Silver', 15000, 1500),
(4, '10113', 'Perak', 10000, 1000),
(5, '10114', 'Platinum', 30000, 3000),
(6, '10115', 'Titanium', 50000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `kartu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`) VALUES
(1, '011101', 'Agung', 'L', 'Bandung', '1997-09-06', 'agung@gmail.com', 1),
(2, '011102', 'Pandan Wangi', 'P', 'Yogyakarta', '1998-08-07', 'pandan@gmail.com', 2),
(3, '011103', 'Sekar', 'P', 'Kediri', '2001-09-08', 'sekar@gmail.com', 1),
(4, '011104', 'Suandi', 'L', 'Jakarta', '1997-09-08', 'suandi@gmail.com', 1),
(5, '011105', 'Pradana', 'L', 'Jakarta', '2001-08-01', 'pradana@gmail.com', 2),
(6, '011106', 'Gayatri Putri', 'P', 'Jakarta', '2002-09-01', 'gayatri@gmail.com', 1),
(7, '011107', 'Asep', 'L', 'Bandung', '2002-08-09', 'budi@gmail.com', 2),
(8, '011108', 'Jokowi', 'L', 'Solo', '1960-08-25', 'jokowaw@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `no_kuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `status_pembayaran` varchar(50) DEFAULT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `cek_status_pembayaran` BEFORE INSERT ON `pembayaran` FOR EACH ROW begin
declare total_pesanan int;
declare jumlah_pembayaran int;
declare sisa_pembayaran int;
select total into total_pesanan from pesanan where id = new.pesanan_id;
select sum(jumlah) into jumlah_pembayaran from pembayaran where pesanan_id = new.pesanan_id;
set sisa_pembayaran = total_pesanan - jumlah_pembayaran;
if sisa_pembayaran <= 0 then
update pembayaran set status_pembayaran = 'Lunas' where id = new.id;
else
update pembayaran set status_pembayaran = 'Belum Lunas' where id = new.id;
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `tanggal` varchar(45) DEFAULT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`) VALUES
(1, '2023-03-03', 200000, 1),
(2, '2023-03-04', 30000, 1),
(3, '2023-05-06', 2500000, 2),
(4, '2023-05-08', 500000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_items`
--

CREATE TABLE `pesanan_items` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_items`
--

INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
(3, 3, 2, 2, 5000000);

--
-- Triggers `pesanan_items`
--
DELIMITER $$
CREATE TRIGGER `keranjang_pesanan_items` BEFORE INSERT ON `pesanan_items` FOR EACH ROW begin
set @stok = (select stok from produk where id = new.produk_id);
set @sisa = @stok - new.qty;
if @sisa < 0 then
signal sqlstate '45000' set message_text = 'Warning: stok tidak cukup';
end if;
update produk set stok = @sisa where id = new.produk_id;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transaksi_update_before` BEFORE UPDATE ON `pesanan_items` FOR EACH ROW begin
if old.id = new.produk_id then
set @stok = (select stok from produk where id = old.produk_id);
set @sisa = (@stok + old.qty) - new.qty;
if @sisa < 0 then
signal sqlstate '45000' set message_text = 'Warning: stok tidak cukup';
end if;
update produk set stok = @sisa where id = old.produk_id;
else
set @stok_lama = (select stok from produk where id = old.produk_id);
set @sisa_lama = (@stok_lama + old.qty);
update produk set stok = @sisa_lama where id = old.produk_id;
set @stok_baru = (select stok from produk where id = new.produk_id);
set @sisa_baru = @stok_baru - new.qty;
if @sisa_baru < 0 then
signal sqlstate '45000' set message_text = 'Warning: stok tidak tersedia';
end if;
update produk set stok = @sisa_baru where id = new.produk_id;
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pesanan_produk_vw`
-- (See below for the actual view)
--
CREATE TABLE `pesanan_produk_vw` (
`id` int(11)
,`kode` varchar(10)
,`nama` varchar(50)
,`jenis_kelamin` char(1)
,`kartu_id` int(11)
,`kode_produk` varchar(10)
,`nama_produk` varchar(45)
,`tanggal` date
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) NOT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `min_stok` int(11) DEFAULT NULL,
  `jenis_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `min_stok`, `jenis_produk_id`) VALUES
(1, 'TV01', 'TV', 3000000, 4000000, 3, 2, 1),
(2, 'TV02', 'TV 21 Inch', 2000000, 3000000, 10, 3, 1),
(3, 'K001', 'Kulkas', 4000000, 5000000, 8, 3, 1),
(4, 'M001', 'Meja Makan', 1000000, 2000000, 4, 2, 4),
(5, 'T001', 'Taro', 4000, 5000, 3, 2, 2),
(7, 'KA01', 'Kipas Angin', 500000, 700000, 10, 3, 1),
(8, 'TP01', 'Teh Pucuk', 3000, 5000, 10, 3, 3),
(9, 'SP01', 'Sapu', 20000, 25000, 5, 2, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil_produk`
-- (See below for the actual view)
--
CREATE TABLE `tampil_produk` (
`nama` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `nomor` varchar(4) DEFAULT NULL,
  `nama` varchar(40) NOT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `kontak` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `detail_produk_vw`
--
DROP TABLE IF EXISTS `detail_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `detail_produk_vw`  AS SELECT `p`.`id` AS `id`, `p`.`kode` AS `kode`, `p`.`nama` AS `nama`, `p`.`harga_beli` AS `harga_beli`, `p`.`harga_jual` AS `harga_jual`, `p`.`stok` AS `stok`, `p`.`min_stok` AS `min_stok`, `p`.`jenis_produk_id` AS `jenis_produk_id`, `j`.`nama` AS `jenis` FROM (`jenis_produk` `j` join `produk` `p` on(`p`.`jenis_produk_id` = `j`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `pesanan_produk_vw`
--
DROP TABLE IF EXISTS `pesanan_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `pesanan_produk_vw`  AS SELECT `pelanggan`.`id` AS `id`, `pelanggan`.`kode` AS `kode`, `pelanggan`.`nama` AS `nama`, `pelanggan`.`jk` AS `jenis_kelamin`, `pelanggan`.`kartu_id` AS `kartu_id`, `produk`.`kode` AS `kode_produk`, `produk`.`nama` AS `nama_produk`, `pesanan`.`tanggal` AS `tanggal`, `pesanan`.`total` AS `total` FROM ((`produk` join `pesanan` on(`produk`.`id` = `pesanan`.`pelanggan_id`)) join `pelanggan` on(`pelanggan`.`id` = `pesanan`.`pelanggan_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `tampil_produk`
--
DROP TABLE IF EXISTS `tampil_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `tampil_produk`  AS SELECT `produk`.`nama` AS `nama` FROM `produk``produk`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kuitansi` (`no_kuitansi`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
