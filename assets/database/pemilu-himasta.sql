-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 08 Jan 2021 pada 03.44
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemilu-himasta`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('Admin','KPU','Saksi') NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `role`, `is_active`) VALUES
(1, 'admin', '$2y$12$nIZqFI97Ufx4lRFDUl2vEuJF8FJDLjYvh8KLEq6QcWtVof61vwtwy', 'Admin', 1),
(2, 'kpu_himasta', '$2y$12$N1wKUDZRvhFcBRpBcYsdmuCMgrRxkjsNfqwEaTMnsoExr1y0Rl.IO', 'KPU', 1),
(3, 'saksi_himasta1', '$2y$12$YXZKENvLwlLGmEXqA6n30.TvNAYbhKk4rVkwA558ANAgLfTXWEvzS', 'Saksi', 1),
(4, 'saksi_himasta2', '$2y$12$TAvgf3NuglXC/IW80UT2Aur86DhRy9CEN61eN285YuNDBKun348Gi', 'Saksi', 1),
(5, 'saksi_himasta3', '$2y$12$g7taI67HW0VZqg5F63CgueN.4jRDZWBjCxVYW.8pvtudkIqLlfMl2', 'Saksi', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `candidate`
--

CREATE TABLE `candidate` (
  `candidate_id` int(11) NOT NULL,
  `voting_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `number` tinyint(3) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `election`
--

CREATE TABLE `election` (
  `election_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `election_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_election`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_election` (
`election_id` int(11)
,`attachment` varchar(255)
,`create_at` timestamp
,`election_status` tinyint(1)
,`voter_id` int(11)
,`name` varchar(255)
,`email` varchar(255)
,`angkatan` varchar(10)
,`candidate_id` int(11)
,`voting_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_member`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_member` (
`candidate_id` int(11)
,`voting_id` int(11)
,`candidate_name` varchar(255)
,`candidate_photo` varchar(255)
,`number` tinyint(3)
,`is_active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_recapitulation_candidate`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_recapitulation_candidate` (
`election_id` int(11)
,`candidate_id` int(11)
,`candidate_name` varchar(255)
,`election_total` bigint(21)
,`voting_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_recapitulation_candidate_sah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_recapitulation_candidate_sah` (
`election_id` int(11)
,`candidate_id` int(11)
,`election_sah` bigint(21)
,`voting_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_recapitulation_candidate_tidak_sah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_recapitulation_candidate_tidak_sah` (
`election_id` int(11)
,`candidate_id` int(11)
,`election_tidak_sah` bigint(21)
,`voting_id` int(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `voter`
--

CREATE TABLE `voter` (
  `voter_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `angkatan` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `send_status` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `voter`
--

INSERT INTO `voter` (`voter_id`, `name`, `angkatan`, `email`, `password`, `attachment`, `send_status`, `is_active`) VALUES
(1, NULL, NULL, 'rizalramli993@gmail.com', NULL, NULL, 0, 1),
(2, NULL, NULL, 'hasriwiji@gmail.com', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `voting`
--

CREATE TABLE `voting` (
  `voting_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `voting`
--

INSERT INTO `voting` (`voting_id`, `admin_id`, `name`, `date`, `start`, `end`, `is_active`) VALUES
(1, 1, 'Pemilihan Ketua Himpunan 2021', '2021-01-08', '2021-01-08 06:00:00', '2021-01-08 23:59:00', 1);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_election`
--
DROP TABLE IF EXISTS `view_election`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_election`  AS  select `e`.`election_id` AS `election_id`,`e`.`attachment` AS `attachment`,`e`.`create_at` AS `create_at`,`e`.`election_status` AS `election_status`,`vtr`.`voter_id` AS `voter_id`,`vtr`.`name` AS `name`,`vtr`.`email` AS `email`,`vtr`.`angkatan` AS `angkatan`,`c`.`candidate_id` AS `candidate_id`,`vtg`.`voting_id` AS `voting_id` from (((`election` `e` join `voter` `vtr` on(`e`.`voter_id` = `vtr`.`voter_id`)) join `candidate` `c` on(`e`.`candidate_id` = `c`.`candidate_id`)) join `voting` `vtg` on(`c`.`voting_id` = `vtg`.`voting_id`)) order by `e`.`election_id` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_member`
--
DROP TABLE IF EXISTS `view_member`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_member`  AS  select `c`.`candidate_id` AS `candidate_id`,`c`.`voting_id` AS `voting_id`,`c`.`name` AS `candidate_name`,`c`.`photo` AS `candidate_photo`,`c`.`number` AS `number`,`c`.`is_active` AS `is_active` from `candidate` `c` order by `c`.`number` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_recapitulation_candidate`
--
DROP TABLE IF EXISTS `view_recapitulation_candidate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_recapitulation_candidate`  AS  select `e`.`election_id` AS `election_id`,`c`.`candidate_id` AS `candidate_id`,`c`.`name` AS `candidate_name`,count(`c`.`candidate_id`) AS `election_total`,`v`.`voting_id` AS `voting_id` from ((`election` `e` join `candidate` `c` on(`e`.`candidate_id` = `c`.`candidate_id`)) join `voting` `v` on(`c`.`voting_id` = `v`.`voting_id`)) group by `c`.`candidate_id`,`v`.`voting_id` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_recapitulation_candidate_sah`
--
DROP TABLE IF EXISTS `view_recapitulation_candidate_sah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_recapitulation_candidate_sah`  AS  select `e`.`election_id` AS `election_id`,`c`.`candidate_id` AS `candidate_id`,count(`c`.`candidate_id`) AS `election_sah`,`v`.`voting_id` AS `voting_id` from ((`election` `e` join `candidate` `c` on(`e`.`candidate_id` = `c`.`candidate_id`)) join `voting` `v` on(`c`.`voting_id` = `v`.`voting_id`)) where `e`.`election_status` = 1 group by `c`.`candidate_id`,`v`.`voting_id` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_recapitulation_candidate_tidak_sah`
--
DROP TABLE IF EXISTS `view_recapitulation_candidate_tidak_sah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_recapitulation_candidate_tidak_sah`  AS  select `e`.`election_id` AS `election_id`,`c`.`candidate_id` AS `candidate_id`,count(`c`.`candidate_id`) AS `election_tidak_sah`,`v`.`voting_id` AS `voting_id` from ((`election` `e` join `candidate` `c` on(`e`.`candidate_id` = `c`.`candidate_id`)) join `voting` `v` on(`c`.`voting_id` = `v`.`voting_id`)) where `e`.`election_status` = 0 group by `c`.`candidate_id`,`v`.`voting_id` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`candidate_id`);

--
-- Indeks untuk tabel `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`election_id`);

--
-- Indeks untuk tabel `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`voter_id`);

--
-- Indeks untuk tabel `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`voting_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `candidate`
--
ALTER TABLE `candidate`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `election`
--
ALTER TABLE `election`
  MODIFY `election_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `voter`
--
ALTER TABLE `voter`
  MODIFY `voter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `voting`
--
ALTER TABLE `voting`
  MODIFY `voting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
