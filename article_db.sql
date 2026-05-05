-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2026 at 05:53 PM
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
-- Database: `article_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `article_text`
--

CREATE TABLE `article_text` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_text`
--

INSERT INTO `article_text` (`id`, `title`, `detail`) VALUES
(1, 'Rats can see the color green', 'Rats are dichromatic which means the light receptors in their eyes only contain two types of cones: one that can detect blue wavelengths and another that detects green.'),
(2, 'Scientists have created robot out of living cells', 'These \"machines\" of cells are known as xenobots. Xenobots are primarily made up of frog cells, specifically skin and heart cells. They are programmable and capable of movement.'),
(3, 'Mario has a mustache because of computer limitations', 'The most iconic video game mascot was given a mustache because in his original game Donkey Kong, the developers had to draw him within a sprite size of 16 by 16 due to the technological limitations of the early 80s. They also only had a color limit of 3. Giving their main character a mustache was an easy way to give him a distinct face under those restrictions.'),
(4, 'There\'s a crystal that grows out of fossils and sometimes even corpses', 'The mineral is called vivianite. It\'s usually colorless but when oxidized, it takes the form of a blueish green crystal. It\'s formed from phosphorus, iron, and water. So under certain conditions if an organism were to die and decompose near some iron, it is possible for the water and phosphorus of their body to crystalize into vivianite. '),
(5, 'The short story \"I Have No Mouth And I Must Scream\" has a video game adaptation made in 1995', 'The author of the original story, Harlan Ellison, was very involved in the creation of the video game adaptation. He is even the voice actor of the main antagonist, AM. The game reimagines the story as a narrative driven point and click that expands on the world and backstories of the characters.');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `source` char(100) NOT NULL,
  `colorHex` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`id`, `name`, `description`, `source`, `colorHex`) VALUES
(1, 'Matthew', 'The horned beetle is capable of squirting poisonous blood from its eyes which it uses to scare off predators.', 'Wikipedia', '#2b3e94');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('siteAdmin', 'Password123!'),
('sitemaster', 'Secret');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_text`
--
ALTER TABLE `article_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_text`
--
ALTER TABLE `article_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
