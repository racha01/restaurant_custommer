-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 09:31 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restarant_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `card_no`, `member_id`) VALUES
(1, 'C001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `favorite_no` varchar(20) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_details`
--

CREATE TABLE `favorite_details` (
  `id` int(11) NOT NULL,
  `favorite_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `id_member` varchar(13) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `status` enum('IN','NOTIN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `id_member`, `first_name`, `last_name`, `status`) VALUES
(1, '1234567891011', 'ขจร', 'จัด', 'IN'),
(2, '1361201282239', '', 'gg', 'IN'),
(3, 'gg', '', 'gg', 'IN'),
(4, '1258463210248', 'gg', 'gg', 'IN'),
(5, '1245103584216', '', 'gg', 'IN'),
(6, '1024879652302', 'ซอฟต์แวร์', 'เอนจีเนีย', 'NOTIN');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `menu_code` varchar(30) NOT NULL,
  `food_menu` varchar(100) NOT NULL,
  `food_type` enum('FULLMEALFASTFOOD','SNACKFASTFOOD','REFRESHMENTS') NOT NULL,
  `price` int(11) NOT NULL,
  `status` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_code`, `food_menu`, `food_type`, `price`, `status`) VALUES
(1, 'M001', 'พิซซ่าหน้าแซลมอนรมควัน', 'FULLMEALFASTFOOD', 30, '1'),
(2, 'M002', 'เป๊ปซี่ 200 ml.', 'REFRESHMENTS', 20, '1'),
(3, 'M003', 'โค้ก', 'REFRESHMENTS', 20, '1'),
(4, 'M003', 'นักเก็ต', 'FULLMEALFASTFOOD', 30, '1'),
(5, 'M005', 'ไก่ทอด', 'REFRESHMENTS', 40, '1'),
(6, 'ggg', 'gg', 'SNACKFASTFOOD', 20, '1'),
(7, 'gg', 'ปิ้งไก่', 'SNACKFASTFOOD', 50, '1'),
(8, 'gg', 'gg', 'REFRESHMENTS', 52, '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_no` varchar(20) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `total_pice` int(11) NOT NULL,
  `status` enum('TAKEORDER','DOING','SERVED','PAID','ORDER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_no` varchar(20) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `deat_time_order` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_no`, `menu_id`, `deat_time_order`) VALUES
(1, 'O000', 1, '2021-09-08 02:10:28'),
(2, 'O001', 0, '2021-09-08 02:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` int(11) NOT NULL,
  `qr_code_no` varchar(100) NOT NULL,
  `web_site` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `qr_code_no`, `web_site`) VALUES
(1, 'qr01', 'www'),
(2, 'qr02', 'www');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(100) NOT NULL,
  `status` enum('','','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_details`
--

CREATE TABLE `receipt_details` (
  `id` int(11) NOT NULL,
  `receipt_id` varchar(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_issue_receipt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt_details`
--

INSERT INTO `receipt_details` (`id`, `receipt_id`, `order_id`, `date_issue_receipt`) VALUES
(1, 'P000', 0, '2021-09-08 02:15:41'),
(2, 'P001', 2, '2021-09-08 02:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `suggest`
--

CREATE TABLE `suggest` (
  `id` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_no` varchar(20) NOT NULL,
  `qr_code_id` int(11) NOT NULL,
  `status` enum('CHECKIN','CHECKOUT') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_no`, `qr_code_id`, `status`) VALUES
(1, 'T01', 1, 'CHECKOUT'),
(2, 'T02', 2, 'CHECKOUT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `user_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `user_role_id`) VALUES
(1, 'admin', '$2y$10$AG.ltxsSn6jfR1wveS7jreu9eWIz.qou9sBjA3OLa3FWUnKKg/5Ta', 'ซอฟเเวร์', 'เอนจีเนีย', 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `visitor_no` varchar(20) NOT NULL,
  `card_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `status` enum('CHECKIN','ORDER','PAID','CHECKOUT') NOT NULL,
  `date_check_in` datetime NOT NULL,
  `date_check_out` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `visitor_no`, `card_id`, `table_id`, `number_of_people`, `status`, `date_check_in`, `date_check_out`) VALUES
(0, 'V001', 0, 1, 5, 'CHECKIN', '2021-09-08 02:04:55', '0000-00-00 00:00:00'),
(0, 'V002', 1, 2, 3, 'CHECKIN', '2021-09-08 02:09:15', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_no` (`card_no`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorite_no` (`favorite_no`);

--
-- Indexes for table `favorite_details`
--
ALTER TABLE `favorite_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_number` (`id_member`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_code` (`menu_code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_no` (`receipt_no`);

--
-- Indexes for table `receipt_details`
--
ALTER TABLE `receipt_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_no` (`table_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_details`
--
ALTER TABLE `favorite_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_details`
--
ALTER TABLE `receipt_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
