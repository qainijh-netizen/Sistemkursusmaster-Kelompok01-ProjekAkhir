-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2026 at 11:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursus`
--

-- --------------------------------------------------------

--
-- Table structure for table `instruktur`
--

CREATE TABLE `instruktur` (
  `id_instruktur` int NOT NULL,
  `nama_instruktur` varchar(100) DEFAULT NULL,
  `keahlian` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instruktur`
--

INSERT INTO `instruktur` (`id_instruktur`, `nama_instruktur`, `keahlian`, `email`, `no_hp`) VALUES
(1, 'Andi Pratama', 'Web Development', 'andi@mail.com', '0811111111'),
(2, 'Siti Aminah', 'UI/UX', 'siti@mail.com', '0811111112'),
(3, 'Budi Santoso', 'Database', 'budi@mail.com', '0811111113'),
(4, 'Rina Lestari', 'Networking', 'rina@mail.com', '0811111114'),
(5, 'Doni Saputra', 'Marketing', 'doni@mail.com', '0811111115'),
(6, 'Agus Wijaya', 'Android', 'agus@mail.com', '0811111116'),
(7, 'Maya Sari', 'Cyber Security', 'maya@mail.com', '0811111117'),
(8, 'Fajar Nugroho', 'Data Science', 'fajar@mail.com', '0811111118'),
(9, 'Nina Kartika', 'Design', 'nina@mail.com', '0811111119'),
(10, 'Rizky Maulana', 'AI', 'rizky@mail.com', '0811111120');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kursus`
--

CREATE TABLE `jadwal_kursus` (
  `id_jadwal` int NOT NULL,
  `id_kursus` int DEFAULT NULL,
  `id_instruktur` int DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal_kursus`
--

INSERT INTO `jadwal_kursus` (`id_jadwal`, `id_kursus`, `id_instruktur`, `hari`, `jam`) VALUES
(1, 1, 1, 'Senin', '08:00:00'),
(2, 2, 3, 'Selasa', '09:00:00'),
(3, 3, 2, 'Rabu', '10:00:00'),
(4, 4, 4, 'Kamis', '11:00:00'),
(5, 5, 5, 'Jumat', '13:00:00'),
(6, 6, 6, 'Sabtu', '14:00:00'),
(7, 7, 7, 'Minggu', '15:00:00'),
(8, 8, 8, 'Senin', '16:00:00'),
(9, 9, 9, 'Selasa', '17:00:00'),
(10, 10, 10, 'Rabu', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kursus`
--

CREATE TABLE `kursus` (
  `id_kursus` int NOT NULL,
  `nama_kursus` varchar(100) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  `id_instruktur` int DEFAULT NULL,
  `id_lokasi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kursus`
--

INSERT INTO `kursus` (`id_kursus`, `nama_kursus`, `kategori`, `durasi`, `id_instruktur`, `id_lokasi`) VALUES
(1, 'PHP Dasar', 'Programming', 30, 1, 1),
(2, 'MySQL', 'Programming', 25, 3, 1),
(3, 'UI/UX', 'Design', 40, 2, 1),
(4, 'Jaringan', 'Networking', 35, 4, 1),
(5, 'Digital Marketing', 'Marketing', 30, 5, 1),
(6, 'Android', 'Mobile App', 45, 6, 1),
(7, 'Cyber Security', 'Security', 50, 7, 1),
(8, 'Data Science', 'Data Science', 60, 8, 1),
(9, 'CorelDraw', 'Multimedia', 25, 9, 1),
(10, 'Machine Learning', 'AI', 70, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int NOT NULL,
  `nama_lokasi` varchar(100) DEFAULT NULL,
  `tipe` enum('offline','online') NOT NULL DEFAULT 'offline',
  `keterangan` text,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`, `tipe`, `keterangan`, `alamat`) VALUES
(1, 'Ruang A', 'offline', 'Gedung 1 Lt. 1', 'Gedung 1 Lt. 1'),
(2, 'Ruang B', 'offline', 'Gedung 1 Lt. 2', 'Gedung 1 Lt. 2'),
(3, 'Online', 'online', 'Zoom/Google Meet', 'Zoom/Google Meet');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id_membership` int NOT NULL,
  `nama_membership` varchar(50) DEFAULT NULL,
  `benefit` text,
  `durasi` int DEFAULT NULL COMMENT 'durasi dalam hari'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id_membership`, `nama_membership`, `benefit`, `durasi`) VALUES
