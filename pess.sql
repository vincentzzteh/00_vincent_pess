-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2015 at 02:19 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pessdb`
--
CREATE DATABASE IF NOT EXISTS `pessdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pessdb`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
CREATE TABLE IF NOT EXISTS `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
CREATE TABLE IF NOT EXISTS `incident` (
`incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(2, 'cindy', '91234567', '030', 'hougang', 'help', '2', '2014-04-26 01:26:58'),
(3, 'cindy', '98989898', '040', 'sengkang', 'dfdfdfd', '3', '2014-05-21 03:41:33'),
(8, 'peter', '1234567', '030', 'sengkang', 'l', '3', '2015-02-14 07:09:39'),
(9, 'ginee', 's1234566a', '020', 'amk', 'dfd', '3', '2015-02-15 07:02:56'),
(10, 'cindy', '12345678', '010', 'amk', 'd', '3', '2015-02-15 07:05:30'),
(11, 'Sam Ho', '81234567', '030', 'ang mo kio', 'urgent\r\ncome quitk', '3', '2015-04-04 12:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

DROP TABLE IF EXISTS `incident_status`;
CREATE TABLE IF NOT EXISTS `incident_status` (
  `incident_status_id` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_status_id`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

DROP TABLE IF EXISTS `incident_type`;
CREATE TABLE IF NOT EXISTS `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

DROP TABLE IF EXISTS `patrolcar`;
CREATE TABLE IF NOT EXISTS `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1111A', '3'),
('QX1123V', '1'),
('QX2222B', '3'),
('QX3333C', '3'),
('QX4444D', '1'),
('QX5555E', '3'),
('QX6666F', '3'),
('QX7777G', '2'),
('QX8888H', '3'),
('QX9999I', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

DROP TABLE IF EXISTS `patrolcar_status`;
CREATE TABLE IF NOT EXISTS `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'Arrived');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
 ADD PRIMARY KEY (`incident_id`,`patrolcar_id`), ADD KEY `patrolcar_id` (`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
 ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
 ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
 ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
 ADD PRIMARY KEY (`patrolcar_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
 ADD PRIMARY KEY (`patrolcar_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `incident` (`incident_id`),
ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`patrolcar_id`) REFERENCES `patrolcar` (`patrolcar_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
