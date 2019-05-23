-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Bulan Mei 2019 pada 11.28
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `Kd_Anggota` int(11) NOT NULL,
  `Nama` varchar(225) NOT NULL,
  `Prodi` varchar(225) NOT NULL,
  `Jenjang` varchar(225) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`Kd_Anggota`, `Nama`, `Prodi`, `Jenjang`, `Alamat`) VALUES
(1, 'Sekar', 'Ilkom', 'S1', 'Tabanan'),
(2, 'Ega', 'Ilkom', 'S1', 'Tabanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `Kd_Register` int(11) NOT NULL,
  `JudulBuku` varchar(225) NOT NULL,
  `Pengarang` varchar(225) NOT NULL,
  `Penerbit` varchar(225) NOT NULL,
  `TahunTerbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`Kd_Register`, `JudulBuku`, `Pengarang`, `Penerbit`, `TahunTerbit`) VALUES
(1, 'Sensor', 'Affrudin', 'Bumi', 0000),
(2, 'IOT', 'Affrudin', 'Bumi', 2017),
(6, 'Jaringan', 'Affrudin', 'Bumi', 2018),
(7, 'Web', 'Affrudin', 'Bumi', 2019);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `Kd_register` int(11) NOT NULL,
  `Kd_pinjam` int(11) NOT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`Kd_register`, `Kd_pinjam`, `Tgl_pinjam`, `Tgl_kembali`) VALUES
(1, 4, '2019-04-27', '2019-04-27'),
(6, 5, '2019-04-27', NULL),
(1, 6, '2019-05-04', '2019-05-04'),
(6, 7, '2019-05-04', NULL),
(6, 8, '2019-05-09', NULL),
(7, 9, '2019-05-09', NULL),
(6, 10, '2019-05-09', NULL),
(2, 11, '2019-05-09', NULL),
(6, 12, '2019-05-09', NULL),
(6, 13, '2019-05-09', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `Kd_pinjam` int(11) NOT NULL,
  `Kd_anggota` int(11) NOT NULL,
  `Kd_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`Kd_pinjam`, `Kd_anggota`, `Kd_petugas`) VALUES
(4, 1, 2),
(12, 2, 5),
(13, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `Kd_Petugas` int(11) NOT NULL,
  `Nama` varchar(225) NOT NULL,
  `Alamat` text NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `last_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`Kd_Petugas`, `Nama`, `Alamat`, `username`, `password`, `last_login`) VALUES
(1, 'sekarmerta', 'Tabanan', 'sekar', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-04'),
(2, 'mertaputri', 'Tabanan', 'merta', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00'),
(5, 'desakputri', 'Tabanan', 'putri', 'e10adc3949ba59abbe56e057f20f883e', '2019-05-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `level` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `level`) VALUES
(1, 'sekar1', 'e10adc3949ba59abbe56e057f20f883e', 1),
(2, 'merta1', 'e10adc3949ba59abbe56e057f20f883e', 1),
(5, 'putri1', 'e10adc3949ba59abbe56e057f20f883e', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`Kd_Anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Kd_Register`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`Kd_pinjam`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Kd_Petugas`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `Kd_Anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `Kd_Register` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `Kd_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `Kd_Petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
