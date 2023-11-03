/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(40) NOT NULL,
  `image` varchar(40) NOT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(40) NOT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `arr_sub_id` varchar(20) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `rest_name` varchar(20) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(40) NOT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Lẩu bò', 'foodImage1', 200000, 'description 1', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Bò tái chanh', 'foodImage2', 300000, 'description 2', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Sườn bò nướng', 'foodImage3', 400000, 'description 3', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Cháo bò', 'foodImage4', 150000, 'description 4', 1),
(5, 'Bò luộc', 'foodImage5', 100000, 'description 5', 1),
(6, 'Bò nướng tảng', 'foodImage6', 200000, 'description 6', 1),
(7, 'Bò nhúng giấm', 'foodImage7', 180000, 'description 7', 1),
(8, 'Lẩu dê', 'foodImage8', 150000, 'description 8', 2),
(9, 'Dê hấp tía tô', 'foodImage9', 100000, 'description 9', 2),
(10, 'Dê quai', 'foodImage10', 120000, 'description 10', 2),
(11, 'Vú dê nướng ngũ vị', 'foodImage11', 150000, 'description 11', 2),
(12, 'Vú dê nướng chao', 'foodImage12', 200000, 'description 12', 2),
(13, 'Gà luộc', 'foodImage13', 100000, 'description 13', 3),
(14, 'Gà hấp hành', 'foodImage14', 100000, 'description 14', 3),
(15, 'Gà hấp mắm nhỉ', 'foodImage15', 100000, 'description 15', 3),
(16, 'Gà chiên nước mắm', 'foodImage16', 100000, 'description 16', 3),
(17, 'Gà mướn muối ớt', 'foodImage17', 100000, 'description 17', 3),
(18, 'Heo quay', 'foodImage18', 200000, 'description 18', 4),
(19, 'Heo nướng', 'foodImage19', 200000, 'description 19', 4),
(20, 'Ốc hương nướng mọi', 'foodImage20', 200000, 'description 20', 5),
(21, 'Nghêu hấp xả', 'foodImage21', 260000, 'description 21', 5),
(22, 'Sò lông nướng mỡ hành', 'foodImage22', 250000, 'description 22', 5),
(23, 'Hào nướng phô mai', 'foodImage23', 220000, 'description 23', 5),
(24, 'Ốc lát luộc', 'foodImage24', 160000, 'description 24', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món bò');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món dê');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món gà');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Món heo'),
(5, 'Hải sản');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`) VALUES
(1, 2, '2023-10-15 09:09:09', 2);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`) VALUES
(2, 2, '2023-10-17 09:09:09', 3);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`) VALUES
(2, 4, '2023-10-16 09:09:09', 4);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`) VALUES
(2, 6, '2023-10-15 09:09:09', 5),
(3, 2, '2023-10-18 09:09:09', 6),
(3, 3, '2023-10-13 09:09:09', 7),
(4, 1, '2023-10-12 09:09:09', 8),
(4, 2, '2023-10-15 09:09:09', 9),
(4, 4, '2023-10-16 09:09:09', 10),
(4, 5, '2023-10-17 09:09:09', 11),
(5, 2, '2023-10-15 09:09:09', 12),
(5, 3, '2023-10-17 09:09:09', 13),
(6, 2, '2023-10-18 09:09:09', 14),
(6, 4, '2023-10-16 09:09:09', 15),
(6, 5, '2023-10-19 09:09:09', 16),
(1, 1, '2023-10-09 17:00:00', 17);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(1, 2, 1000000, 'code1', 'arr_sub_id_1', 1);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(1, 3, 1000000, 'code2', 'arr_sub_id_2', 2);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(2, 1, 1000000, 'code3', 'arr_sub_id_3', 3);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(2, 10, 1000000, 'code4', 'arr_sub_id_4', 4),
(3, 12, 1000000, 'code5', 'arr_sub_id_5', 5),
(3, 14, 1000000, 'code6', 'arr_sub_id_6', 6),
(3, 15, 1000000, 'code7', 'arr_sub_id_7', 7),
(3, 21, 1000000, 'code8', 'arr_sub_id_8', 8),
(4, 4, 1000000, 'code9', 'arr_sub_id_9', 9),
(4, 19, 1000000, 'code10', 'arr_sub_id_10', 10),
(6, 9, 1000000, 'code11', 'arr_sub_id_11', 11),
(6, 11, 1000000, 'code12', 'arr_sub_id_12', 12),
(6, 18, 1000000, 'code13', 'arr_sub_id_13', 13),
(6, 19, 1000000, 'code14', 'arr_sub_id_14', 14),
(1, 1, 10, 'ADDCODE1', 'ADDSUB1', 15);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(1, 2, 5, '2023-10-15 10:10:10', 1);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(1, 4, 7, '2023-10-16 10:10:10', 2);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(2, 1, 6, '2023-10-16 10:10:10', 3);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(2, 2, 10, '2023-10-17 10:10:10', 4),
(3, 3, 5, '2023-10-16 10:10:10', 5),
(3, 5, 9, '2023-10-14 10:10:10', 6),
(3, 5, 5, '2023-10-15 10:10:10', 7),
(4, 1, 5, '2023-10-14 10:10:10', 8),
(5, 6, 8, '2023-10-17 10:10:10', 9),
(6, 6, 5, '2023-10-15 10:10:10', 10),
(6, 2, 6, '2023-10-16 10:10:10', 11),
(1, 6, 4, '2023-10-15 10:10:10', 12),
(1, 3, 10, '2023-10-09 17:00:00', 13);

INSERT INTO `restaurant` (`res_id`, `rest_name`, `image`, `description`) VALUES
(1, 'Nhà hàng Hương Biển', 'image1', 'Thoáng mát, đồ ăn ngon');
INSERT INTO `restaurant` (`res_id`, `rest_name`, `image`, `description`) VALUES
(2, 'Nhà hàng 5 Ri', 'image2', 'Nổi tiếng thịt dê');
INSERT INTO `restaurant` (`res_id`, `rest_name`, `image`, `description`) VALUES
(3, 'Nhà hàng Nhân Phát', 'image3', 'Thịt bò ngon');
INSERT INTO `restaurant` (`res_id`, `rest_name`, `image`, `description`) VALUES
(4, 'Nhà hàng Panda', 'image4', 'Đồ nướng ngon'),
(5, 'Nhà hàng Luxury', 'image5', 'Sang trọng'),
(6, 'Nhà hàng Thanh Nhiệt', 'image6', 'Chuyên bia hơi');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Sườn bò', 160000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Ốc cà na nướng', 100000, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Ốc cà hương xào bơ tỏi', 120000, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Ốc bưu luộc', 150000, 5);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvanA@gmail.com', 'A123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Nguyễn Văn B', 'nguyenvanB@gmail.com', 'B123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Nguyễn Văn C', 'nguyenvanC@gmail.com', 'C123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Nguyễn Văn D', 'nguyenvanD@gmail.com', 'D123456'),
(5, 'Nguyễn Văn E', 'nguyenvanE@gmail.com', 'E123456'),
(6, 'Nguyễn Văn F', 'nguyenvanF@gmail.com', 'F123456'),
(7, 'Nguyễn Văn K', 'nguyenvanK@gmail.com', 'K123456');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;