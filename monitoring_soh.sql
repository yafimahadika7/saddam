-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2026 pada 07.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoring_soh`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `approval_penggunaan`
--

CREATE TABLE `approval_penggunaan` (
  `id` int(11) NOT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `nomor_part` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `role` enum('ADMIN','TEKNISI') DEFAULT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `aksi` varchar(100) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `debrief`
--

CREATE TABLE `debrief` (
  `id` int(11) NOT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `nomor_part` varchar(50) DEFAULT NULL,
  `mesin_id` varchar(50) DEFAULT NULL,
  `status` enum('PENDING','DONE') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `drop_point`
--

CREATE TABLE `drop_point` (
  `id` int(11) NOT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `nomor_part` varchar(50) DEFAULT NULL,
  `metode` enum('DROP_POINT','EKSPEDISI') DEFAULT NULL,
  `resi` varchar(100) DEFAULT NULL,
  `status` enum('PENDING','PICKED_UP','DONE') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `role` enum('ADMIN','TEKNISI') DEFAULT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `status` enum('UNREAD','READ') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE `sparepart` (
  `id` int(11) NOT NULL,
  `nomor_part` varchar(50) DEFAULT NULL,
  `nama_part` varchar(100) DEFAULT NULL,
  `kategori` enum('HYBRID','MODULE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_teknisi`
--

CREATE TABLE `stock_teknisi` (
  `id` int(11) NOT NULL,
  `zulu_id` varchar(20) DEFAULT NULL,
  `sparepart_id` int(11) DEFAULT NULL,
  `nomor_seri` varchar(50) DEFAULT NULL,
  `nomor_sequence` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `aging` int(11) DEFAULT NULL,
  `tiket_stock` varchar(30) DEFAULT NULL,
  `status_stock` enum('NORMAL','SURPLUS','REQUEST') DEFAULT 'NORMAL',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `teknisi`
--

CREATE TABLE `teknisi` (
  `zulu_id` varchar(20) NOT NULL,
  `nama_teknisi` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `fsl_origin` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Admin SOH', 'admin@soh.com', 'admin123', 'admin'),
(2, 'Teknisi SOH', 'teknisi@soh.com', 'teknisi123', 'teknisi'),
(3, 'Admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(4, 'Teknisi', 'teknisi@gmail.com', 'e21394aaeee10f917f581054d24b031f', 'teknisi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `approval_penggunaan`
--
ALTER TABLE `approval_penggunaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `debrief`
--
ALTER TABLE `debrief`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `drop_point`
--
ALTER TABLE `drop_point`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_part` (`nomor_part`);

--
-- Indeks untuk tabel `stock_teknisi`
--
ALTER TABLE `stock_teknisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zulu_id` (`zulu_id`),
  ADD KEY `sparepart_id` (`sparepart_id`);

--
-- Indeks untuk tabel `teknisi`
--
ALTER TABLE `teknisi`
  ADD PRIMARY KEY (`zulu_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `approval_penggunaan`
--
ALTER TABLE `approval_penggunaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `debrief`
--
ALTER TABLE `debrief`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `drop_point`
--
ALTER TABLE `drop_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock_teknisi`
--
ALTER TABLE `stock_teknisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `stock_teknisi`
--
ALTER TABLE `stock_teknisi`
  ADD CONSTRAINT `stock_teknisi_ibfk_1` FOREIGN KEY (`zulu_id`) REFERENCES `teknisi` (`zulu_id`),
  ADD CONSTRAINT `stock_teknisi_ibfk_2` FOREIGN KEY (`sparepart_id`) REFERENCES `sparepart` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
