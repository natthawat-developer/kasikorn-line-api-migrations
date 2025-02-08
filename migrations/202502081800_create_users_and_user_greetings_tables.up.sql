-- Create users table
CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dummy_col_1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create user_greetings table
CREATE TABLE `user_greetings` (
  `user_id` varchar(50) NOT NULL,
  `greeting` text,
  `dummy_col_2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
