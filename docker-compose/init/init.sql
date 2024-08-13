-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 28 mars 2024 à 17:00
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `amsdbrest2024`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `provider_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `label`, `picture`, `price`, `provider_id`) VALUES
(1, 'Samsung Galaxy S20', 'samsungs20.png', 999.99, 1),
(2, 'HP Pavilion 15', 'hp_pavilion.png', 799.99, 2),
(3, 'Apple iPhone 12', 'iphone12.png', 1099.99, 3),
(4, 'Dell XPS 13', 'dell_xps13.png', 1299.99, 4),
(5, 'Sony WH-1000XM4', 'sony_wh1000xm4.png', 349.99, 5),
(6, 'Asus ROG Zephyrus', 'asus_rog.png', 1599.99, 6),
(7, 'Lenovo ThinkPad X1', 'lenovo_thinkpad.png', 1399.99, 7),
(8, 'Google Pixel 5', 'pixel5.png', 699.99, 8),
(9, 'OnePlus 8T', 'oneplus8t.png', 749.99, 9),
(10, 'Microsoft Surface Pro 7', 'surface_pro7.png', 899.99, 10),
(11, 'LG OLED TV', 'lg_oled.png', 1999.99, 11),
(12, 'Canon EOS R5', 'canon_eosr5.png', 3899.99, 12),
(13, 'Nikon Z6', 'nikon_z6.png', 1799.99, 13),
(14, 'Bose SoundLink', 'bose_soundlink.png', 299.99, 14),
(15, 'Amazon Echo Dot', 'echo_dot.png', 49.99, 15),
(16, 'Apple Watch Series 6', 'apple_watch.png', 399.99, 3),
(17, 'GoPro Hero 9', 'gopro_hero9.png', 499.99, 5),
(18, 'iPad Air 4th Gen', 'ipad_air.png', 599.99, 3),
(19, 'Nintendo Switch', 'nintendo_switch.png', 299.99, 16),
(20, 'Roku Streaming Stick', 'roku_stick.png', 49.99, 17);

-- --------------------------------------------------------

--
-- Structure de la table `article_seq`
--

CREATE TABLE `article_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article_seq`
--

INSERT INTO `article_seq` (`next_val`) VALUES
(21);

-- --------------------------------------------------------

--
-- Structure de la table `provider`
--

CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `provider`
--

INSERT INTO `provider` (`id`, `address`, `email`, `name`, `logo`) VALUES
(1, 'South Korea', 'contact@samsung.com', 'Samsung', 'samsung_logo.png'),
(2, 'USA', 'support@hp.com', 'HP', 'hp_logo.png'),
(3, 'USA', 'support@apple.com', 'Apple', 'apple_logo.png'),
(4, 'USA', 'support@dell.com', 'Dell', 'dell_logo.png'),
(5, 'Japan', 'support@sony.com', 'Sony', 'sony_logo.png'),
(6, 'Taiwan', 'support@asus.com', 'Asus', 'asus_logo.png'),
(7, 'China', 'support@lenovo.com', 'Lenovo', 'lenovo_logo.png'),
(8, 'USA', 'support@google.com', 'Google', 'google_logo.png'),
(9, 'China', 'support@oneplus.com', 'OnePlus', 'oneplus_logo.png'),
(10, 'USA', 'support@microsoft.com', 'Microsoft', 'microsoft_logo.png'),
(11, 'South Korea', 'support@lg.com', 'LG', 'lg_logo.png'),
(12, 'Japan', 'support@canon.com', 'Canon', 'canon_logo.png'),
(13, 'Japan', 'support@nikon.com', 'Nikon', 'nikon_logo.png'),
(14, 'USA', 'support@bose.com', 'Bose', 'bose_logo.png'),
(15, 'USA', 'support@amazon.com', 'Amazon', 'amazon_logo.png'),
(16, 'France', 'support@orange.com', 'Orange', 'orange_logo.png'),
(17, 'USA', 'support@roku.com', 'Roku', 'roku_logo.png'),
(18, 'Germany', 'support@sap.com', 'SAP', 'sap_logo.png'),
(19, 'Finland', 'support@nokia.com', 'Nokia', 'nokia_logo.png'),
(20, 'Canada', 'support@blackberry.com', 'BlackBerry', 'blackberry_logo.png');

-- --------------------------------------------------------

--
-- Structure de la table `provider_seq`
--

CREATE TABLE `provider_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `provider_seq`
--

