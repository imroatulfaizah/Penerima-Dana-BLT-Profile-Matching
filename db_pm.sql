-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2021 at 07:30 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_alternatif`
--

DROP TABLE IF EXISTS `tb_alternatif`;
CREATE TABLE IF NOT EXISTS `tb_alternatif` (
  `id_alternatif` varchar(70) NOT NULL,
  `kode_alternatif` varchar(100) NOT NULL,
  `nama_alternatif` varchar(150) NOT NULL,
  PRIMARY KEY (`id_alternatif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alternatif`
--

INSERT INTO `tb_alternatif` (`id_alternatif`, `kode_alternatif`, `nama_alternatif`) VALUES
('5c07ab930d6b5', '5315032304920001', 'WIHELMUS MEMO'),
('5c07abb380826', '5315030308890001', 'PRIMUS ADI NGATOM'),
('5c07ac27a9f7f', '5315036510950001', 'MELANIA BUPU'),
('5c235a78768d1', '5315076607940002', 'AVELINA MAYA'),
('615c83b45a65f', '5315037006920001', 'EMILIYANA JENGONG ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_aspek`
--

DROP TABLE IF EXISTS `tb_aspek`;
CREATE TABLE IF NOT EXISTS `tb_aspek` (
  `id_aspek` varchar(70) NOT NULL,
  `kode_aspek` varchar(6) NOT NULL,
  `nama_aspek` varchar(150) NOT NULL,
  `bobot` int(3) NOT NULL,
  PRIMARY KEY (`id_aspek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_aspek`
--

INSERT INTO `tb_aspek` (`id_aspek`, `kode_aspek`, `nama_aspek`, `bobot`) VALUES
('5c0a2a2167452', 'K04', 'STATUS PEKERJAAN', 20),
('5c0a2a3b87d03', 'K02', 'STATUS PENDUDUK', 20),
('5c0a2a5902c8d', 'K03', 'KELUARGA TIDAK MAMPU', 30),
('5c0a2a7074dc9', 'K01', 'STATUS PENERIMA', 30);

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil`
--

DROP TABLE IF EXISTS `tb_hasil`;
CREATE TABLE IF NOT EXISTS `tb_hasil` (
  `id_hasil` varchar(70) NOT NULL,
  `id_alternatif` varchar(70) NOT NULL,
  `hasil` double NOT NULL,
  PRIMARY KEY (`id_hasil`),
  KEY `fk_hasil_alternatif` (`id_alternatif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_hasil`
--

INSERT INTO `tb_hasil` (`id_hasil`, `id_alternatif`, `hasil`) VALUES
('616eabee1950d', '5c07ab930d6b5', 1.5633333333333),
('616eabee24b06', '5c07abb380826', 1.5633333333333),
('616eabee291a4', '5c07ac27a9f7f', 1.5633333333333),
('616eabee2caea', '5c235a78768d1', 1.5633333333333),
('616eabee31485', '615c83b45a65f', 1.5633333333333);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penilaian`
--

DROP TABLE IF EXISTS `tb_penilaian`;
CREATE TABLE IF NOT EXISTS `tb_penilaian` (
  `id_penilaian` varchar(70) NOT NULL,
  `id_alternatif` varchar(70) NOT NULL,
  `id_sub_kriteria` varchar(70) NOT NULL,
  `skor` int(3) NOT NULL,
  KEY `fk_sub_kriteria` (`id_sub_kriteria`),
  KEY `fk_alternatif` (`id_alternatif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penilaian`
--

INSERT INTO `tb_penilaian` (`id_penilaian`, `id_alternatif`, `id_sub_kriteria`, `skor`) VALUES
('616d642a7cca5', '5c07ab930d6b5', '5c0f0b4f7d558', 5),
('616d642a7ccb0', '5c07ab930d6b5', '5c0f0b6cb7f6a', 5),
('616d642a7ccb5', '5c07ab930d6b5', '5c0f0bd7f11e5', 5),
('616d642a7ccbb', '5c07ab930d6b5', '5c0f0bf5353b4', 5),
('616d642a7ccbf', '5c07ab930d6b5', '616d54c781464', 5),
('616d642a7ccc4', '5c07ab930d6b5', '616d548e74f98', 5),
('616d642a7ccc9', '5c07ab930d6b5', '5c0f0c1481601', 5),
('616d642a7ccce', '5c07ab930d6b5', '5c0f0c2a2c71c', 5),
('616d642a7ccd2', '5c07ab930d6b5', '616d53d7563cc', 5),
('616d642a7ccd8', '5c07ab930d6b5', '5c0f0c4f5b6af', 5),
('616d642a7ccdc', '5c07ab930d6b5', '5c0f0c7ee072a', 5),
('616d642a7cce1', '5c07abb380826', '5c0f0b4f7d558', 5),
('616d642a7cce6', '5c07abb380826', '5c0f0b6cb7f6a', 5),
('616d642a7cceb', '5c07abb380826', '5c0f0bd7f11e5', 5),
('616d642a7ccf0', '5c07abb380826', '5c0f0bf5353b4', 5),
('616d642a7ccf5', '5c07abb380826', '616d54c781464', 5),
('616d642a7ccfc', '5c07abb380826', '616d548e74f98', 5),
('616d642a7cd01', '5c07abb380826', '5c0f0c1481601', 5),
('616d642a7cd06', '5c07abb380826', '5c0f0c2a2c71c', 5),
('616d642a7cd0b', '5c07abb380826', '616d53d7563cc', 5),
('616d642a7cd10', '5c07abb380826', '5c0f0c4f5b6af', 5),
('616d642a7cd14', '5c07abb380826', '5c0f0c7ee072a', 5),
('616d642a7cd19', '5c07ac27a9f7f', '5c0f0b4f7d558', 5),
('616d642a7cd1e', '5c07ac27a9f7f', '5c0f0b6cb7f6a', 5),
('616d642a7cd22', '5c07ac27a9f7f', '5c0f0bd7f11e5', 5),
('616d642a7cd27', '5c07ac27a9f7f', '5c0f0bf5353b4', 5),
('616d642a7cd2c', '5c07ac27a9f7f', '616d54c781464', 5),
('616d642a7cd31', '5c07ac27a9f7f', '616d548e74f98', 5),
('616d642a7cd35', '5c07ac27a9f7f', '5c0f0c1481601', 5),
('616d642a7cd3a', '5c07ac27a9f7f', '5c0f0c2a2c71c', 5),
('616d642a7cd3f', '5c07ac27a9f7f', '616d53d7563cc', 5),
('616d642a7cd44', '5c07ac27a9f7f', '5c0f0c4f5b6af', 5),
('616d642a7cd49', '5c07ac27a9f7f', '5c0f0c7ee072a', 5),
('616d642a7cd4d', '5c235a78768d1', '5c0f0b4f7d558', 5),
('616d642a7cd52', '5c235a78768d1', '5c0f0b6cb7f6a', 5),
('616d642a7cd57', '5c235a78768d1', '5c0f0bd7f11e5', 5),
('616d642a7cd5c', '5c235a78768d1', '5c0f0bf5353b4', 5),
('616d642a7cd61', '5c235a78768d1', '616d54c781464', 5),
('616d642a7cd65', '5c235a78768d1', '616d548e74f98', 5),
('616d642a7cd6a', '5c235a78768d1', '5c0f0c1481601', 5),
('616d642a7cd6f', '5c235a78768d1', '5c0f0c2a2c71c', 5),
('616d642a7cd73', '5c235a78768d1', '616d53d7563cc', 5),
('616d642a7cd78', '5c235a78768d1', '5c0f0c4f5b6af', 5),
('616d642a7cd7c', '5c235a78768d1', '5c0f0c7ee072a', 5),
('616d642a7cd81', '615c83b45a65f', '5c0f0b4f7d558', 5),
('616d642a7cd86', '615c83b45a65f', '5c0f0b6cb7f6a', 5),
('616d642a7cd8a', '615c83b45a65f', '5c0f0bd7f11e5', 5),
('616d642a7cd8f', '615c83b45a65f', '5c0f0bf5353b4', 5),
('616d642a7cd94', '615c83b45a65f', '616d54c781464', 5),
('616d642a7cd99', '615c83b45a65f', '616d548e74f98', 5),
('616d642a7cd9e', '615c83b45a65f', '5c0f0c1481601', 5),
('616d642a7cda2', '615c83b45a65f', '5c0f0c2a2c71c', 5),
('616d642a7cda9', '615c83b45a65f', '616d53d7563cc', 5),
('616d642a7cdaf', '615c83b45a65f', '5c0f0c4f5b6af', 5),
('616d642a7cdb3', '615c83b45a65f', '5c0f0c7ee072a', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sub_kriteria`
--

DROP TABLE IF EXISTS `tb_sub_kriteria`;
CREATE TABLE IF NOT EXISTS `tb_sub_kriteria` (
  `id_sub_kriteria` varchar(70) NOT NULL,
  `id_aspek` varchar(70) NOT NULL,
  `kode_sub_kriteria` varchar(50) NOT NULL,
  `nama_sub_kriteria` varchar(150) NOT NULL,
  `nilai_sub_kriteria` int(3) NOT NULL,
  `bobot` int(3) NOT NULL,
  `keterangan` varchar(3) NOT NULL,
  PRIMARY KEY (`id_sub_kriteria`),
  KEY `id_aspek` (`id_aspek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sub_kriteria`
--

INSERT INTO `tb_sub_kriteria` (`id_sub_kriteria`, `id_aspek`, `kode_sub_kriteria`, `nama_sub_kriteria`, `nilai_sub_kriteria`, `bobot`, `keterangan`) VALUES
('5c0f0b4f7d558', '5c0a2a2167452', 'JT', 'Pengangguran', 5, 60, 'CF'),
('5c0f0b6cb7f6a', '5c0a2a2167452', 'JL', 'Petani', 5, 40, 'SF'),
('5c0f0bd7f11e5', '5c0a2a3b87d03', 'AK', 'Warga desa', 5, 70, 'CF'),
('5c0f0bf5353b4', '5c0a2a3b87d03', 'AJ', 'Orang asli Lembor', 4, 30, 'SF'),
('5c0f0c1481601', '5c0a2a5902c8d', 'PK', 'Penghasilan keluarga', 4, 25, 'CF'),
('5c0f0c2a2c71c', '5c0a2a5902c8d', 'JAK', 'Jumlah anggota keluarga', 5, 25, 'SF'),
('5c0f0c4f5b6af', '5c0a2a7074dc9', 'S01', 'Bukan termasuk penerima BNPT', 5, 50, 'CF'),
('5c0f0c7ee072a', '5c0a2a7074dc9', 'S02', 'Tidak menerima PKH', 5, 50, 'SF'),
('616d53d7563cc', '5c0a2a7074dc9', 'S03', 'Tidak memiliki kartu prakerja', 4, 20, 'CF'),
('616d548e74f98', '5c0a2a5902c8d', 'PMK', 'Memiliki anggota keluarga yang rentan sakit menahun/kronis', 5, 25, 'CF'),
('616d54c781464', '5c0a2a5902c8d', 'DTKS', 'Keluarga miskin yang sudah terdata/belum dalam DTKS)', 4, 25, 'CF');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` datetime NOT NULL,
  `status` enum('1','0') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `password`, `jenis_kelamin`, `telepon`, `tgl_buat`, `tgl_ubah`, `status`) VALUES
(1, 'superadmin', 'superadmin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'L', '085383345262', '2018-12-01 03:10:19', '2018-12-05 02:06:07', '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_hasil`
--
ALTER TABLE `tb_hasil`
  ADD CONSTRAINT `fk_hasil_alternatif` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `fk_alternatif` FOREIGN KEY (`id_alternatif`) REFERENCES `tb_alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sub_kriteria` FOREIGN KEY (`id_sub_kriteria`) REFERENCES `tb_sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_sub_kriteria`
--
ALTER TABLE `tb_sub_kriteria`
  ADD CONSTRAINT `fk_sub_aspek` FOREIGN KEY (`id_aspek`) REFERENCES `tb_aspek` (`id_aspek`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
