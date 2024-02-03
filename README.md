# Kubernetes Mysql NDB Cluster (K0s)

<https://www.clusterdb.com/mysql-cluster/mysql-cluster-fault-tolerance-impact-of-deployment-decisions>

~~~ mysql
ALTER USER 'root'@'localhost' IDENTIFIED BY '***';
~~~

~~~ mysql
SHOW ENGINE NDB STATUS;
~~~

~~~ bash
ndb_mgm -e show
~~~


~~~ mysql
CREATE DATABASE clustertest;
--
CREATE USER IF NOT EXISTS `clusteruser`@`%` IDENTIFIED BY '***';
DROP USER `clusteruser`@`%`;
~~~

~~~ mysql
GRANT ALL PRIVILEGES ON `clustertest`.* TO `clusteruser`@`%`;
GRANT NDB_STORED_USER ON *.* TO `clusteruser`@`%`;
--
SHOW GRANTS FOR `clusteruser`@`%`;
--
REVOKE ALL PRIVILEGES ON `clustertest`.* FROM `clusteruser`@`%`;
~~~




SHOW STATUS WHERE `variable_name` = 'Max_used_connections';
show status where variable_name = 'threads_connected';

show processlist;

select id,
       user,
       host,
       db,
       command,
       time,
       state,
       info
from information_schema.processlist;

show session status;

show global status;

STATUS;


CREATE TABLE test_table (uid INT) ENGINE=NDBCLUSTER;