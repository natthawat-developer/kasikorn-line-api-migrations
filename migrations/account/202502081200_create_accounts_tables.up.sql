CREATE TABLE `accounts` (
  `account_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `dummy_col_3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `account_balances` (
  `account_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `dummy_col_4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `account_details` (
  `account_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `is_main_account` tinyint(1) DEFAULT NULL,
  `progress` int DEFAULT NULL,
  `dummy_col_5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `account_flags` (
  `flag_id` int NOT NULL AUTO_INCREMENT,
  `account_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `flag_type` varchar(50) NOT NULL,
  `flag_value` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`flag_id`),
  FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
