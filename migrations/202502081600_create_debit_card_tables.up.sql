-- Create debit_card_design table
CREATE TABLE `debit_card_design` (
  `card_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `border_color` varchar(10) DEFAULT NULL,
  `dummy_col_9` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create debit_card_details table
CREATE TABLE `debit_card_details` (
  `card_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `issuer` varchar(100) DEFAULT NULL,
  `number` varchar(25) DEFAULT NULL,
  `dummy_col_10` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create debit_card_status table
CREATE TABLE `debit_card_status` (
  `card_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `dummy_col_8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create debit_cards table
CREATE TABLE `debit_cards` (
  `card_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dummy_col_7` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
