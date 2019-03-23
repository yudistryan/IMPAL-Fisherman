-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2019 at 04:56 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fisherman`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_ikan`
--

CREATE TABLE `data_ikan` (
  `id_ikan` varchar(10) NOT NULL,
  `nama_ikan` varchar(10) DEFAULT NULL,
  `jenis_ikan` varchar(10) DEFAULT NULL,
  `harga_ikan` varchar(10) DEFAULT NULL,
  `penjual` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_ikan`
--

INSERT INTO `data_ikan` (`id_ikan`, `nama_ikan`, `jenis_ikan`, `harga_ikan`, `penjual`) VALUES
('ik01', 'Tuna', 'laut', '15000', 'tk01');

-- --------------------------------------------------------

--
-- Table structure for table `data_order`
--

CREATE TABLE `data_order` (
  `id_order` varchar(14) NOT NULL,
  `tgl_order` datetime DEFAULT NULL,
  `id_ikan` varchar(10) NOT NULL,
  `jumlah` int(5) DEFAULT NULL,
  `catatan` varchar(50) DEFAULT NULL,
  `total_harga` int(9) DEFAULT NULL,
  `review` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_order`
--

INSERT INTO `data_order` (`id_order`, `tgl_order`, `id_ikan`, `jumlah`, `catatan`, `total_harga`, `review`) VALUES
('od01', '2019-01-31 08:00:00', 'ik01', 2, 'ikannya yang seger ya mas', 30000, 'mantap sih');

-- --------------------------------------------------------

--
-- Table structure for table `data_pembayaran`
--

CREATE TABLE `data_pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_order` varchar(14) DEFAULT NULL,
  `metode_pembayaran` varchar(15) DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pembayaran`
--

INSERT INTO `data_pembayaran` (`id_pembayaran`, `id_order`, `metode_pembayaran`, `tgl_pembayaran`) VALUES
('pem01', 'od01', 'transfer bank', '2019-01-31 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `data_toko`
--

CREATE TABLE `data_toko` (
  `id_toko` varchar(10) NOT NULL,
  `nama_toko` varchar(15) DEFAULT NULL,
  `alamat_toko` varchar(50) DEFAULT NULL,
  `jam_buka_toko` time DEFAULT NULL,
  `pemilik` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_toko`
--

INSERT INTO `data_toko` (`id_toko`, `nama_toko`, `alamat_toko`, `jam_buka_toko`, `pemilik`) VALUES
('tk01', 'Toko Ikan', 'Ciganitri', '08:00:00', 'yudis');

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `user_id` varchar(15) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `hak_akses` int(1) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(14) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `username`
--

INSERT INTO `username` (`user_id`, `user_pass`, `hak_akses`, `nama`, `alamat`, `no_telp`, `email`) VALUES
('yudis', 'yudis', 1, 'yudistryan', 'ciganitri', '082131151080', 'yudis@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_ikan`
--
ALTER TABLE `data_ikan`
  ADD PRIMARY KEY (`id_ikan`),
  ADD KEY `penjual` (`penjual`);

--
-- Indexes for table `data_order`
--
ALTER TABLE `data_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_ikan` (`id_ikan`);

--
-- Indexes for table `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `data_toko`
--
ALTER TABLE `data_toko`
  ADD PRIMARY KEY (`id_toko`),
  ADD KEY `pemilik` (`pemilik`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_ikan`
--
ALTER TABLE `data_ikan`
  ADD CONSTRAINT `data_ikan_ibfk_1` FOREIGN KEY (`penjual`) REFERENCES `data_toko` (`id_toko`);

--
-- Constraints for table `data_order`
--
ALTER TABLE `data_order`
  ADD CONSTRAINT `data_order_ibfk_1` FOREIGN KEY (`id_ikan`) REFERENCES `data_ikan` (`id_ikan`);

--
-- Constraints for table `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD CONSTRAINT `data_pembayaran_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `data_order` (`id_order`);

--
-- Constraints for table `data_toko`
--
ALTER TABLE `data_toko`
  ADD CONSTRAINT `data_toko_ibfk_1` FOREIGN KEY (`pemilik`) REFERENCES `username` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
