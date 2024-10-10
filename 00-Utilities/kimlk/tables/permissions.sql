-- kimlk.permissions definition

CREATE TABLE `permissions` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `permission` varchar(64) NOT NULL,
  `objects` json NOT NULL,
  `actions` json NOT NULL,
  `desctiption` varchar(256) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `permissions_permission_name_unique` (`permission`)
) ENGINE=ndbcluster DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;