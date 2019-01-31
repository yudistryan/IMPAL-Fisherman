-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2019 at 04:57 PM
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
-- Constraints for dumped tables
--

--
-- Constraints for table `data_ikan`
--
ALTER TABLE `data_ikan`
  ADD CONSTRAINT `data_ikan_ibfk_1` FOREIGN KEY (`penjual`) REFERENCES `data_toko` (`id_toko`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
