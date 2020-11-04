-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2020 at 06:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_gateway`
--

-- --------------------------------------------------------

--
-- Table structure for table `atom_transaction`
--

CREATE TABLE `atom_transaction` (
  `trans_id` int(11) NOT NULL,
  `mmp_txn` varchar(100) NOT NULL,
  `mer_txn` varchar(100) NOT NULL,
  `amt` varchar(100) NOT NULL,
  `prod` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `bank_txn` varchar(100) NOT NULL,
  `f_code` varchar(100) NOT NULL,
  `clientcode` varchar(100) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `merchant_id` varchar(100) NOT NULL,
  `udf9` varchar(100) DEFAULT NULL,
  `discriminator` varchar(100) NOT NULL,
  `surcharge` varchar(100) NOT NULL,
  `CardNumber` varchar(100) NOT NULL,
  `udf1` varchar(100) NOT NULL,
  `udf2` varchar(100) NOT NULL,
  `udf3` varchar(100) NOT NULL,
  `udf4` varchar(100) NOT NULL,
  `udf5` varchar(100) DEFAULT NULL,
  `udf6` varchar(100) DEFAULT NULL,
  `signature` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `atom_transaction`
--

INSERT INTO `atom_transaction` (`trans_id`, `mmp_txn`, `mer_txn`, `amt`, `prod`, `date`, `bank_txn`, `f_code`, `clientcode`, `bank_name`, `merchant_id`, `udf9`, `discriminator`, `surcharge`, `CardNumber`, `udf1`, `udf2`, `udf3`, `udf4`, `udf5`, `udf6`, `signature`) VALUES
(1, '700005631879', '924011', '1.00', 'NSE', 'Mon Oct 19 21:19:33 IST 2020', '7000056318791', 'Ok', '1', 'Atom Bank', '197', 'null', 'NB', '0.00', 'null', 'Knowledge', 'knowledge@gmail.com', '2132323232', 'test', 'null', 'null', '2943f6c72862b76f3ea90c3c8014488faed96987f4434942fbc8efe3b9073d680144edbfd118e1a84beb5ddff3c0a68eb2654507586408e80258f8a8612c9db4'),
(2, '700005631897', '459648', '1.00', 'NSE', 'Mon Oct 19 22:58:18 IST 2020', '7000056318971', 'Ok', '1', 'Atom Bank', '197', 'null', 'NB', '0.00', 'null', 'Knowledge', 'knowledge@gmail.com', '2132323232', 'testsdsd--sdfsd--dsf', 'null', 'null', 'eead033153577130d056392946e6bbe920378d8c15db4a938808ae0e82913e05836a5dbe479984084a90bb5c94465f1288f92f8789c9db1404eca960772db93f'),
(3, '700005631897', '459648', '1.00', 'NSE', 'Mon Oct 19 22:58:18 IST 2020', '7000056318971', 'Ok', '1', 'Atom Bank', '197', 'null', 'NB', '0.00', 'null', 'Knowledge', 'knowledge@gmail.com', '2132323232', 'testsdsd--sdfsd--dsf', 'null', 'null', 'eead033153577130d056392946e6bbe920378d8c15db4a938808ae0e82913e05836a5dbe479984084a90bb5c94465f1288f92f8789c9db1404eca960772db93f');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_mobileno` varchar(50) NOT NULL,
  `customer_address` text NOT NULL,
  `createtime` datetime NOT NULL,
  `customer_status` varchar(20) NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_mobileno`, `customer_address`, `createtime`, `customer_status`) VALUES
(1, 'Knowledge', 'knowledge@gmail.com', '2132323232', 'testsdsd\r\nsdfsd\r\ndsf', '2020-10-11 16:20:26', 'Enable');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atom_transaction`
--
ALTER TABLE `atom_transaction`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atom_transaction`
--
ALTER TABLE `atom_transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
