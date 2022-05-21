-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2022 at 08:00 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` text NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `SNo` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `phone_number`, `mes`, `SNo`) VALUES
('first post', 'firstpost@gmail.com', '', 'first post', 1),
('rohit bhai', 'good@gmail.com', '123456789', 'qwertyuio', 2),
('rohit', 'fkmgt@gmail.com', '123456556', 'free dtyle', 17),
('sarman', 'patel@gmail.com', 'bavoday', 'volleyball', 18);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `SNo` int(40) NOT NULL,
  `title` varchar(400) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` varchar(500) NOT NULL,
  `img_file` varchar(33) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`SNo`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(2, 'this is second post', 'second_post', 'spifdsiisdkvnikkdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\r\nspifdsiisdkvnikkdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\r\nspifdsiisdkvnikkdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 'home-bg..jpg', '2022-04-04'),
(3, 'puuuchha', 'hhhh', 'hhhhhhhhhhhhhhhhhhhhh', 'hhhh_jpg', '2022-04-04'),
(4, 'aaaa', 'aaaaaa', 'aaaaaaaa', 'aaaaaaaaaaaaaaaaaa', '2022-04-04'),
(5, 'bbbbb', 'bbbbbbbbb', 'bb', 'bb', '2022-04-04'),
(6, 'cc', 'cccc', 'c', 'ccc', '2022-04-04'),
(7, 'd', 'd', 'd', 'd', '2022-04-04'),
(8, 'e', 'e', 'e', 'e', '2022-04-04'),
(9, 'ttt', 'new-post', 'rohit', 'hg_ifm', '2022-04-04'),
(10, 'ttt', 'new-post', 'rohit', 'hg_ifm', '2022-04-04'),
(11, 'ttt', 'new-post', 'rohit', 'hg_ifm', '2022-04-04'),
(12, 'kya pata re', 'mm', 'sahi baat h', 'huiii ya', '2022-04-04'),
(13, 'ab hammsha', 'confident', 'feel ', 'karna h', '2022-04-04'),
(14, 'mmmm', 'mmmmm', 'mmmmmm', 'mmmmm', '2022-04-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`SNo`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`SNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `SNo` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `SNo` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
