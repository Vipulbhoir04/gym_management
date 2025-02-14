-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 09:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_staff`
--

CREATE TABLE `admin_staff` (
  `as_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` bigint(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` enum('Admin','Staff') NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_staff`
--

INSERT INTO `admin_staff` (`as_id`, `name`, `contact`, `email`, `role`, `user_id`) VALUES
('AS001', 'vipul', 9000000000, 'vipul@gmail.com', 'Admin', 'U00001'),
('AS002', 'demo user', 9000000000, 'demo12@gmail.com', 'Admin', 'U00008'),
('AS003', 'aryan12', 9000000001, 'aryan@gmail.com', 'Staff', 'U00005');

-- --------------------------------------------------------

--
-- Table structure for table `application_form`
--

CREATE TABLE `application_form` (
  `form_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `description` varchar(70) NOT NULL,
  `role` enum('Instructor','Staff','Admin') NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `viewed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application_form`
--

INSERT INTO `application_form` (`form_id`, `name`, `email`, `description`, `role`, `user_id`, `viewed`) VALUES
('F00001', 'omkar', 'omkar@gmail.com', 'want to join as a instructor', 'Instructor', 'U00002', 1),
('F00002', 'Aryan Mali', 'aryan@gmail.com', 'i want work :(', 'Staff', 'U00005', 1),
('F00003', 'Nitin Thakur', 'thakurnitin@gmail.com', 'keep me on work in your gym', 'Instructor', 'U00006', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_name`, `image_path`, `uploaded_on`) VALUES
(1, 'gallery-1', 'C:\\xampp\\htdocs\\gms\\img\\gallery\\gallery-1.jpg', '2025-02-04 17:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ins_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` bigint(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `specialist` varchar(70) NOT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ins_id`, `name`, `contact`, `email`, `specialist`, `availability`, `user_id`) VALUES
('I00001', 'Nitin Singh', 9000000000, 'nitin@gmail.com', 'cardio,bulking', 'Monday', 'U00004'),
('I0002', 'Nitin Thakur', 9000000001, 'thakurnitin@gmail.com', 'yoga', 'Monday,Wednesday,Friday', 'U00006');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `m_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` int(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Running','Expired') NOT NULL,
  `mem_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `mem_id` varchar(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `type` enum('REGULAR','SEASONAL','OTHER') NOT NULL,
  `price` int(30) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`mem_id`, `title`, `type`, `price`, `duration`, `description`) VALUES
('MEM001', 'Fitness', 'REGULAR', 2999, '3 months', '.....'),
('MEM002', 'Diwali Offer', 'SEASONAL', 4999, '6 months', 'exclusive offer'),
('MEM003', 'Trial Period', 'OTHER', 300, '3 days', '...'),
('MEM004', 'Cardio', 'REGULAR', 2999, '3 months', 'best cardios for faster change'),
('MEM005', 'Winter Offer', 'SEASONAL', 6999, '8 months', 'seatjsJdagnhe '),
('MEM006', 'Trial Period', 'OTHER', 500, '5 days', '....');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `n_id` varchar(20) NOT NULL,
  `notification` varchar(80) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`n_id`, `notification`, `date`) VALUES
('N001', 'tomorrow will be holiday', '2025-02-14'),
('N002', 'gym will be closed today', '2025-02-14'),
('N003', 'today gym is open', '2025-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `psswd` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `psswd`) VALUES
('U00001', 'vipul', 'vipulbhoir027@gmail.com', '11111111'),
('U00002', 'abcd', 'abcd@gmail.com', '1111'),
('U00003', 'user1', 'vipulbhoir027@gmail.com', '1111'),
('U00004', 'nitin', 'nitin@gmail.com', '1234'),
('U00005', 'aryanmali', 'aryan@gmail.com', '12345'),
('U00006', 'Nitin Thakur', 'thakurnitin@gmail.com', '12345'),
('U00008', 'demo12', 'demo12@gmail.com', '11111111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_staff`
--
ALTER TABLE `admin_staff`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `application_form`
--
ALTER TABLE `application_form`
  ADD PRIMARY KEY (`form_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ins_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_staff`
--
ALTER TABLE `admin_staff`
  ADD CONSTRAINT `admin_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `application_form`
--
ALTER TABLE `application_form`
  ADD CONSTRAINT `application_form_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
