-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 11 月 16 日 16:16
-- サーバのバージョン： 5.7.17-log
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineskillup`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `board`
--

CREATE TABLE `board` (
  `name` text NOT NULL,
  `message` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `board`
--

INSERT INTO `board` (`name`, `message`, `created`, `color`) VALUES
('A', 'hello', '2017-11-16 04:44:54', '#000000'),
('B', 'Hi', '2017-11-16 04:45:24', '#0000ff'),
('C', 'I\'m C', '2017-11-16 04:45:39', '#ff0000'),
('A', 'bye', '2017-11-16 04:45:51', '#000000'),
('B', 'bye', '2017-11-16 04:46:05', '#0000ff'),
('C', 'bye', '2017-11-16 04:48:09', '#ff0000'),
('C', 'bye', '2017-11-16 04:49:27', '#ff0000'),
('C', 'bye', '2017-11-16 04:50:03', '#ff0000'),
('D', 'thank you!', '2017-11-16 04:50:23', '#000000'),
('E', 'Good!\r\n(>_<)', '2017-11-16 06:50:44', '#0000ff'),
('F', 'Yes!(^-^)', '2017-11-16 06:58:49', '#ff0000'),
('F', 'Yes!(^-^)', '2017-11-16 06:59:28', '#ff0000'),
('F', 'Yes!(^-^)', '2017-11-16 07:01:33', '#ff0000'),
('G', 'hello', '2017-11-16 07:05:29', '#000000'),
('G', 'bye', '2017-11-16 07:14:14', '#000000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
