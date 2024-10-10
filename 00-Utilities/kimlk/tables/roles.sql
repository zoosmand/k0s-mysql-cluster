-- kimlk.roles definition

CREATE TABLE `roles` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(64) NOT NULL,
  `permissions` json NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `roles_role_name_unique` (`role`)
) ENGINE=ndbcluster DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;