-- Create banners table
CREATE TABLE `banners` (
  `banner_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `dummy_col_11` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
