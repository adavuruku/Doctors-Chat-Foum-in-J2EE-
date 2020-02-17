-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2019 at 07:23 PM
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
(1, 'DOC188371', 'Adama Usman Bello', 'adamsgoogle@gmail.com', '08164377187', 'Male', 'Rivers', 'Nigeria', 'Kano', '0', '1', 'D41 APO Settllement Abuja Nigeria', '1111'),
(2, 'DOC198546', 'Abubakar Usman D.', 'adamskutigy@yahoo.com', '07034761741', 'Male', 'Abuja', 'Nigeria', 'Bauchi', '0', '0', 'Sam Ojo Adieu Street, Main Road.', '2222');

-- --------------------------------------------------------

--
-- Table structure for table `doctorpost`
--

CREATE TABLE `doctorpost` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `postid` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `docid` varchar(150) NOT NULL,
  `datePost` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorpost`
--

INSERT INTO `doctorpost` (`id`, `title`, `postid`, `content`, `docid`, `datePost`, `status`) VALUES
(1, 'Lorem Ipsum Loresita Meta AdunDil Commaise Notan BuLL', 'POS18153590', 'Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.', 'DOC188371', '2019-12-01', '0'),
(2, 'Lorem Ipsum Loresita Meta AdunDil Commaise Notan BuLL', 'POS15521707', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.', 'DOC188371', '2019-12-01', '0'),
(3, 'Congress Of Doctor Forum Namibia Heroes', 'POS17623589', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. \r\n                                    ', 'DOC188371', '2019-12-01', '0'),
(4, 'New Tech In Treatment Of Cancer.', 'POS19628602', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n\r\n\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n                                    \r\n                                    ', 'DOC188371', '2019-12-01', '1'),
(5, 'Nigerians Prospect Of Traditional Medicine And Its Reciprocants', 'POS11122268', 'Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.', 'DOC188371', '2019-12-01', '0'),
(6, 'The Health Sector And The Bogius Sarcasism Of Nigeria 2019 Budget', 'POS17146072', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n\r\n\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\nThis Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.\r\n                                    \r\n                                    \r\n                                \r\n                                ', 'DOC188371', '2019-12-01', '0'),
(7, 'African Malaria Conquest And Stereoscope', 'POS10890462', 'Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.', 'DOC188371', '2019-12-01', '0');

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
-- Table structure for table `postcomments`
--

CREATE TABLE `postcomments` (
  `id` int(11) NOT NULL,
  `postid` varchar(200) NOT NULL,
  `commentid` varchar(200) NOT NULL,
  `docCommentid` varchar(200) NOT NULL,
  `dateComment` date NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postcomments`
--

INSERT INTO `postcomments` (`id`, `postid`, `commentid`, `docCommentid`, `dateComment`, `comment`) VALUES
(1, 'POS10890462', 'COM1418829180', 'DOC188371', '2019-12-01', 'Doctor in this group. This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you cr'),
(2, 'POS10890462', 'COM1724703165', 'DOC188371', '2019-12-01', 'Doctor in this group. This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you cr'),
(3, 'POS10890462', 'COM1080481341', 'DOC188371', '2019-12-01', 'Doctor in this group. This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you cr'),
(4, 'POS19628602', 'COM1996395670', 'DOC188371', '2019-12-01', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.'),
(5, 'POS19628602', 'COM1896809673', 'DOC188371', '2019-12-01', 'This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group.'),
(6, 'POS10890462', 'COM1536720531', 'DOC198546', '2019-12-01', 'Doctor in this group. This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group'),
(7, 'POS10890462', 'COM1639805389', 'DOC198546', '2019-12-01', 'Doctor in this group. This Page Provides A Platform for A Doctor To Create A Post.!! You should be mindfull of thepost you created as you will be hold responsible for any harm it might cause other. Note that the post will be visible for viewing and comment by every Doctor in this group');

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
-- Indexes for table `doctorpost`
--
ALTER TABLE `doctorpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencearchieve`
--
ALTER TABLE `experiencearchieve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postcomments`
--
ALTER TABLE `postcomments`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctorpost`
--
ALTER TABLE `doctorpost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `experiencearchieve`
--
ALTER TABLE `experiencearchieve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `qualprof`
--
ALTER TABLE `qualprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
