-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 22, 2020 at 07:12 PM
-- Server version: 5.7.26-29-log
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbe68tbecdmtuw`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('Admin','KPU','Saksi') NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `role`, `is_active`) VALUES
(1, 'adminfh1', '$2y$10$p3K3e51EJVYqr8Wtph9qU.JFZ82Fs00JPJIDZ4D4m1kuzXgY6iauO', 'Admin', 1),
(2, 'kpufh1', '$2y$10$ylfb3ekV.I2EFKqvcCuoZ.UB2Okv5SB2q8Q3IDVt75TQ/UHGn8kzi', 'KPU', 1),
(3, 'saksifh1', '$2y$10$rteK4zlKfDL5Z2duMqv4y.D5EVQNgpZ0zAy2LA9NWRppitRwrmqS2', 'Saksi', 1),
(4, 'saksifh2', '$2y$10$J6ySfu2ybSp5wfKajF.5x.2t3cWgbj18u06P0Mw9iYj5YPiqWz1eu', 'Saksi', 1),
(5, 'saksifh3', '$2y$10$vmzD2JWMZTmkJ4TA9PwkkeYMKE2qTAdPGzS.3C8DeGIZnzpDqUXyi', 'Saksi', 1),
(6, 'saksifh4', '$2y$10$VHHBGijxoyI8RTM35xeewupXDM9GCEokkJSJTYjUc7vHLBzP4qhPa', 'Saksi', 1),
(7, 'saksifh5', '$2y$10$T/5FYX9KCPgzvVCwmssYkuSDoVnKKvqaXlUtGr4/xL/q67LWqInP6', 'Saksi', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
