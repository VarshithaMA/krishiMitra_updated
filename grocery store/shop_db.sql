-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 03:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- USERS
INSERT INTO `users` (`name`, `email`, `password`, `user_type`, `image`) VALUES
('Admin', 'admin@gmail.com', 'admin123', 'admin', 'admin.png'),
('Varshitha', 'varsh@gmail.com', 'user123', 'user', 'user1.png'),
('Ravi', 'ravi@gmail.com', 'user123', 'user', 'user2.png'),
('Priya', 'priya@gmail.com', 'user123', 'user', 'user3.png');

-- PRODUCTS
INSERT INTO `products` (`name`, `category`, `details`, `price`, `image`) VALUES
('Mango', 'fruits', 'Fresh and juicy organic mangoes rich in flavor.', 120, 'mango.jpg'),
('Apple', 'fruits', 'Crisp and sweet apples directly from the farm.', 150, 'apple.jpg'),
('Grapes', 'fruits', 'Seedless green grapes full of antioxidants.', 90, 'grapes.jpg'),
('Tomato', 'vegetables', 'Fresh red tomatoes used for cooking and salads.', 40, 'tomato.jpg'),
('Carrot', 'vegetables', 'Organic carrots rich in Vitamin A.', 35, 'carrot.jpg'),
('Onion', 'vegetables', 'Fresh onions perfect for everyday use.', 30, 'onion.jpg'),
('Wheat Flour', 'grains', 'Finely ground whole wheat flour for soft chapatis.', 60, 'wheat_flour.jpg'),
('Rice', 'grains', 'Premium quality white rice, soft and fluffy when cooked.', 70, 'rice.jpg'),
('Corn', 'grains', 'Golden corn kernels used in various recipes.', 45, 'corn.jpg'),
('Rose', 'flower', 'Fresh red roses perfect for decoration or gifting.', 25, 'rose.jpg'),
('Jasmine', 'flower', 'Fragrant jasmine flowers for garlands and prayers.', 30, 'jasmine.jpg'),
('Sunflower', 'flower', 'Bright yellow sunflowers symbolizing happiness.', 40, 'sunflower.jpg'),
('Lotus', 'flower', 'Sacred and beautiful lotus flowers freshly picked.', 50, 'lotus.jpg');

-- CART
INSERT INTO `cart` (`user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(2, 1, 'Mango', 120, 2, 'mango.jpg'),
(2, 4, 'Tomato', 40, 3, 'tomato.jpg'),
(3, 7, 'Wheat Flour', 60, 1, 'wheat_flour.jpg');

-- WISHLIST
INSERT INTO `wishlist` (`user_id`, `pid`, `name`, `price`, `image`) VALUES
(2, 10, 'Rose', 25, 'rose.jpg'),
(3, 2, 'Apple', 150, 'apple.jpg');

-- ORDERS
INSERT INTO `orders` (`user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(2, 'Varshitha', '9876543210', 'varsh@gmail.com', 'cash on delivery', 'Mysore, Karnataka', 'Mango (2), Tomato (3)', 360, '2025-11-13', 'completed'),
(3, 'Ravi', '9988776655', 'ravi@gmail.com', 'online payment', 'Bangalore, Karnataka', 'Rice (1), Wheat Flour (1)', 130, '2025-11-12', 'pending');

-- MESSAGE
INSERT INTO `message` (`user_id`, `name`, `email`, `number`, `message`) VALUES
(2, 'Varshitha', 'varsh@gmail.com', '9876543210', 'Hi, please deliver my mangoes early.'),
(3, 'Ravi', 'ravi@gmail.com', '9988776655', 'Add more rice stock please.'),
(4, 'Priya', 'priya@gmail.com', '9123456789', 'Loved the flowers quality!');
