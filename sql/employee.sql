-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 10:18 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblemployeedepartment`
--

CREATE TABLE `tblemployeedepartment` (
  `department_id` int(11) NOT NULL,
  `department_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblemployeedepartment`
--

INSERT INTO `tblemployeedepartment` (`department_id`, `department_text`) VALUES
(1, 'Accounting'),
(2, 'Admin'),
(3, 'General Services'),
(4, 'Security'),
(5, 'Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_department_id` int(11) NOT NULL,
  `emp_employee_status` int(11) NOT NULL,
  `emp_basic_salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `emp_name`, `emp_department_id`, `emp_employee_status`, `emp_basic_salary`) VALUES
(1, 'KRISTYLL JAN GALLEZA', 1, 2, 10000.00),
(2, 'LANZ MAKYUZ', 2, 1, 15000.00),
(3, 'BINI MAE JABOPAL', 3, 2, 12000.00),
(4, 'KITTY IGNALIG', 2, 3, 20000.00),
(5, 'CLITZ PARTOSA', 3, 4, 30000.00),
(6, 'PITOK BATOLATA', 1, 5, 10000.00),
(7, 'REY JADE CABOZA', 2, 6, 15000.00),
(8, 'KULAS D. MALAS', 3, 4, 12000.00),
(9, 'SABEL MACHECA', 2, 6, 20000.00),
(10, 'SOFI DAVE GABONARIO', 3, 5, 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tblemploymentstatus`
--

CREATE TABLE `tblemploymentstatus` (
  `stat_id` int(11) NOT NULL,
  `stat_text` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblemploymentstatus`
--

INSERT INTO `tblemploymentstatus` (`stat_id`, `stat_text`) VALUES
(1, 'REGULAR'),
(2, 'PROBATIONARY'),
(3, 'CONTRACTUAL'),
(4, 'PART TIME'),
(5, 'CASUAL'),
(6, 'SEASONAL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblemployeedepartment`
--
ALTER TABLE `tblemployeedepartment`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tblemploymentstatus`
--
ALTER TABLE `tblemploymentstatus`
  ADD PRIMARY KEY (`stat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblemployeedepartment`
--
ALTER TABLE `tblemployeedepartment`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblemploymentstatus`
--
ALTER TABLE `tblemploymentstatus`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
