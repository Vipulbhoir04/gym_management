-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2025 at 09:55 PM
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
('AS00001', 'Vipul Bhoir', 9000000122, 'vipulbhoir027@gmail.com', 'Admin', 'U00001');

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
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `a_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `m_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`e_id`, `name`, `description`, `date_of_purchase`, `quantity`, `total_amount`) VALUES
('E00001', 'Treadmill', 'Motorized running machine', '2024-02-10', 3, 90000),
('E00002', 'Dumbbells Set', 'Adjustable weight set', '2024-03-01', 10, 50000),
('E00003', 'Bench Press', 'Heavy-duty weight bench', '2024-01-15', 2, 70000),
('E00004', 'Yoga Mats', 'Non-slip exercise mats', '2024-02-28', 20, 20000),
('E00005', 'Resistance Bands', 'Set of 5 bands', '2024-03-05', 15, 15000);

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
('IMG00001', 'class-4.jpg', 'img/uploads/1741543551_class-4.jpg', 'AS00001', '2025-03-09 18:05:51'),
('IMG00002', 'class-2.jpg', 'img/uploads/1741543563_class-2.jpg', 'AS00001', '2025-03-09 18:06:03'),
('IMG00003', 'class-3.jpg', 'img/uploads/1741543913_class-3.jpg', 'AS00001', '2025-03-09 18:11:53'),
('IMG00004', 'gallery-3.jpg', 'img/uploads/1741543923_gallery-3.jpg', 'AS00001', '2025-03-09 18:12:03'),
('IMG00005', 'gallery-5.jpg', 'img/uploads/1741543930_gallery-5.jpg', 'AS00001', '2025-03-09 18:12:10'),
('IMG00006', 'gallery-7.jpg', 'img/uploads/1741543937_gallery-7.jpg', 'AS00001', '2025-03-09 18:12:17');

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
('I00001', 'Emily Davis', 6543210987, 'emily@example.com', 'Pilates Trainer', 4000, 'everyday', 'U00006', 'Certified Pilates Instructor', '4', 'img/instructorsprofile/team-1.jpg'),
('I00002', 'John Doe', 9876543210, 'john@example.com', 'Strength Training', 5000, 'everyday', 'U00003', 'Certified Personal Trainer', '5', 'img/instructorsprofile/team-3.jpg'),
('I00003', 'Jane Smith', 8765432109, 'jane@example.com', 'Yoga Instructor', 4500, 'everyday', 'U00004', 'Yoga Alliance Certified', '7', 'img/instructorsprofile/team-5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `m_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` bigint(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Inactive','Expired') NOT NULL DEFAULT 'Inactive',
  `mem_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `fitness_level` enum('Beginner','Intermediate','Advanced','Athlete') DEFAULT NULL,
  `goal` text DEFAULT NULL,
  `last_checkup_date` date DEFAULT NULL,
  `ins_id` varchar(20) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`m_id`, `name`, `contact`, `email`, `address`, `age`, `gender`, `start_date`, `end_date`, `status`, `mem_id`, `user_id`, `weight`, `height`, `fitness_level`, `goal`, `last_checkup_date`, `ins_id`, `total_price`) VALUES
('M00001', 'Vipul Bhoir', 993019839, 'vipulbhoir004@gmail.com', 'Vijay park, Thane', 20, 'Male', '2025-03-17', '2026-03-17', 'Active', 'MEM00004', 'U00002', 63.00, 175.00, 'Beginner', 'Get slim body', '2025-03-10', NULL, 4250.00);

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
('MEM00002', 'Standard Membership', 'REGULAR', 1400, 3, 'Months', 'Access to gym facilities for 3 months.', 5.00, '2025-03-01', '2025-06-01', 'Active'),
('MEM00003', 'Premium Membership', 'REGULAR', 2700, 6, 'Months', 'Access to gym facilities for 6 months with one free personal training session.', 10.00, '2025-03-01', '2025-09-01', 'Active'),
('MEM00004', 'Elite Membership', 'REGULAR', 5000, 12, 'Months', 'Access to gym facilities for 12 months.', 15.00, '2025-03-10', '2026-03-10', 'Active'),
('MEM00005', 'Winter Special', 'SEASONAL', 1000, 3, 'Months', 'Special winter discount membership valid for 3 months.', 10.00, '2024-12-01', '2025-03-01', 'Inactive'),
('MEM00006', 'Summer Body Package', 'SEASONAL', 2500, 4, 'Months', 'Get in shape for summer with 4 months of gym access.', 12.00, '2025-05-01', '2025-09-01', 'Active'),
('MEM00007', 'Corporate Membership', 'OTHER', 4500, 12, 'Months', 'Special membership for corporate employees, 12 months access.', 12.00, '2025-03-01', '2026-03-01', 'Active'),
('MEM00009', 'Senior Citizen Membership', 'OTHER', 1800, 6, 'Months', 'Special membership for seniors aged 60+, 6 months access.', 10.00, '2025-03-01', '2025-09-01', 'Active'),
('MEM0010', 'Trial Membership', 'OTHER', 300, 3, 'Days', '14-day trial membership for new customers.', 0.00, '2025-04-01', '2025-04-04', 'Inactive');

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
('N00001', 'The gym will remain closed tomorrow : 10-03-2025', '2025-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` varchar(10) NOT NULL,
  `m_id` varchar(10) DEFAULT NULL,
  `mem_id` varchar(10) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('Offline','Online') NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `payment_status` enum('Pending','Completed','Failed') NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `m_id`, `mem_id`, `amount`, `payment_mode`, `transaction_id`, `payment_status`, `payment_date`) VALUES
('P00001', 'M00001', 'MEM00004', 4250.00, 'Offline', NULL, 'Completed', '2025-03-09 14:59:28');

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
('U00001', 'vipul', 'vipulbhoir027@gmail.com', 'vipul111', NULL, NULL, 1),
('U00002', 'vipul04', 'vipulbhoir004@gmail.com', 'vipul123', NULL, NULL, 0),
('U00003', 'john', 'john@example.com', 'john1234', NULL, NULL, 0),
('U00004', 'janesmith', 'jane@example.com', 'jane1234', NULL, NULL, 0),
('U00005', 'mike_j', 'mike@example.com', 'mike1234', NULL, NULL, 0),
('U00006', 'emily', 'emily@example.com', 'emily123', NULL, NULL, 0);

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
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `m_id` (`m_id`);

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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `m_id` (`m_id`),
  ADD KEY `mem_id` (`mem_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

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
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE;

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

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`mem_id`) REFERENCES `membership` (`mem_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
