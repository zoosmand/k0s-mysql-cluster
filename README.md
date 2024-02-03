# Kubernetes Mysql NDB Cluster (K0s)

<https://www.clusterdb.com/mysql-cluster/mysql-cluster-fault-tolerance-impact-of-deployment-decisions>

~~~ sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '***';
~~~

~~~ sql
SHOW ENGINE NDB STATUS;
~~~

~~~ bash
ndb_mgm -e show
~~~


~~~ sql
CREATE DATABASE clustertest;
--
CREATE USER IF NOT EXISTS `clusteruser`@`%` IDENTIFIED BY '***';
DROP USER `clusteruser`@`%`;
~~~

~~~ sql
GRANT ALL PRIVILEGES ON `clustertest`.* TO `clusteruser`@`%`;
GRANT NDB_STORED_USER ON *.* TO `clusteruser`@`%`;
--
SHOW GRANTS FOR `clusteruser`@`%`;
--
REVOKE ALL PRIVILEGES ON `clustertest`.* FROM `clusteruser`@`%`;
~~~

~~~ sql
CREATE TABLE clustertest.test_table (
	uid INT auto_increment NOT NULL,
	CONSTRAINT test_table_pk PRIMARY KEY (uid)
)
ENGINE=ndbcluster
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
~~~

~~~ sql
SHOW STATUS WHERE `variable_name` = 'Max_used_connections';
~~~

~~~ sql
SHOW STATUS WHERE variable_name = 'threads_connected';
~~~

~~~ sql
SHOW PROCESSLIST;
~~~

~~~ sql
SELECT id,
       user,
       host,
       db,
       command,
       time,
       state,
       info
FROM information_schema.processlist;
~~~

~~~ sql
SHOW SESSION STATUS;
~~~

~~~ sql
SHOW GLOBAL STATUS;
~~~

~~~ sql
STATUS;
~~~

~~~ sql
CREATE TABLE clustertest.test_table (
	uid INT auto_increment NOT NULL,
	CONSTRAINT test_table_pk PRIMARY KEY (uid)
)
ENGINE=ndbcluster
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
~~~
