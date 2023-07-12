-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 05:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `am_do_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_tugas`
--

CREATE TABLE `detail_tugas` (
  `id_detail_tugas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `keterangan_tugas` varchar(50) NOT NULL,
  `level` enum('Penting','Kurang Penting') NOT NULL,
  `status` enum('Selesai','Belum Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `tanggal`, `keterangan_tugas`, `level`, `status`) VALUES
(1, '2023-07-09 14:38:45', 'Belajar Java', 'Penting', 'Belum Selesai'),
(2, '2023-07-09 14:40:47', 'Tugas kelompok Pemrograman Mobile', 'Penting', 'Belum Selesai'),
(3, '2023-07-09 15:04:47', 'Futsal temen kantor', 'Kurang Penting', 'Belum Selesai'),
(4, '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `password`) VALUES
(2, 'Adi Sobari', 'sobari', '1234'),
(3, 'Dinda Silvia', 'dinda', '1234'),
(8, 'Ade Muslim', 'ademuslim', '1212'),
(9, 'Arsyila', 'cia1234', '1234'),
(11, 'Syari', 'sari', '1414'),
(12, 't', 't', 't');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  ADD PRIMARY KEY (`id_detail_tugas`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tugas` (`id_tugas`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  MODIFY `id_detail_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  ADD CONSTRAINT `detail_tugas_ibfk_1` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`id_tugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_tugas_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
