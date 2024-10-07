-- kimlk.users definition

CREATE TABLE `users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `groups` json NOT NULL,
  `email` varchar(256) NOT NULL,
  `user` json NOT NULL,
  `ids` json NOT NULL,
  `options` json NOT NULL,
  `passwords` json NOT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=ndbcluster AUTO_INCREMENT=1660 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;