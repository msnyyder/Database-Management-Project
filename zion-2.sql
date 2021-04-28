-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2021 at 06:52 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zion`
--

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`UserName`, `Password`) VALUES
('admin', 'PassWord'),
('Jake01', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `Author`
--

CREATE TABLE `Author` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Author`
--

INSERT INTO `Author` (`ID`, `FirstName`, `LastName`, `BirthDate`) VALUES
(1, 'Jennifer', 'McCoy', '1980-05-01'),
(2, 'Yuto', 'Takahashi', '1973-12-04'),
(3, 'Jose', 'Martinez', NULL),
(4, 'Jasmine', 'Baxter', NULL),
(5, 'Xiu', 'Tao', '1992-11-13'),
(6, 'Ethan', 'Lonestar', '1965-02-15'),
(7, 'Amar', 'Agarwal', NULL),
(8, 'Emilia', 'Russo', '1999-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `ID` int(11) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Publisher` varchar(45) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL CHECK (`Category` in ('adventure','drama','fantasy','humor','romance','scifi')),
  `Price` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`ID`, `Title`, `Publisher`, `Category`, `Price`) VALUES
(100, 'The Black Box', 'Wright Pub', 'adventure', '22.50'),
(101, 'Lost Time', 'Caster', 'scifi', '19.99'),
(102, 'Which Way Home?', 'Light House', 'humor', '8.99'),
(103, 'Grant Me Three Wishes', 'Caster', 'romance', '10.75'),
(104, 'The Last Attempt', 'Longshot', 'scifi', '15.99'),
(105, 'My Crazy Life', 'Light House', 'humor', '9.67');

-- --------------------------------------------------------

--
-- Table structure for table `BookAuthor`
--

CREATE TABLE `BookAuthor` (
  `AuthorID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BookAuthor`
--

INSERT INTO `BookAuthor` (`AuthorID`, `BookID`) VALUES
(1, 104),
(2, 100),
(3, 100),
(4, 101),
(5, 103),
(7, 102),
(8, 102),
(8, 105);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`ID`, `FirstName`, `LastName`, `Address`, `City`, `State`, `Zip`) VALUES
(1, 'Jill', 'Halloway', '101 Main St', 'Boulder', 'CO', 80301),
(2, 'Mario', 'Androsa', '4545 N 1st St', 'Tulsa', 'OK', 74008),
(3, 'Erica', 'MacCallum', '999 S Fir Ct', 'Breckenridge', 'CO', 80424),
(4, 'John', 'Patrick de la Cruz', '501 N Main', 'Albuquerque', 'NM', 87109),
(5, 'Anna', 'Green', '600 S Main', 'Los Alamos', 'NM', 87544),
(6, 'Mo', 'Yan', '211 W Lipan', 'Edmond', 'OK', 73013),
(7, 'Alexis', 'Brookhart', '9000 S Greenwood', 'Englewood', 'CO', 80110),
(8, 'Hala', 'Nassar', '840 N Pine St', 'Oklahoma City', 'OK', 73008);

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE `Sale` (
  `ID` int(11) NOT NULL,
  `CustID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `UnitPrice` decimal(6,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sale`
--

INSERT INTO `Sale` (`ID`, `CustID`, `BookID`, `UnitPrice`, `Quantity`, `Date`) VALUES
(1, 1, 103, '10.99', 1, '2020-02-14 12:30:00'),
(2, 2, 104, '15.50', 2, '2020-02-15 14:15:00'),
(3, 3, 101, '21.99', 1, '2020-02-15 19:10:00'),
(4, 6, 104, '16.00', 2, '2020-02-15 19:25:00'),
(5, 4, 102, '9.75', 1, '2020-02-16 11:05:00'),
(6, 4, 105, '9.50', 1, '2020-02-16 11:05:00'),
(7, 2, 102, '9.75', 1, '2020-02-16 11:30:00'),
(8, 5, 104, '16.00', 1, '2020-02-16 15:25:00'),
(9, 6, 100, '22.30', 2, '2020-02-16 16:00:00'),
(10, 2, 103, '10.99', 1, '2020-02-17 12:30:00'),
(11, 7, 103, '14.99', 3, '2020-02-21 14:25:00'),
(12, 7, 104, '16.00', 1, '2020-02-21 14:25:00'),
(13, 7, 105, '10.00', 1, '2020-02-21 14:25:00'),
(14, 1, 101, '15.20', 1, '2020-02-22 13:15:00'),
(15, 2, 105, '9.50', 1, '2020-03-05 10:18:00'),
(16, 1, 100, '22.50', 1, '2021-02-01 09:15:00'),
(17, 2, 103, '10.99', 1, '2021-02-01 13:15:00'),
(18, 2, 101, '15.60', 1, '2021-02-01 13:15:00'),
(19, 3, 103, '14.99', 1, '2021-02-01 13:15:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BookAuthor`
--
ALTER TABLE `BookAuthor`
  ADD PRIMARY KEY (`AuthorID`,`BookID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustID` (`CustID`),
  ADD KEY `BookID` (`BookID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Sale`
--
ALTER TABLE `Sale`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookAuthor`
--
ALTER TABLE `BookAuthor`
  ADD CONSTRAINT `bookauthor_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `Author` (`ID`),
  ADD CONSTRAINT `bookauthor_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `Book` (`ID`);

--
-- Constraints for table `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`ID`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `Book` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
