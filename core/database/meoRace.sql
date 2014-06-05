-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2014 at 06:58 PM
-- Server version: 5.1.70-log
-- PHP Version: 5.5.12-pl0-gentoo

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `meoRace`
--

-- --------------------------------------------------------

--
-- Table structure for table `Checkpoint`
--

DROP TABLE IF EXISTS `Checkpoint`;
CREATE TABLE IF NOT EXISTS `Checkpoint` (
  `checkpointId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `manned` tinyint(1) NOT NULL,
  `raceFk` int(11) NOT NULL,
  PRIMARY KEY (`checkpointId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `Checkpoint`
--

TRUNCATE TABLE `Checkpoint`;
--
-- Dumping data for table `Checkpoint`
--

INSERT INTO `Checkpoint` (`checkpointId`, `name`, `manned`, `raceFk`) VALUES
(1, 'Checkpoint 1', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Parcel`
--

DROP TABLE IF EXISTS `Parcel`;
CREATE TABLE IF NOT EXISTS `Parcel` (
  `parcelId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(256) NOT NULL,
  `raceFk` int(11) NOT NULL,
  PRIMARY KEY (`parcelId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Truncate table before insert `Parcel`
--

TRUNCATE TABLE `Parcel`;
--
-- Dumping data for table `Parcel`
--

INSERT INTO `Parcel` (`parcelId`, `name`, `description`, `raceFk`) VALUES
(3, 'Parcel 2', 'for Race 1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Race`
--

DROP TABLE IF EXISTS `Race`;
CREATE TABLE IF NOT EXISTS `Race` (
  `raceId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `status` enum('prepare','running','closed') NOT NULL,
  PRIMARY KEY (`raceId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Truncate table before insert `Race`
--

TRUNCATE TABLE `Race`;
--
-- Dumping data for table `Race`
--

INSERT INTO `Race` (`raceId`, `name`, `status`) VALUES
(4, 'Race 1', 'prepare'),
(5, 'Race2', 'prepare');

-- --------------------------------------------------------

--
-- Table structure for table `Racer`
--

DROP TABLE IF EXISTS `Racer`;
CREATE TABLE IF NOT EXISTS `Racer` (
  `racerId` int(11) NOT NULL AUTO_INCREMENT,
  `racerNumber` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `city` varchar(80) NOT NULL,
  `country` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `raceFk` int(11) NOT NULL,
  `status` enum('registered','active') NOT NULL,
  PRIMARY KEY (`racerId`),
  UNIQUE KEY `racerNumber` (`raceFk`,`racerNumber`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `Racer`
--

TRUNCATE TABLE `Racer`;
--
-- Dumping data for table `Racer`
--

INSERT INTO `Racer` (`racerId`, `racerNumber`, `name`, `city`, `country`, `email`, `raceFk`, `status`) VALUES
(1, 1, 'Racer 1', 'City', 'Country', 'Mail', 4, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
CREATE TABLE IF NOT EXISTS `Session` (
  `sessionId` varchar(42) NOT NULL,
  `userFk` int(11) NOT NULL,
  `loginTime` datetime NOT NULL,
  `lastActive` datetime NOT NULL,
  PRIMARY KEY (`sessionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `Session`
--

TRUNCATE TABLE `Session`;
--
-- Dumping data for table `Session`
--

INSERT INTO `Session` (`sessionId`, `userFk`, `loginTime`, `lastActive`) VALUES
('8Nqys8MS8z3C2bb2bOFzlHNo9r9gnfkAWV89PiBczz', 0, '2014-06-01 16:19:57', '2014-06-01 16:19:57'),
('ieX66MS4A1fcnN11q9sgmud5rzzjgVTlNUXoSYpWSK', 0, '2014-06-01 16:58:22', '2014-06-01 16:58:22'),
('qA4M9n4dcc3YpGixm9MWWTTTTE8YSzc6SLx9zl0Brd', 7, '2014-06-01 17:03:28', '2014-06-01 17:03:28'),
('jubr7lb3rxdMLFYhdBwfZUpLbNUS0csbMZTRl2jnJJ', 0, '2014-06-01 17:27:24', '2014-06-01 17:27:24'),
('PtvqLsrBGPBZYBaw0X33EdlupPR0r26Pa0vUuYHDmM', 7, '2014-06-01 17:29:11', '2014-06-01 17:29:11'),
('945ciwqkVppjhhcGw0murEXh3f8CoNyGxfL6rhhJws', 0, '2014-06-01 18:12:53', '2014-06-01 18:12:53'),
('ZTktsOkqnHiw7krU3D0zPsj2V32g7TegZ0DwHjeH03', 8, '2014-06-01 18:13:59', '2014-06-01 18:13:59'),
('cd9vgqoyuuDCbcYMrgWzHMNIVc3mT88NPhRomPyzm0', 7, '2014-06-01 18:16:40', '2014-06-01 18:16:40'),
('EFxTys7Z8r0ZKZQ8U1mYhVJpE3F5eA6oZp0hpT19ue', 7, '2014-06-01 19:49:48', '2014-06-01 19:49:48'),
('ixjzGOutfCMBorufFPG1jjgVtGy6NSCkyGU2C56gwQ', 0, '2014-06-01 20:00:06', '2014-06-01 20:00:06'),
('MYDuuUKWoCNM4odKkD9ytZWMGWMY5IipE459NjCQWE', 7, '2014-06-01 20:00:15', '2014-06-01 20:00:15'),
('UhCREk7VPP7u1ofYqiSeXwaxjFzVZvVREPtV8qvvJy', 0, '2014-06-01 20:01:26', '2014-06-01 20:01:26'),
('pJFOZKvhCY3WpV1C3eiuVBrW6PvJA2wMSnsGGzOG66', 7, '2014-06-01 20:02:37', '2014-06-01 20:02:37'),
('Z1JfGa3xmIrLaZP7Jjz50RSEPJI0GQ6XTQYOsfxLHh', 7, '2014-06-01 20:18:50', '2014-06-01 20:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
CREATE TABLE IF NOT EXISTS `Task` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `maxDuration` int(11) NOT NULL COMMENT '[seconds]',
  `currentPrice` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `raceFk` int(11) NOT NULL,
  PRIMARY KEY (`taskId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `Task`
--

TRUNCATE TABLE `Task`;
--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`taskId`, `name`, `maxDuration`, `currentPrice`, `description`, `raceFk`) VALUES
(1, 'Task1', 60, 123, 'Short Task', 4);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `role` varchar(80) NOT NULL,
  `raceFk` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Truncate table before insert `User`
--

TRUNCATE TABLE `User`;
--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userId`, `user`, `password`, `role`, `raceFk`) VALUES
(0, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', -1),
(7, 'master', 'fc613b4dfd6736a7bd268c8a0e74ed0d1c04a959f59dd74ef2874983fd443fc9', 'race master', 4),
(8, 'registration', '29c9c30e0604515ced98b3d14fd88751a8f8e4b9bc69d483a67a257c14ab79fb', 'registration', 4),
(10, 'master2', 'ee33bacb9843d3b4bac37e425b203d8aad4e08c6773d21a10533d66cd6bb7c02', 'race master', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;