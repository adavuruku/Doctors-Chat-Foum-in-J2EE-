-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 08:23 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctors`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `id` int(11) NOT NULL,
  `adminId` varchar(200) NOT NULL,
  `adminName` varchar(250) NOT NULL,
  `adminPword` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`id`, `adminId`, `adminName`, `adminPword`) VALUES
(1, 'admin', 'Zainab Ibeto', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `doctorinfo`
--

CREATE TABLE `doctorinfo` (
  `id` int(11) NOT NULL,
  `docId` varchar(200) NOT NULL,
  `docName` varchar(250) NOT NULL,
  `docEmail` varchar(200) NOT NULL,
  `docPhone` varchar(20) NOT NULL,
  `docGender` varchar(20) NOT NULL,
  `docState` varchar(20) NOT NULL,
  `docCountry` varchar(250) NOT NULL,
  `docLocalGov` varchar(250) NOT NULL,
  `docview` varchar(5) NOT NULL DEFAULT '0',
  `docLogin` varchar(5) NOT NULL DEFAULT '0',
  `docContact` text NOT NULL,
  `docPassword` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorinfo`
--

INSERT INTO `doctorinfo` (`id`, `docId`, `docName`, `docEmail`, `docPhone`, `docGender`, `docState`, `docCountry`, `docLocalGov`, `docview`, `docLogin`, `docContact`, `docPassword`) VALUES
(1, 'DOC188371', 'Adama Usman Bello', 'adamsgoogle@gmail.com', '08164377187', 'Male', 'Rivers', 'Nigeria', 'Kano', '0', '1', 'D41 APO Settllement Abuja Nigeria', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `experiencearchieve`
--

CREATE TABLE `experiencearchieve` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `details` text NOT NULL,
  `year` date NOT NULL,
  `type` varchar(5) NOT NULL,
  `docId` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experiencearchieve`
--

INSERT INTO `experiencearchieve` (`id`, `title`, `details`, `year`, `type`, `docId`) VALUES
(1, 'Garki Hospital Abuja', 'ENT Consultant and medical Assitance', '0010-10-10', '0', 'DOC188371'),
(2, 'Afao MEDICAL lIBRARY', 'Chief Medical Consultant                                         ', '0017-06-09', '0', 'DOC188371'),
(5, 'Best ENT Emiritus West Africa', 'Issued By WHO in collaboration with UNN.', '0013-08-11', '1', 'DOC188371');

-- --------------------------------------------------------

--
-- Table structure for table `qualprof`
--

CREATE TABLE `qualprof` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `school` text NOT NULL,
  `year` date NOT NULL,
  `type` varchar(5) NOT NULL,
  `docid` varchar(200) NOT NULL,
  `course` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qualprof`
--

INSERT INTO `qualprof` (`id`, `title`, `school`, `year`, `type`, `docid`, `course`) VALUES
(1, 'BTech Medical', 'Abubakar Tafawa Balewa University Bauchi', '2009-05-11', '0', 'DOC188371', 'Medical Science'),
(2, 'BTech Medical', 'Abubakar Tafawa Balewa University Bauchi', '2008-12-07', '1', 'DOC188371', 'Medical Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorinfo`
--
ALTER TABLE `doctorinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencearchieve`
--
ALTER TABLE `experiencearchieve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualprof`
--
ALTER TABLE `qualprof`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admininfo`
--
ALTER TABLE `admininfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctorinfo`
--
ALTER TABLE `doctorinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experiencearchieve`
--
ALTER TABLE `experiencearchieve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qualprof`
--
ALTER TABLE `qualprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
