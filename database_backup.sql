-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 28, 2025 at 02:15 PM
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
-- Database: `eco-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `mobile`, `email`, `password`, `role`) VALUES
(1, 'John Doe', '1234567890', 'john.doe@example.com', 'password123', 'customer'),
(2, 'Jane Smith', '9876543210', 'jane.smith@example.com', 'securepass456', 'customer'),
(3, 'Raju', '2345678910', 'raju@gmail.com', 'scrypt:32768:8:1$x0TSecodOX7s40VQ$4be97647720c649b978dad652d73d570cdf64163646210194a10c1965f10565341c3f52b115f80d5350c54d72c5d4ad77e08d858302cf4a6adb164b130d23350', 'customer'),
(4, 'Raju', '2345678911', 'raju123@gmail.com', 'scrypt:32768:8:1$18pllNIn9eZFC4XO$c94bc10cbbd565a405d7703ad942c5f0c3333dab64c9fec93fe3682e7420c77ca4ebd5858ab4ce1a61dd26721dbfdbb220e66411ad20c9036e3ca0f4d799b550', 'customer'),
(5, 'Raju', '2345678912', 'raju1234@gmail.com', 'scrypt:32768:8:1$9yT67S9OUXJs0aqv$9a3e007b969d057d4903008155ce7e2838968ce39d0cf0f4583f72a37db4a15ab97717f502845e01da41e644b19ecb3be1f0796702e78b3350abde6bbd1607a4', 'customer'),
(7, 'ashish', '0910485413', 'ashish@gmail.com', 'scrypt:32768:8:1$KUjVQxSjijStmL1O$ba344297b46554a142e74e1248e53ccd3a157ee238bd36bffde1a93dc58291c61af683d4912ba9bbfe911d7a2c23937f3a1db28f3582d4a01904ffd68466efc0', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE `orderhistory` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `num_products` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `delivery_charge` decimal(10,2) DEFAULT NULL,
  `final_payment` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`order_id`, `customer_id`, `address`, `date_time`, `num_products`, `total_price`, `delivery_charge`, `final_payment`) VALUES
(1, 1, '123 Main St, Cityville', '2025-03-25 10:30:00', 2, 179.98, 5.99, 185.97),
(2, 2, '456 Oak Rd, Townsburg', '2025-03-24 15:45:00', 1, 89.99, 0.00, 89.99);

-- --------------------------------------------------------

--
-- Table structure for table `orderhistoryitems`
--

CREATE TABLE `orderhistoryitems` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderhistoryitems`
--

INSERT INTO `orderhistoryitems` (`item_id`, `order_id`, `product_id`, `quantity`, `product_price`) VALUES
(1, 1, 1, 1, 89.99),
(2, 1, 2, 1, 89.99),
(3, 2, 1, 1, 89.99);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `unit` int(11) DEFAULT 1,
  `rating` float DEFAULT NULL,
  `raters` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `deleted_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `unit`, `rating`, `raters`, `description`, `name`, `category`, `price`, `deleted_price`) VALUES
(1, 10, 4.5, 100, 'Comfortable running shoes', 'Sports Shoes', 'Footwear', 89.99, 99.99),
(2, 5, 4.2, 75, 'Wireless noise-canceling headphones', 'Bluetooth Headphones', 'Electronics', 199.99, 249.99),
(3, 12, 4.6, 150, 'Lightweight running sneakers', 'Running Sneakers', 'Footwear', 79.99, 89.99),
(4, 8, 4.3, 90, 'Stylish casual shoes', 'Casual Shoes', 'Footwear', 59.99, 69.99),
(5, 15, 4.7, 200, 'High-performance sports shoes', 'Performance Shoes', 'Footwear', 99.99, 119.99),
(6, 7, 4.1, 60, 'Comfortable walking sandals', 'Walking Sandals', 'Footwear', 49.99, 59.99),
(7, 3, 4.8, 120, 'Smartwatch with fitness tracking', 'Smartwatch', 'Electronics', 299.99, 349.99),
(8, 4, 4.5, 80, 'Bluetooth speakers with deep bass', 'Bluetooth Speaker', 'Electronics', 129.99, 149.99),
(9, 6, 4.4, 110, 'Noise-cancelling earbuds', 'Wireless Earbuds', 'Electronics', 149.99, 179.99),
(10, 5, 4.2, 95, '4K Ultra HD Smart TV', 'Smart TV', 'Electronics', 599.99, 699.99),
(11, 2, 4.7, 180, 'Automatic coffee maker', 'Coffee Maker', 'Home Appliances', 79.99, 99.99),
(12, 3, 4.6, 140, 'Robot vacuum cleaner', 'Robot Vacuum', 'Home Appliances', 299.99, 349.99),
(13, 1, 4.5, 130, 'Air purifier with HEPA filter', 'Air Purifier', 'Home Appliances', 199.99, 249.99),
(14, 4, 4.3, 120, 'Energy-efficient refrigerator', 'Refrigerator', 'Home Appliances', 799.99, 899.99),
(15, 5, 4.4, 100, 'Microwave oven with grill', 'Microwave', 'Home Appliances', 149.99, 179.99),
(16, 12, 4.6, 170, 'Men’s casual jacket', 'Casual Jacket', 'Fashion', 69.99, 79.99),
(17, 15, 4.5, 160, 'Women’s summer dress', 'Summer Dress', 'Fashion', 49.99, 59.99),
(18, 20, 4.8, 200, 'Leather handbag', 'Leather Handbag', 'Fashion', 119.99, 149.99),
(19, 10, 4.2, 130, 'Classic wristwatch', 'Wristwatch', 'Fashion', 199.99, 249.99);

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`image_id`, `product_id`, `image_url`) VALUES
(1, 1, 'https://example.com/shoes.jpg'),
(2, 2, 'https://example.com/headphones.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `customer_id_2` (`customer_id`),
  ADD UNIQUE KEY `customer_id_3` (`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `orderhistoryitems`
--
ALTER TABLE `orderhistoryitems`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderhistoryitems`
--
ALTER TABLE `orderhistoryitems`
  ADD CONSTRAINT `orderhistoryitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderhistory` (`order_id`),
  ADD CONSTRAINT `orderhistoryitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
