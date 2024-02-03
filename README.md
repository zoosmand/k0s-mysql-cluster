# Kubernetes Mysql NDB Cluster (K0s)

~~~ mysql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
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
CREATE USER IF NOT EXISTS `clusτeruser`@`%` IDENTIFIED BY '***';
DROP USER `cluseruser`@`%`;
~~~

~~~ mysql
GRANT ALL ON `clustertest`.`*` TO `clusτeruser`@`%`;
REVOKE ALL ON `clustertest`.`*` FROM `clusτeruser`@`%`;
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