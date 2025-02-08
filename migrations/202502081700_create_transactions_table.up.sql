-- Create transactions table
CREATE TABLE `transactions` (
  `transaction_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isBank` tinyint(1) DEFAULT NULL,
  `dummy_col_6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
