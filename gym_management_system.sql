-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2025 at 10:21 PM
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
('AS00001', 'Vipul Bhoir', 9000000001, 'vipulbhoir027@gmail.com', 'Admin', 'U00001'),
('AS00003', 'Aryan Mali', 9000000000, 'aryan@gmail.com', 'Admin', 'U00003');

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
('AF00001', 'new user', 'newuser@gmail.com', 'i want job', 'Instructor', 'U00006', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `name`, `email`, `message`, `user_id`) VALUES
('AP00001', 'new user', 'newuser@gmail.com', 'i want to meet the owner', 'U00006');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `e_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date_of_purchase` date NOT NULL,
  `quantity` int(20) NOT NULL,
  `total_amount` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `img_id` varchar(10) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_by` varchar(10) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`img_id`, `image_name`, `image_path`, `uploaded_by`, `upload_date`) VALUES
('IMG00001', 'blog-2.jpg', 'img/uploads/1739991837_blog-2.jpg', 'AS00001', '2025-02-19 19:03:57'),
('IMG00003', 'class-4.jpg', 'img/uploads/1740339952_class-4.jpg', 'AS00001', '2025-02-23 19:45:52'),
('IMG00004', 'class-detailsl.jpg', 'img/uploads/1740340542_class-detailsl.jpg', 'AS00001', '2025-02-23 19:55:42'),
('IMG00005', 'team-2.jpg', 'img/uploads/1740342836_team-2.jpg', 'AS00001', '2025-02-23 20:33:56'),
('IMG00006', 'services-3.jpg', 'img/uploads/1740580656_services-3.jpg', 'AS00001', '2025-02-26 14:37:36');

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
  `fees` int(20) NOT NULL,
  `availability` varchar(255) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `qualifications` text NOT NULL,
  `experience` varchar(100) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ins_id`, `name`, `contact`, `email`, `specialist`, `fees`, `availability`, `user_id`, `qualifications`, `experience`, `profile_picture`) VALUES
('I00001', 'new user', 9000000001, 'newuser@gmail.com', 'cardios', 3000, 'everyday', 'U00006', '...', '4 ', 'img/instructorsprofile/team-4.jpg');

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
  `status` enum('Active','Expired') NOT NULL,
  `mem_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `fitness_level` enum('Beginner','Intermediate','Advanced','Athlete') DEFAULT NULL,
  `goal` text DEFAULT NULL,
  `last_checkup_date` date DEFAULT NULL,
  `ins_id` varchar(20) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL
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
  `duration` int(20) NOT NULL,
  `duration_type` enum('Days','Months') NOT NULL DEFAULT 'Months',
  `description` text NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`mem_id`, `title`, `type`, `price`, `duration`, `duration_type`, `description`, `discount`, `start_date`, `end_date`, `status`) VALUES
('MEM001', 'Fitness', 'REGULAR', 2999, 3, 'Months', '.....', NULL, NULL, NULL, 'Active'),
('MEM002', 'Diwali Offer', 'SEASONAL', 4999, 6, 'Months', 'exclusive offer', NULL, NULL, NULL, 'Active'),
('MEM003', 'Trial Period', 'OTHER', 300, 3, 'Days', '...', NULL, NULL, NULL, 'Active'),
('MEM004', 'Cardio', 'REGULAR', 2999, 3, 'Months', 'best cardios for faster change', NULL, NULL, NULL, 'Active'),
('MEM005', 'Winter Offer', 'SEASONAL', 6999, 8, 'Months', 'seatjsJdagnhe ', NULL, NULL, NULL, 'Active'),
('MEM007', 'cutting', 'REGULAR', 3999, 6, 'Months', 'better physique and natural strength', 15.00, '2025-02-11', '2025-02-28', 'Active'),
('MEM008', 'Summer Offer', 'SEASONAL', 5999, 7, 'Months', '...............', 10.00, '2025-02-20', '2025-03-02', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `n_id` varchar(20) NOT NULL,
  `notification` varchar(80) NOT NULL,
  `date` date NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`n_id`, `notification`, `date`, `status`) VALUES
('N00001', 'tomorrow will be holiday Date: 27/02/2025', '2025-02-26', 'read'),
('N00002', 'gym will be closed on 28/02/2025 for maintenance work', '2025-02-26', 'read');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `psswd` varchar(30) NOT NULL,
  `login_token` varchar(64) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  `is_logged_in` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `psswd`, `login_token`, `token_expiry`, `is_logged_in`) VALUES
('U00001', 'vipul', 'vipulbhoir027@gmail.com', 'vipul123', NULL, NULL, 1),
('U00002', 'demo', 'demo@gmail.com', 'demo1235', NULL, NULL, 0),
('U00003', 'aryan', 'aryan@gmail.com', 'aryan123', NULL, NULL, 0),
('U00004', 'jidnyasa', 'jid@gmail.com', 'jid12345', NULL, NULL, 0),
('U00005', 'newuser1', 'newuser1@gmail.com', 'newuser123', NULL, NULL, 0),
('U00006', 'newuser', 'newuser@gmail.com', 'newuser123', NULL, NULL, 0),
('U00007', 'vipul2', 'vipulbhoir004@gmail.com', 'vipul1234', NULL, NULL, 1);

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
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

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
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mem_id` (`mem_id`),
  ADD KEY `ins_id` (`ins_id`);

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
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `admin_staff` (`as_id`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`mem_id`) REFERENCES `membership` (`mem_id`),
  ADD CONSTRAINT `member_ibfk_3` FOREIGN KEY (`ins_id`) REFERENCES `instructor` (`ins_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
