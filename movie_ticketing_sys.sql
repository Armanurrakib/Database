-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 09:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_ticketing_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

CREATE TABLE `booking_status` (
  `Booking_ID` int(20) NOT NULL,
  `Customer_ID` int(20) DEFAULT NULL,
  `Movie_ID` int(20) DEFAULT NULL,
  `Hall_ID` int(20) DEFAULT NULL,
  `Seat_Type` varchar(20) DEFAULT NULL,
  `Price` int(20) DEFAULT NULL,
  `Show_Time` varchar(20) DEFAULT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Seat_Number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_status`
--

INSERT INTO `booking_status` (`Booking_ID`, `Customer_ID`, `Movie_ID`, `Hall_ID`, `Seat_Type`, `Price`, `Show_Time`, `Booking_Date`, `Seat_Number`) VALUES
(1101, 2201, 703, 301, 'VIP', 800, '9PM', '2022-05-18', '1A'),
(1102, 2202, 704, 302, 'VIP', 800, '5PM', '2022-05-18', '2A'),
(1104, 2204, 708, 304, 'PREMIUM', 600, '9PM', '2022-05-20', '2M'),
(1105, 2208, 705, 305, 'VIP', 800, '9PM', '2022-05-18', '3M'),
(1106, 2205, 704, 303, 'VIP', 800, '5PM', '2022-05-20', '2B'),
(1107, 2201, 709, 301, 'PREMIUM', 600, '5PM', '2022-05-18', '1B'),
(1108, 2202, 709, 306, 'PREMIUM', 600, '9PM', '2022-05-20', '1B'),
(1109, 2201, 705, 307, 'VIP', 800, '9PM', '2022-05-25', '1M');

-- --------------------------------------------------------

--
-- Table structure for table `cinema_hall`
--

CREATE TABLE `cinema_hall` (
  `Cinema_ID` int(20) NOT NULL,
  `Cinema_Name` varchar(20) DEFAULT NULL,
  `Total_Seat` int(20) DEFAULT NULL,
  `Hall_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cinema_hall`
--

INSERT INTO `cinema_hall` (`Cinema_ID`, `Cinema_Name`, `Total_Seat`, `Hall_ID`) VALUES
(1, 'AR', 28, 301),
(2, 'AN', 9, 302),
(3, 'AM', 25, 303),
(4, 'AJ', 25, 304),
(5, 'AT', 28, 305),
(6, 'AW', 28, 306),
(7, 'AV', 25, 307);

-- --------------------------------------------------------

--
-- Table structure for table `currently_showing_movies`
--

CREATE TABLE `currently_showing_movies` (
  `Currently_Showing_Movie_ID` int(20) NOT NULL,
  `Show_Time` varchar(20) DEFAULT NULL,
  `Movie_ID` int(20) NOT NULL,
  `Hall_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currently_showing_movies`
--

INSERT INTO `currently_showing_movies` (`Currently_Showing_Movie_ID`, `Show_Time`, `Movie_ID`, `Hall_ID`) VALUES
(380, '5PM', 708, 302),
(383, '9PM', 705, 304),
(388, '9PM', 703, 303),
(389, '9PM', 709, 306),
(733, '5PM', 704, 307);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(20) NOT NULL,
  `Booking_ID` int(20) DEFAULT NULL,
  `Customer_Name` varchar(20) DEFAULT NULL,
  `Mobile_Number` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Booking_ID`, `Customer_Name`, `Mobile_Number`, `Gender`, `Age`) VALUES
(2201, 1101, 'Vladimir Putin', '+0911', 'Male', 42),
(2202, 1102, 'Ainun Ani', '+88016', 'Female', 19),
(2203, 1104, 'Mehedi Hasan', '+88018', 'Male', 23),
(2204, 1107, 'Tanveer ', '+88015', 'Male', 22),
(2205, 1106, 'Dristy Rahman', '+88017', 'Female', 22),
(2206, 1107, 'Iftekhar Ifty', '+880189', 'Male', 19),
(2207, 1104, 'Ishabella', '+8801800', 'Female', 23),
(2208, 1106, 'Abdun Nur', '+880186', 'Male', 24);

-- --------------------------------------------------------

--
-- Table structure for table `hall_details`
--

