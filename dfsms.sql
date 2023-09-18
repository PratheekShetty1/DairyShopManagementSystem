-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2023 at 07:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dfsms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `display` (IN `cid` INT)   select * from tblproducts$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_name_change` (IN `aid` INT, IN `name` VARCHAR(20))   UPDATE tblproducts
SET ProductName=name
WHERE id=aid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(5) NOT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` char(45) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`, `UpdationDate`) VALUES
(1, 'Admin', 'admin', 9876543211, 'admin@test.com', 'f925916e2754e5e03f75dd58a5733251', '2022-12-22 18:30:00', '2023-05-10 13:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `CategoryCode` varchar(50) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `CategoryCode`, `PostingDate`) VALUES
(1, 'Milk', 'MK01', '2023-12-24 16:27:43'),
(2, 'Butter', 'BT01', '2023-01-04 16:05:06'),
(3, 'Bread', 'BD01', '2023-01-05 16:28:12'),
(4, 'Paneer', 'PN01', '2023-01-06 16:29:18'),
(5, 'Soya', 'SY01', '2023-01-04 16:29:58'),
(7, 'Ghee', 'GH01', '2023-01-05 14:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`id`, `CompanyName`, `PostingDate`) VALUES
(1, 'Amul', '2023-01-06 03:30:51'),
(2, 'Mother Diary', '2023-01-06 03:30:59'),
(3, 'Patanjali', '2023-01-06 03:31:09'),
(4, 'Nandini', '2023-01-06 03:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `InvoiceNumber` int(11) DEFAULT NULL,
  `CustomerName` varchar(150) DEFAULT NULL,
  `CustomerContactNo` bigint(12) DEFAULT NULL,
  `PaymentMode` varchar(100) DEFAULT NULL,
  `InvoiceGenDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`id`, `ProductId`, `Quantity`, `InvoiceNumber`, `CustomerName`, `CustomerContactNo`, `PaymentMode`, `InvoiceGenDate`) VALUES
(15, 1, 2, 268599219, 'prathvik', 9658732654, 'cash', '2023-01-25 16:22:40'),
(16, 13, 1, 268599219, 'prathvik', 9658732654, 'cash', '2023-01-25 16:22:40'),
(17, 4, 3, 770654008, 'rayyan', 9847569874, 'card', '2023-01-25 16:24:46'),
(18, 14, 1, 770654008, 'rayyan', 9847569874, 'card', '2023-01-25 16:24:46'),
(19, 5, 13, 936174312, 'pratheek', 7856321458, 'cash', '2023-01-25 16:25:25'),
(20, 1, 5, 686157658, 'prajwal', 7458854859, 'cash', '2023-01-25 16:26:18'),
(21, 15, 4, 582485444, 'awais', 8974569875, 'card', '2023-01-25 16:27:50'),
(22, 3, 1, 107996528, 'karthik', 8632145689, 'card', '2023-01-25 16:28:44'),
(23, 2, 1, 107996528, 'karthik', 8632145689, 'card', '2023-01-25 16:28:44'),
(24, 3, 1, 850215423, 'neeraj', 9876543214, 'cash', '2023-01-28 17:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `ProductName` varchar(150) DEFAULT NULL,
  `ProductPrice` decimal(10,0) DEFAULT current_timestamp(),
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`id`, `CategoryName`, `CompanyName`, `ProductName`, `ProductPrice`, `PostingDate`, `UpdationDate`) VALUES
(1, 'Milk', 'Amul', 'Toned milk 500ml', '22', '2023-01-02 05:22:37', '2023-01-16 05:22:37'),
(2, 'Milk', 'Amul', 'Toned milk 1ltr', '42', '2023-01-25 16:13:34', '2023-01-16 16:12:07'),
(3, 'Milk', 'Mother Diary', 'Full Cream Milk 500ml', '26', '2023-01-04 06:42:24', '2023-01-17 06:42:24'),
(5, 'Butter', 'Amul', 'Butter 100mg', '46', '2023-01-04 11:42:56', '2023-01-16 11:42:56'),
(12, 'Butter', 'Mother Diary', 'butter', '0', '2023-01-25 16:15:10', '2023-01-25 16:15:10'),
(13, 'Ghee', 'Nandini', 'ghee 1 ltr', '150', '2023-01-25 16:21:13', NULL),
(14, 'Paneer', 'Amul', 'paneer 100gram ', '200', '2023-01-25 16:24:15', NULL),
(15, 'Bread', 'Amul', 'bread 250gram', '55', '2023-01-25 16:27:13', NULL),
(19, 'Milk', 'Mother Diary', 'Milk', '0', '2023-02-06 15:41:58', NULL);

--
-- Triggers `tblproducts`
--
DELIMITER $$
CREATE TRIGGER `set_price` BEFORE INSERT ON `tblproducts` FOR EACH ROW IF NEW.ProductPrice <0
THEN SET NEW.ProductPrice=0;
END IF
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
