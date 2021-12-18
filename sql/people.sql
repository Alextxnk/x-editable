-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 02, 2017 at 04:41 PM
-- Server version: 5.5.50
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_yii2_grid_view_editable`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--
INSERT INTO `people` (`id`, `name`, `email`, `phone`, `company`, `note`, `status`, `date`, `address`) VALUES
(1, 'Иван Иванов', 'ivan@ivanov.co', '(007) 777-8888', 'Инторг', 'Пользователь для теста', 'Активный', 1483218000, 'Днепр, ул. Хмельницкого, дом. 7'),
(2, 'Богдан Хмелько', 'bogdan@i.ua', '(052) 548-5544', '', 'Тестовая заметка', 'Устарел', 634942800, 'Полтава, ул. Информационная, дом. 12'),
(3, 'Кирилл Смолка', 'ki.r@i.ua', '(568) 545-8454', '', '', 'Активный', 343515600, 'NY, ул. 104, дом. 1'),
(4, 'Олег Гришин', 'ol@gr.com', '', '', 'Важная заметка', 'Активный', 1890000, 'Будущего, ул. И.Мазепы, дом. 91'),
(5, 'Руслан Миронов', '', '(454) 454-5454', 'Ворт', '', 'Заблокирован', 312670800, 'Филах, ул. Филах, дом. 2'),
(6, 'Антон Кот', '', '', '', 'Интересная заметка', 'Активный', 785797200, 'Гродно, ул. Неман, дом. 55'),
(7, 'Виталий Стрелка', '', '(454) 547-7755', 'Машинвест', '', 'Заблокирован', 582408000, 'Варегем, ул. Игем, дом. 123'),
(8, 'Виктор Капустин', 'vik@kap.com', '(757) 575-7575', '', '', 'Устарел', 248734800, 'Видин, ул. Ингород, дом. 213'),
(9, 'Валентин Смирнов', '', '', '', '', 'Устарел', 870984000, 'Зирц, ул. 55, дом. 3'),
(10, 'Богдан Величько', '', '(453) 453-4378', 'КоГро', 'Знает где лежит список городов', 'Активный', 645912000, 'Дюссельдорф, ул. 112, дом. 445');
--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
