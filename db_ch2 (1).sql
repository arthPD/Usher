-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2017 at 12:07 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ch2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(5) NOT NULL,
  `service_id` int(3) NOT NULL,
  `total` int(70) NOT NULL,
  `first` int(5) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `service_id`, `total`, `first`, `date`, `note`) VALUES
(1, 1, 0, 0, '2017-03-19 01:43:17', 'Youth service baby'),
(2, 3, 0, 0, '2017-03-19 12:31:52', 'wafawfawf'),
(3, 3, 0, 0, '2017-03-19 14:18:59', 'note'),
(4, 4, 0, 0, '2017-03-19 14:51:58', ''),
(5, 3, 0, 0, '2017-03-19 14:52:17', ''),
(6, 1, 0, 0, '2017-03-19 14:56:27', ''),
(7, 1, 0, 0, '2017-03-19 14:58:07', ''),
(8, 2, 0, 0, '2017-03-19 14:59:00', ''),
(9, 4, 0, 0, '2017-03-19 14:59:50', ''),
(10, 3, 0, 0, '2017-03-19 15:00:41', ''),
(11, 1, 0, 0, '2017-03-19 16:18:21', ''),
(12, 2, 0, 0, '2017-03-19 16:20:04', ''),
(13, 1, 0, 0, '2017-03-19 16:22:34', ''),
(14, 2, 0, 0, '2017-03-19 16:24:03', '');

-- --------------------------------------------------------

--
-- Table structure for table `attendancemember`
--

CREATE TABLE `attendancemember` (
  `attendance_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `birthdate` varchar(30) NOT NULL,
  `address` varchar(250) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `birthdate`, `address`, `contact_no`, `note`, `image`) VALUES
(1, 'Arth Pogi', 'March 10, 2007', 'wewewewww', '091239239', 'wfjkwlafjkwa', ''),
(2, 'John Lennon', 'October 09, 1940', 'Liverpool, England', '09123123123', 'Beatles | Vocals', ''),
(3, 'Paul McCartney', 'June 18, 1942', 'Liverpool, England', '09123123123', 'Bassist, Vocals | Beatles', ''),
(4, 'Ringo Starr', 'July 07, 1940', 'Liverpool, England', '0912321312313', 'Drummer | The Beatles', ''),
(5, 'George Harrison', 'February 25, 1943', 'Liverpool, England', '09123123123', 'Lead Guitarist, Vocals | The Beatles', ''),
(9, 'Ross Geller', 'February 03, 1970', 'New York, New York', '0912123123', 'F.R.I.E.N.D.S', ''),
(10, 'Phoebe Buffay', 'March 18, 2007', 'New York, New York', '09123123123', 'F.R.I.E.N.D.S', ''),
(11, 'Chandler Bing', 'March 18, 2007', 'New York, New York', '09123123123', 'F.R.I.E.N.D.S', ''),
(18, 'Rachel Green', 'March 18, 2007', 'New York, New Yowk', '0912312313', 'F.R.I.E.N.D.S', ''),
(19, 'Joey Tribbiani', 'March 18, 2007', 'Italy', '01231231', 'F.R.I.E.N.D.S', '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`) VALUES
(1, 'Youth Service', 'Sundays |  4:00PM - 6:00PM'),
(2, 'Morning Service', 'Sundays | 9:30AM - 11:30AM'),
(3, 'Mosh with Jesus', 'Last sunday of the month | 6PM | P50'),
(4, 'Midweek Service', 'Wednesday | 7pm-8:30pm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `attendancemember`
--
ALTER TABLE `attendancemember`
  ADD KEY `member_id` (`member_id`),
  ADD KEY `attendance_id` (`attendance_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
