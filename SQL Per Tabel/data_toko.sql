-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2019 at 04:58 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_toko`
--
ALTER TABLE `data_toko`
  ADD PRIMARY KEY (`id_toko`),
  ADD KEY `pemilik` (`pemilik`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_toko`
--
ALTER TABLE `data_toko`
  ADD CONSTRAINT `data_toko_ibfk_1` FOREIGN KEY (`pemilik`) REFERENCES `username` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
