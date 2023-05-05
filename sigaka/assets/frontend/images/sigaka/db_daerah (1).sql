-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 02:28 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_daerah`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_kab_kota`
--

CREATE TABLE `master_kab_kota` (
  `id_kab_kota` int(11) NOT NULL,
  `kode_kab_kota` varchar(10) DEFAULT NULL,
  `nama_kab_kota` varchar(50) DEFAULT NULL,
  `id_provinsi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_kecamatan`
--

CREATE TABLE `master_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kode_kecamatan` varchar(10) DEFAULT NULL,
  `nama_kecamatan` varchar(50) DEFAULT NULL,
  `id_kab_kota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_kelurahan_desa`
--

CREATE TABLE `master_kelurahan_desa` (
  `id_kelurahan_desa` int(11) NOT NULL,
  `kode_kelurahan` varchar(10) DEFAULT NULL,
  `nama_kelurahan` varchar(50) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_provinsi`
--

CREATE TABLE `master_provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `kode_provinsi` varchar(10) DEFAULT NULL,
  `nama_provinsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_kab_kota`
--
ALTER TABLE `master_kab_kota`
  ADD PRIMARY KEY (`id_kab_kota`),
  ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indexes for table `master_kecamatan`
--
ALTER TABLE `master_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`),
  ADD KEY `id_kab_kota` (`id_kab_kota`);

--
-- Indexes for table `master_kelurahan_desa`
--
ALTER TABLE `master_kelurahan_desa`
  ADD PRIMARY KEY (`id_kelurahan_desa`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `master_provinsi`
--
ALTER TABLE `master_provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `master_kab_kota`
--
ALTER TABLE `master_kab_kota`
  ADD CONSTRAINT `master_kab_kota_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `master_provinsi` (`id_provinsi`);

--
-- Constraints for table `master_kecamatan`
--
ALTER TABLE `master_kecamatan`
  ADD CONSTRAINT `master_kecamatan_ibfk_1` FOREIGN KEY (`id_kab_kota`) REFERENCES `master_kab_kota` (`id_kab_kota`);

--
-- Constraints for table `master_kelurahan_desa`
--
ALTER TABLE `master_kelurahan_desa`
  ADD CONSTRAINT `master_kelurahan_desa_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `master_kecamatan` (`id_kecamatan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
