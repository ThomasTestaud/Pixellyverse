-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 10 déc. 2023 à 20:20
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Pixellyverse`
--

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `user_id`, `name`, `description`, `status`) VALUES
(1, 1, 'First room', 'This is the first room ever created', 0);

-- --------------------------------------------------------

--
-- Structure de la table `room_pixels`
--

CREATE TABLE `room_pixels` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `room_pixels`
--

INSERT INTO `room_pixels` (`id`, `room_id`, `x`, `y`, `color`) VALUES
(1, 1, 52, 23, 'red'),
(2, 1, 54, 22, 'red'),
(3, 1, 49, 19, 'red'),
(4, 1, 48, 22, 'red'),
(5, 1, 48, 27, 'red'),
(6, 1, 58, 16, 'red'),
(7, 1, 40, 30, 'red'),
(8, 1, 50, 40, 'red'),
(9, 1, 39, 10, 'green'),
(10, 1, 38, 10, 'green'),
(11, 1, 36, 11, 'green'),
(12, 1, 37, 11, 'green'),
(13, 1, 35, 12, 'green'),
(14, 1, 34, 12, 'green'),
(15, 1, 33, 13, 'green'),
(16, 1, 32, 13, 'green'),
(17, 1, 31, 14, 'green'),
(18, 1, 30, 14, 'green'),
(19, 1, 29, 15, 'green'),
(20, 1, 28, 15, 'green'),
(21, 1, 27, 16, 'green'),
(22, 1, 26, 16, 'green'),
(23, 1, 25, 17, 'green'),
(24, 1, 24, 17, 'green'),
(25, 1, 23, 18, 'green'),
(26, 1, 22, 18, 'green'),
(27, 1, 21, 19, 'green'),
(28, 1, 20, 19, 'green'),
(29, 1, 19, 20, 'green'),
(30, 1, 18, 20, 'green'),
(31, 1, 40, 9, 'green'),
(32, 1, 41, 9, 'green'),
(33, 1, 42, 8, 'green'),
(34, 1, 43, 8, 'green'),
(35, 1, 44, 7, 'green'),
(36, 1, 46, 7, 'green'),
(37, 1, 45, 6, 'green'),
(38, 1, 45, 7, 'green'),
(39, 1, 46, 6, 'green'),
(40, 1, 47, 6, 'green'),
(41, 1, 45, 6, 'blue'),
(42, 1, 46, 7, 'blue'),
(43, 1, 47, 6, 'blue'),
(44, 1, 47, 6, 'green'),
(45, 1, 48, 5, 'green'),
(46, 1, 49, 5, 'green'),
(47, 1, 50, 4, 'green'),
(48, 1, 51, 4, 'green'),
(49, 1, 52, 5, 'green'),
(50, 1, 53, 5, 'green'),
(51, 1, 54, 6, 'green'),
(52, 1, 55, 6, 'green'),
(53, 1, 56, 7, 'green'),
(54, 1, 57, 7, 'green'),
(55, 1, 58, 8, 'green'),
(56, 1, 60, 8, 'green'),
(57, 1, 59, 8, 'green'),
(58, 1, 60, 9, 'green'),
(59, 1, 61, 9, 'green'),
(60, 1, 62, 11, 'green'),
(61, 1, 62, 10, 'green'),
(62, 1, 63, 10, 'green'),
(63, 1, 64, 11, 'green'),
(64, 1, 65, 11, 'green'),
(65, 1, 66, 12, 'green'),
(66, 1, 67, 12, 'green'),
(67, 1, 68, 13, 'green'),
(68, 1, 69, 13, 'green'),
(69, 1, 18, 21, 'green'),
(70, 1, 18, 23, 'green'),
(71, 1, 18, 25, 'green'),
(72, 1, 18, 26, 'green'),
(73, 1, 18, 28, 'green'),
(74, 1, 18, 30, 'green'),
(75, 1, 18, 32, 'green'),
(76, 1, 18, 34, 'green'),
(77, 1, 18, 36, 'green'),
(78, 1, 19, 36, 'green'),
(79, 1, 20, 35, 'green'),
(80, 1, 21, 35, 'green'),
(81, 1, 22, 34, 'green'),
(82, 1, 23, 34, 'green'),
(83, 1, 24, 33, 'green'),
(84, 1, 25, 33, 'green'),
(85, 1, 26, 32, 'green'),
(86, 1, 27, 32, 'green'),
(87, 1, 28, 31, 'green'),
(88, 1, 29, 31, 'green'),
(89, 1, 30, 30, 'green'),
(90, 1, 31, 30, 'green'),
(91, 1, 32, 29, 'green'),
(92, 1, 33, 29, 'green'),
(93, 1, 34, 28, 'green'),
(94, 1, 35, 28, 'green'),
(95, 1, 36, 27, 'green'),
(96, 1, 37, 27, 'green'),
(97, 1, 38, 26, 'green'),
(98, 1, 39, 26, 'green'),
(99, 1, 41, 25, 'green'),
(100, 1, 40, 25, 'green'),
(101, 1, 42, 24, 'green'),
(102, 1, 43, 24, 'green'),
(103, 1, 44, 23, 'green'),
(104, 1, 45, 23, 'green'),
(105, 1, 46, 22, 'green'),
(106, 1, 47, 22, 'green'),
(107, 1, 48, 21, 'green'),
(108, 1, 49, 21, 'green'),
(109, 1, 50, 20, 'green'),
(110, 1, 51, 20, 'green'),
(111, 1, 52, 21, 'green'),
(112, 1, 53, 21, 'green'),
(113, 1, 54, 22, 'green'),
(114, 1, 55, 22, 'green'),
(115, 1, 56, 23, 'green'),
(116, 1, 57, 23, 'green'),
(117, 1, 58, 24, 'green'),
(118, 1, 59, 24, 'green'),
(119, 1, 60, 25, 'green'),
(120, 1, 61, 25, 'green'),
(121, 1, 60, 8, 'blue'),
(122, 1, 62, 11, 'blue'),
(123, 1, 62, 26, 'green'),
(124, 1, 63, 26, 'green'),
(125, 1, 65, 27, 'green'),
(126, 1, 64, 27, 'green'),
(127, 1, 66, 28, 'green'),
(128, 1, 67, 28, 'green'),
(129, 1, 68, 29, 'green'),
(130, 1, 69, 29, 'green'),
(131, 1, 69, 28, 'green'),
(132, 1, 69, 26, 'green'),
(133, 1, 69, 24, 'green'),
(134, 1, 69, 22, 'green'),
(135, 1, 69, 20, 'green'),
(136, 1, 69, 19, 'green'),
(137, 1, 69, 17, 'green'),
(138, 1, 69, 15, 'green'),
(139, 1, 69, 14, 'green'),
(140, 1, 51, 7, 'green'),
(141, 1, 50, 9, 'green'),
(142, 1, 51, 11, 'green'),
(143, 1, 50, 13, 'green'),
(144, 1, 51, 15, 'green'),
(145, 1, 50, 17, 'green'),
(146, 1, 51, 19, 'green'),
(147, 1, 50, 5, 'green'),
(148, 1, 50, 5, 'blue'),
(149, 1, 49, 19, 'blue'),
(150, 1, 48, 22, 'blue'),
(151, 1, 52, 23, 'blue'),
(152, 1, 58, 16, 'blue'),
(153, 1, 48, 27, 'blue'),
(154, 1, 40, 30, 'blue'),
(155, 1, 50, 40, 'blue'),
(156, 1, 69, 30, 'green'),
(157, 1, 68, 30, 'green'),
(158, 1, 67, 31, 'green'),
(159, 1, 66, 31, 'green'),
(160, 1, 65, 32, 'green'),
(161, 1, 64, 32, 'green'),
(162, 1, 63, 33, 'green'),
(163, 1, 62, 33, 'green'),
(164, 1, 61, 34, 'green'),
(165, 1, 60, 34, 'green'),
(166, 1, 59, 35, 'green'),
(167, 1, 58, 35, 'green'),
(168, 1, 57, 36, 'green'),
(169, 1, 56, 36, 'green'),
(170, 1, 55, 37, 'green'),
(171, 1, 54, 37, 'green'),
(172, 1, 53, 38, 'green'),
(173, 1, 52, 38, 'green'),
(174, 1, 51, 39, 'green'),
(175, 1, 50, 39, 'green'),
(176, 1, 49, 40, 'green'),
(177, 1, 48, 40, 'green'),
(178, 1, 47, 41, 'green'),
(179, 1, 46, 41, 'green'),
(180, 1, 45, 42, 'green'),
(181, 1, 44, 42, 'green'),
(182, 1, 43, 43, 'green'),
(183, 1, 42, 43, 'green'),
(184, 1, 41, 44, 'green'),
(185, 1, 40, 44, 'green'),
(186, 1, 39, 45, 'green'),
(187, 1, 38, 45, 'green'),
(188, 1, 37, 46, 'green'),
(189, 1, 36, 46, 'green'),
(190, 1, 18, 37, 'green'),
(191, 1, 19, 37, 'green'),
(192, 1, 20, 38, 'green'),
(193, 1, 21, 38, 'green'),
(194, 1, 22, 39, 'green'),
(195, 1, 24, 39, 'green'),
(196, 1, 23, 39, 'green'),
(197, 1, 24, 40, 'green'),
(198, 1, 25, 40, 'green'),
(199, 1, 26, 41, 'green'),
(200, 1, 27, 41, 'green'),
(201, 1, 28, 42, 'green'),
(202, 1, 29, 42, 'green'),
(203, 1, 30, 43, 'green'),
(204, 1, 31, 43, 'green'),
(205, 1, 32, 44, 'green'),
(206, 1, 33, 44, 'green'),
(207, 1, 34, 46, 'green'),
(208, 1, 34, 45, 'green'),
(209, 1, 35, 45, 'green'),
(210, 1, 24, 39, 'blue'),
(211, 1, 34, 46, 'blue'),
(212, 1, 18, 24, 'green'),
(213, 1, 18, 22, 'green'),
(214, 1, 18, 27, 'green'),
(215, 1, 18, 29, 'green'),
(216, 1, 18, 31, 'green'),
(217, 1, 18, 33, 'green'),
(218, 1, 18, 35, 'green'),
(219, 1, 69, 16, 'green'),
(220, 1, 69, 18, 'green'),
(221, 1, 69, 21, 'green'),
(222, 1, 69, 23, 'green'),
(223, 1, 69, 25, 'green'),
(224, 1, 69, 27, 'green'),
(225, 1, 51, 18, 'green'),
(226, 1, 50, 16, 'green'),
(227, 1, 51, 14, 'green'),
(228, 1, 50, 10, 'green'),
(229, 1, 51, 12, 'green'),
(230, 1, 50, 8, 'green'),
(231, 1, 51, 6, 'green'),
(232, 1, 50, 5, 'green'),
(233, 1, 66, 17, 'green'),
(234, 1, 66, 19, 'green'),
(235, 1, 66, 18, 'green'),
(236, 1, 66, 20, 'green'),
(237, 1, 66, 22, 'green'),
(238, 1, 66, 21, 'green'),
(239, 1, 65, 17, 'green'),
(240, 1, 64, 16, 'green'),
(241, 1, 63, 16, 'green'),
(242, 1, 62, 15, 'green'),
(243, 1, 61, 15, 'green'),
(244, 1, 60, 15, 'green'),
(245, 1, 60, 15, 'green'),
(246, 1, 60, 15, 'green'),
(247, 1, 60, 14, 'green'),
(248, 1, 60, 16, 'green'),
(249, 1, 60, 17, 'green'),
(250, 1, 60, 18, 'green'),
(251, 1, 65, 22, 'green'),
(252, 1, 64, 21, 'green'),
(253, 1, 63, 21, 'green'),
(254, 1, 62, 20, 'green'),
(255, 1, 61, 20, 'green'),
(256, 1, 60, 19, 'green'),
(257, 1, 59, 14, 'green'),
(258, 1, 58, 13, 'green'),
(259, 1, 57, 13, 'green'),
(260, 1, 56, 12, 'green'),
(261, 1, 55, 12, 'green'),
(262, 1, 54, 11, 'green'),
(263, 1, 54, 12, 'green'),
(264, 1, 54, 13, 'green'),
(265, 1, 54, 15, 'green'),
(266, 1, 54, 14, 'green'),
(267, 1, 59, 19, 'green'),
(268, 1, 58, 18, 'green'),
(269, 1, 57, 18, 'green'),
(270, 1, 56, 17, 'green'),
(271, 1, 55, 17, 'green'),
(272, 1, 54, 16, 'green'),
(273, 1, 48, 20, 'green'),
(274, 1, 48, 19, 'green'),
(275, 1, 48, 17, 'green'),
(276, 1, 48, 18, 'green'),
(277, 1, 48, 16, 'green'),
(278, 1, 48, 14, 'green'),
(279, 1, 48, 15, 'green'),
(280, 1, 48, 13, 'green'),
(281, 1, 47, 13, 'green'),
(282, 1, 46, 14, 'green'),
(283, 1, 45, 15, 'green'),
(284, 1, 45, 14, 'green'),
(285, 1, 44, 15, 'green'),
(286, 1, 43, 15, 'green'),
(287, 1, 43, 16, 'green'),
(288, 1, 43, 17, 'green'),
(289, 1, 43, 19, 'green'),
(290, 1, 43, 18, 'green'),
(291, 1, 43, 20, 'green'),
(292, 1, 43, 22, 'green'),
(293, 1, 43, 21, 'green'),
(294, 1, 43, 23, 'green'),
(295, 1, 45, 15, 'blue'),
(296, 1, 46, 13, 'blue'),
(297, 1, 30, 20, 'red'),
(298, 1, 29, 20, 'red'),
(299, 1, 28, 21, 'red'),
(300, 1, 27, 22, 'red'),
(301, 1, 27, 21, 'red'),
(302, 1, 26, 22, 'red'),
(303, 1, 25, 22, 'red'),
(304, 1, 27, 22, 'blue'),
(305, 1, 25, 23, 'red'),
(306, 1, 25, 25, 'red'),
(307, 1, 25, 24, 'red'),
(308, 1, 25, 26, 'red'),
(309, 1, 25, 28, 'red'),
(310, 1, 25, 27, 'red'),
(311, 1, 25, 29, 'red'),
(312, 1, 25, 30, 'red'),
(313, 1, 25, 31, 'red'),
(314, 1, 25, 32, 'red'),
(315, 1, 25, 33, 'red'),
(316, 1, 26, 33, 'red'),
(317, 1, 27, 34, 'red'),
(318, 1, 28, 34, 'red'),
(319, 1, 29, 35, 'red'),
(320, 1, 26, 23, 'red'),
(321, 1, 27, 24, 'red'),
(322, 1, 28, 24, 'red'),
(323, 1, 29, 25, 'red'),
(324, 1, 30, 25, 'red'),
(325, 1, 30, 35, 'red'),
(326, 1, 30, 26, 'red'),
(327, 1, 30, 27, 'red'),
(328, 1, 30, 28, 'red'),
(329, 1, 30, 29, 'red'),
(330, 1, 30, 30, 'red'),
(331, 1, 30, 31, 'red'),
(332, 1, 30, 32, 'red'),
(333, 1, 30, 34, 'red'),
(334, 1, 30, 33, 'red'),
(335, 1, 31, 25, 'red'),
(336, 1, 32, 24, 'red'),
(337, 1, 33, 24, 'red'),
(338, 1, 31, 19, 'red'),
(339, 1, 32, 19, 'red'),
(340, 1, 33, 20, 'red'),
(341, 1, 34, 20, 'red'),
(342, 1, 35, 21, 'red'),
(343, 1, 36, 22, 'red'),
(344, 1, 36, 21, 'red'),
(345, 1, 34, 23, 'red'),
(346, 1, 35, 23, 'red'),
(347, 1, 37, 22, 'red'),
(348, 1, 37, 23, 'red'),
(349, 1, 37, 24, 'red'),
(350, 1, 37, 26, 'red'),
(351, 1, 37, 25, 'red'),
(352, 1, 37, 27, 'red'),
(353, 1, 37, 28, 'red'),
(354, 1, 37, 29, 'red'),
(355, 1, 37, 31, 'red'),
(356, 1, 37, 30, 'red'),
(357, 1, 31, 35, 'red'),
(358, 1, 32, 34, 'red'),
(359, 1, 33, 34, 'red'),
(360, 1, 34, 33, 'red'),
(361, 1, 35, 33, 'red'),
(362, 1, 36, 32, 'red'),
(363, 1, 37, 32, 'red'),
(364, 1, 31, 26, 'blue'),
(365, 1, 31, 27, 'blue'),
(366, 1, 31, 28, 'blue'),
(367, 1, 31, 29, 'blue'),
(368, 1, 31, 30, 'blue'),
(369, 1, 31, 31, 'blue'),
(370, 1, 31, 33, 'blue'),
(371, 1, 31, 32, 'blue'),
(372, 1, 31, 34, 'blue'),
(373, 1, 32, 33, 'blue'),
(374, 1, 33, 33, 'blue'),
(375, 1, 32, 29, 'blue'),
(376, 1, 33, 29, 'blue'),
(377, 1, 34, 28, 'blue'),
(378, 1, 35, 28, 'blue'),
(379, 1, 36, 27, 'blue'),
(380, 1, 29, 31, 'blue'),
(381, 1, 28, 31, 'blue'),
(382, 1, 27, 32, 'blue'),
(383, 1, 26, 32, 'blue'),
(384, 1, 26, 31, 'blue'),
(385, 1, 27, 31, 'blue'),
(386, 1, 27, 29, 'blue'),
(387, 1, 26, 24, 'blue'),
(388, 1, 26, 26, 'blue'),
(389, 1, 26, 25, 'blue'),
(390, 1, 26, 27, 'blue'),
(391, 1, 26, 29, 'blue'),
(392, 1, 26, 30, 'blue'),
(393, 1, 27, 30, 'blue'),
(394, 1, 27, 28, 'blue'),
(395, 1, 26, 28, 'blue'),
(396, 1, 29, 32, 'blue'),
(397, 1, 29, 33, 'blue'),
(398, 1, 29, 34, 'blue'),
(399, 1, 28, 33, 'blue'),
(400, 1, 27, 33, 'blue'),
(401, 1, 28, 32, 'blue'),
(402, 1, 29, 27, 'blue'),
(403, 1, 29, 29, 'blue'),
(404, 1, 29, 28, 'blue'),
(405, 1, 29, 30, 'blue'),
(406, 1, 28, 30, 'blue'),
(407, 1, 28, 27, 'blue'),
(408, 1, 33, 25, 'blue'),
(409, 1, 32, 25, 'blue'),
(410, 1, 32, 26, 'blue'),
(411, 1, 34, 24, 'blue'),
(412, 1, 35, 24, 'blue'),
(413, 1, 36, 23, 'blue'),
(414, 1, 36, 25, 'blue'),
(415, 1, 36, 24, 'blue'),
(416, 1, 36, 27, 'blue'),
(417, 1, 34, 26, 'blue'),
(418, 1, 35, 25, 'blue'),
(419, 1, 34, 25, 'blue'),
(420, 1, 33, 27, 'blue'),
(421, 1, 33, 27, 'blue'),
(422, 1, 33, 28, 'blue'),
(423, 1, 36, 28, 'blue'),
(424, 1, 36, 30, 'blue'),
(425, 1, 36, 31, 'blue'),
(426, 1, 35, 32, 'blue'),
(427, 1, 36, 29, 'blue'),
(428, 1, 34, 29, 'blue'),
(429, 1, 34, 29, 'blue'),
(430, 1, 34, 31, 'blue'),
(431, 1, 35, 30, 'blue'),
(432, 1, 35, 29, 'blue'),
(433, 1, 32, 31, 'blue'),
(434, 1, 33, 32, 'blue'),
(435, 1, 35, 27, 'blue'),
(436, 1, 35, 26, 'blue'),
(437, 1, 32, 21, 'blue'),
(438, 1, 34, 22, 'blue'),
(439, 1, 31, 23, 'blue'),
(440, 1, 29, 23, 'blue'),
(441, 1, 29, 24, 'blue'),
(442, 1, 31, 21, 'blue'),
(443, 1, 31, 20, 'blue'),
(444, 1, 30, 22, 'blue'),
(445, 1, 33, 22, 'blue'),
(446, 1, 34, 21, 'blue'),
(447, 1, 32, 23, 'blue'),
(448, 1, 32, 23, 'blue'),
(449, 1, 32, 23, 'blue'),
(450, 1, 30, 21, 'blue'),
(451, 1, 29, 22, 'blue'),
(452, 1, 27, 23, 'blue'),
(453, 1, 30, 24, 'blue'),
(454, 1, 32, 22, 'blue'),
(455, 1, 28, 26, 'blue'),
(456, 1, 27, 25, 'blue');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `room_pixels`
--
ALTER TABLE `room_pixels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `room_pixels`
--
ALTER TABLE `room_pixels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `room_pixels`
--
ALTER TABLE `room_pixels`
  ADD CONSTRAINT `room_pixels_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