INSERT INTO `provider_seq` (`next_val`) VALUES
(21);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` enum('SUPER_ADMIN','ADMIN','USER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'USER'),
(2, 'ADMIN'),
(6, 'SUPER_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`) VALUES
(1, 'amine.mezghich@gmail.com', '$2a$10$0pQ/tMkITl.Mk8YzQnvMf.ec1IsIHe8fycaqJGPQncTfRmrUYZ122', 'amine'),
(2, 'amine.mezghich@ensi-uma.tn', '$2a$10$WTFqkdde8qJdWdjKDzkOHul7Ks.bdeyuIepZRt1H4yeFW4S74LDWS', 'mezghich'),
(8, 'hakim@gmail.com', '$2a$10$RVlg2uSo2B3i.npmtBmkIO2Nr.2BG8dg1tKhk114Q/qiAA3SXzBxq', 'hakim'),
(9, 'ma.mezghich@smart-it-partner.com', '$2a$10$wAizdMmoBUJ48ErxUJxlb.PR4UwAku9rLIZVt3Roc39/2/lwgci5y', 'mohamedmezghich'),
(10, 'ib@smart-it-partner.com', '$2a$10$OaFAcTG3Jn.U6lSrkz2rmeGvQB51e/Q2BU4K28Bz.Curze9yPD0JW', 'Ibtissem'),
(11, 'ib2@smart-it-partner.com', '$2a$10$Ctsgemfys1FjqAUy56i1y.ziME7LgntE1V7hG76sjirnX0VbhLBNG', 'Ibtissem2'),
(12, 'fatima@gmail.com', '$2a$10$yeBIsE6g1fLjNF2HiHsJU.Bz97ZYrAJM1T1W2NvQmci2YYd1UXgQi', 'fatima'),
(13, 'ali@gmail.com', '$2a$10$K7Wj8QJtU9rUwFEK4n4SOe6m8XoE9H0Kk2VJZZmnlgpRhSMboJu1a', 'ali'),
(14, 'john.doe@example.com', '$2a$10$6o2lL8S2ctb8RCjYl6jsT.9YQ2t/5Ey9c.e/r7Zw1M1mGrD5uZ66q', 'johndoe'),
(15, 'jane.doe@example.com', '$2a$10$YaMAQIPaVxZlNhe/WxHkbOGt/HoylVMIg3GgK2/W3jKl7m5Rb5SBy', 'janedoe'),
(16, 'peter.parker@example.com', '$2a$10$LpDqT3vCk6MNup1Iq3Ed/.P7q0xhSM4L7Ksqh0GZG4zFowjKakHka', 'peterparker'),
(17, 'clark.kent@example.com', '$2a$10$uPqT0.xBFWTR6PYG.8L4oZ.hXb.jUib1ZVJWqet6sLCL9W3q3lLe6', 'clarkkent'),
(18, 'bruce.wayne@example.com', '$2a$10$2hzv9r/XtH8r9P0pC8Uw7eCh2HkEOUqK4t5crwAWCEzE4d0o7BntW', 'brucewayne'),
(19, 'diana.prince@example.com', '$2a$10$XnFv9W9vV7q7KN3Azb/9UeTwcnO3aGbO27wh/ITXlzFWc8ZZ1jTk6', 'dianaprince'),
(20, 'barry.allen@example.com', '$2a$10$gS5MA7JtA2eOQFk6uyTHFfS8k1CV6n2Ek.aH0MPGniNHEmTkrrmGG', 'barryallen');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(1, 6),
(2, 1),
(8, 2),
(8, 6),
(9, 1),
(10, 1),
(11, 2),
(11, 6),
(12, 1),
(13, 2),
(14, 1),
(15, 1),
(16, 1),
(17, 2),
(18, 2),
(19, 1),
(20, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmnpkd1byk5tf93jmt5vay3c2y` (`provider_id`);

--
-- Index pour la table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FKmnpkd1byk5tf93jmt5vay3c2y` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;