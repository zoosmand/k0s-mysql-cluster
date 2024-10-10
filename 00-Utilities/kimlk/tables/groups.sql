-- kimlk.`groups` definition

CREATE TABLE `groups` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `roles` json NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `groups_group_name_unique` (`group`)
) ENGINE=ndbcluster AUTO_INCREMENT=513 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;