(1, 'Bronze', 'Akses 1 kursus, sertifikat digital', 30),
(2, 'Silver', 'Akses 3 kursus, sertifikat digital + cetak', 90),
(3, 'Gold', 'Akses unlimited kursus, sertifikat cetak + bingkai', 180);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_pendaftaran` int DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pendaftaran`, `metode_pembayaran`, `tanggal_bayar`, `jumlah`, `status`) VALUES
(1, 1, 'Transfer Bank', '2026-01-01', '500000.00', 'lunas'),
(2, 2, 'E-Wallet', '2026-01-02', '450000.00', 'lunas'),
(3, 3, 'Cash', '2026-01-03', '700000.00', 'lunas'),
(4, 4, 'VA', '2026-01-04', '650000.00', 'lunas'),
(5, 5, 'QRIS', '2026-01-05', '600000.00', 'lunas'),
(6, 6, 'Credit Card', '2026-01-06', '800000.00', 'lunas'),
(7, 7, 'Debit Card', '2026-01-07', '900000.00', 'lunas'),
(8, 8, 'PayPal', '2026-01-08', '1000000.00', 'lunas'),
(9, 9, 'Alfamart', '2026-01-09', '400000.00', 'lunas'),
(10, 10, 'Indomaret', '2026-01-10', '1200000.00', 'lunas');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int NOT NULL,
  `id_peserta` int DEFAULT NULL,
  `id_kursus` int DEFAULT NULL,
  `id_membership` int DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pendaftaran`, `id_peserta`, `id_kursus`, `id_membership`, `tanggal_daftar`, `status`) VALUES
(1, 1, 1, 1, '2026-01-01', 'aktif'),
(2, 2, 2, 2, '2026-01-02', 'aktif'),
(3, 3, 3, 3, '2026-01-03', 'aktif'),
(4, 4, 4, 1, '2026-01-04', 'selesai'),
(5, 5, 5, 2, '2026-01-05', 'aktif'),
(6, 6, 6, 3, '2026-01-06', 'aktif'),
(7, 7, 7, 1, '2026-01-07', 'aktif'),
(8, 8, 8, 2, '2026-01-08', 'aktif'),
(9, 9, 9, 3, '2026-01-09', 'selesai'),
(10, 10, 10, 1, '2026-01-10', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nama`, `email`, `no_hp`, `alamat`) VALUES
(1, 'Aldi', 'aldi@mail.com', '0812000001', 'Surabaya Barat'),
(2, 'Bella', 'bella@mail.com', '0812000002', 'Sidoarjo'),
(3, 'Citra', 'citra@mail.com', '0812000003', 'Malang'),
(4, 'Dimas', 'dimas@mail.com', '0812000004', 'Gresik'),
(5, 'Eka', 'eka@mail.com', '0812000005', 'Sidoarjo'),
(6, 'Fina', 'fina@mail.com', '0812000006', 'Surabaya'),
(7, 'Gilang', 'gilang@mail.com', '0812000007', 'Lamongan'),
(8, 'Hana', 'hana@mail.com', '0812000008', 'Mojokerto'),
(9, 'Ilham', 'ilham@mail.com', '0812000009', 'Jombang'),
(10, 'Jihan', 'jihan@mail.com', '0812000010', 'Bangkalan');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id_sertifikat` int NOT NULL,
  `id_jadwal` int DEFAULT NULL,
  `nomor_sertifikat` varchar(100) DEFAULT NULL,
  `tanggal_terbit` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id_sertifikat`, `id_jadwal`, `nomor_sertifikat`, `tanggal_terbit`) VALUES
(1, 1, 'CERT-001', '2026-02-01'),
(2, 2, 'CERT-002', '2026-02-01'),
(3, 3, 'CERT-003', '2026-02-01'),
(4, 4, 'CERT-004', '2026-02-01'),
(5, 5, 'CERT-005', '2026-02-01'),
(6, 6, 'CERT-006', '2026-02-01'),
(7, 7, 'CERT-007', '2026-02-01'),
(8, 8, 'CERT-008', '2026-02-01'),
(9, 9, 'CERT-009', '2026-02-01'),
(10, 10, 'CERT-010', '2026-02-01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_peserta_kursus`
-- (See below for the actual view)
--
CREATE TABLE `view_peserta_kursus` (
`nama` varchar(100)
,`nama_kursus` varchar(100)
,`tanggal_daftar` date
);

-- --------------------------------------------------------

--
-- Structure for view `view_peserta_kursus`
--
DROP TABLE IF EXISTS `view_peserta_kursus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_peserta_kursus`  AS SELECT `p`.`nama` AS `nama`, `k`.`nama_kursus` AS `nama_kursus`, `pd`.`tanggal_daftar` AS `tanggal_daftar` FROM ((`pendaftaran` `pd` join `peserta` `p` on((`pd`.`id_peserta` = `p`.`id_peserta`))) join `kursus` `k` on((`pd`.`id_kursus` = `k`.`id_kursus`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instruktur`
--
ALTER TABLE `instruktur`
  ADD PRIMARY KEY (`id_instruktur`);

--
-- Indexes for table `jadwal_kursus`
--
ALTER TABLE `jadwal_kursus`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kursus` (`id_kursus`),
  ADD KEY `id_instruktur` (`id_instruktur`);

--
-- Indexes for table `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`id_kursus`),
  ADD KEY `id_instruktur` (`id_instruktur`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id_membership`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pendaftaran` (`id_pendaftaran`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `id_peserta` (`id_peserta`),
  ADD KEY `id_kursus` (`id_kursus`),
  ADD KEY `id_membership` (`id_membership`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id_sertifikat`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instruktur`
--
ALTER TABLE `instruktur`
  MODIFY `id_instruktur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jadwal_kursus`
--
ALTER TABLE `jadwal_kursus`
  MODIFY `id_jadwal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kursus`
--
ALTER TABLE `kursus`
  MODIFY `id_kursus` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id_membership` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id_sertifikat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_kursus`
--
ALTER TABLE `jadwal_kursus`
  ADD CONSTRAINT `jadwal_kursus_ibfk_1` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`),
  ADD CONSTRAINT `jadwal_kursus_ibfk_2` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`);

--
-- Constraints for table `kursus`
--
ALTER TABLE `kursus`
  ADD CONSTRAINT `kursus_ibfk_1` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`),
  ADD CONSTRAINT `kursus_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`);

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`),
  ADD CONSTRAINT `pendaftaran_ibfk_3` FOREIGN KEY (`id_membership`) REFERENCES `membership` (`id_membership`),
  ADD CONSTRAINT `pendaftaran_ibfk_4` FOREIGN KEY (`id_membership`) REFERENCES `membership` (`id_membership`);

--
-- Constraints for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `sertifikat_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_kursus` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