CREATE TABLE `hall_details` (
  `Hall_ID` int(20) NOT NULL,
  `Hall_name` varchar(20) DEFAULT NULL,
  `Reserved_Seat` varchar(20) DEFAULT NULL,
  `Vacant_Seat` varchar(20) DEFAULT NULL,
  `Movie_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall_details`
--

INSERT INTO `hall_details` (`Hall_ID`, `Hall_name`, `Reserved_Seat`, `Vacant_Seat`, `Movie_ID`) VALUES
(301, 'A', '3', '6', 703),
(302, 'B', '8', '1', 704),
(303, 'B', '5', '4', 705),
(304, 'M', '7', '2', 703),
(305, 'A', '3', '6', 703),
(306, 'M', '5', '4', 708),
(307, 'M', '5', '4', 704);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `Movie_ID` int(20) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Release_Year` varchar(20) DEFAULT NULL,
  `UCM_Trailer_ID` int(20) DEFAULT NULL,
  `CSM_Trailer_ID` int(20) DEFAULT NULL,
  `Upcoming_Movie_ID` int(20) DEFAULT NULL,
  `Currently_Showing_Movie_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Movie_ID`, `Title`, `Release_Year`, `UCM_Trailer_ID`, `CSM_Trailer_ID`, `Upcoming_Movie_ID`, `Currently_Showing_Movie_ID`) VALUES
(703, 'Avatar', '2009', NULL, NULL, NULL, NULL),
(704, '127 Hours', '2016', NULL, NULL, NULL, NULL),
(705, 'The Invisible Guest', '2019', NULL, NULL, NULL, NULL),
(708, 'Leon The Professiona', '1993', 901, NULL, NULL, NULL),
(709, 'La Liorona', '2019', 901, NULL, 777, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_details`
--

CREATE TABLE `movie_details` (
  `Movie_Details_ID` int(20) NOT NULL,
  `Movie_Title` varchar(20) NOT NULL,
  `Director` varchar(20) NOT NULL,
  `Actor` varchar(20) NOT NULL,
  `Ratting` int(20) NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `RuntimeInMinutes` int(20) NOT NULL,
  `Movie_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_details`
--

INSERT INTO `movie_details` (`Movie_Details_ID`, `Movie_Title`, `Director`, `Actor`, `Ratting`, `Genre`, `Country`, `RuntimeInMinutes`, `Movie_ID`) VALUES
(90, 'Avatar', 'James Cameron', 'Sam', 9, 'Si-fi,Action', 'USA', 128, 703),
(91, 'Shutter Island', 'Martin Scorcpe', 'Leonardo DeCaprio', 8, 'Thriller', 'USA', 118, 704),
(92, 'The Invisible Guest', 'Oriol Paulo', 'Mario Casas', 8, 'Crime', 'Spain', 96, 705),
(93, 'Leon The Professiona', 'Luc Besson', 'Jean Reno', 9, 'Action', 'France', 128, 708),
(95, 'La Liorona', 'Unknown', 'Unknown', 7, 'Horror', 'Spain', 108, 709);

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_movies`
--

CREATE TABLE `upcoming_movies` (
  `Upcoming_Movie_ID` int(20) NOT NULL,
  `Upcoming_Movie_Name` varchar(20) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `UCM_Trailer_ID` int(20) DEFAULT NULL,
  `Hall_ID` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upcoming_movies`
--

INSERT INTO `upcoming_movies` (`Upcoming_Movie_ID`, `Upcoming_Movie_Name`, `Release_Date`, `UCM_Trailer_ID`, `Hall_ID`) VALUES
(777, 'La Liorona', '2022-06-23', 901, 1),
(788, 'Leon The professiona', '1993-05-30', 907, 3),
(799, 'Leon The professiona', '1993-05-30', 902, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`),
  ADD KEY `Hall_ID` (`Hall_ID`);

--
-- Indexes for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD PRIMARY KEY (`Cinema_ID`),
  ADD KEY `Hall_ID` (`Hall_ID`);

--
-- Indexes for table `currently_showing_movies`
--
ALTER TABLE `currently_showing_movies`
  ADD PRIMARY KEY (`Currently_Showing_Movie_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `hall_details`
--
ALTER TABLE `hall_details`
  ADD PRIMARY KEY (`Hall_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Movie_ID`),
  ADD KEY `Upcoming_Movie_ID` (`Upcoming_Movie_ID`),
  ADD KEY `Currently_Showing_Movie_ID` (`Currently_Showing_Movie_ID`);

--
-- Indexes for table `movie_details`
--
ALTER TABLE `movie_details`
  ADD PRIMARY KEY (`Movie_Details_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Indexes for table `upcoming_movies`
--
ALTER TABLE `upcoming_movies`
  ADD PRIMARY KEY (`Upcoming_Movie_ID`),
  ADD UNIQUE KEY `UCM_Trailer_ID` (`UCM_Trailer_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_status`
--
ALTER TABLE `booking_status`
  ADD CONSTRAINT `booking_status_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `booking_status_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`),
  ADD CONSTRAINT `booking_status_ibfk_3` FOREIGN KEY (`Hall_ID`) REFERENCES `hall_details` (`Hall_ID`);

--
-- Constraints for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD CONSTRAINT `cinema_hall_ibfk_1` FOREIGN KEY (`Hall_ID`) REFERENCES `hall_details` (`Hall_ID`);

--
-- Constraints for table `currently_showing_movies`
--
ALTER TABLE `currently_showing_movies`
  ADD CONSTRAINT `currently_showing_movies_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking_status` (`Booking_ID`);

--
-- Constraints for table `hall_details`
--
ALTER TABLE `hall_details`
  ADD CONSTRAINT `hall_details_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`Upcoming_Movie_ID`) REFERENCES `upcoming_movies` (`Upcoming_Movie_ID`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`Currently_Showing_Movie_ID`) REFERENCES `currently_showing_movies` (`Currently_Showing_Movie_ID`);

--
-- Constraints for table `movie_details`
--
ALTER TABLE `movie_details`
  ADD CONSTRAINT `movie_details_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movies` (`Movie_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
