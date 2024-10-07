#!/usr/bin/env bash

CURRENT_DIR=$(pwd)
CONFIG=/etc/mysql/my.cnf
PATH=$CURRENT_DIR:$PATH
THRESHOLD=9
CNT=0

LOGDIR=/var/log/mysql
LOGFILE=$LOGDIR/error.log
mkdir -p $LOGDIR
touch $LOGFILE

# -------------------------------------------------------------------------------------------
if [[ "$@" == "mysqld" && -f $CONFIG ]]; then
    while true; do
        if [ $(ls /var/lib/mysql | wc -l) -gt 0 ]; then 
            /usr/sbin/mysqld; 
        else 
            /usr/sbin/mysqld --initialize; 
        fi 
        CNT=$((CNT+1))
        sleep 10
        [[ $CNT -gt $THRESHOLD ]] && break
    done
    cat <<EOM

--- Caution! ---
The MySQL NDB Cluster Server stopped after 10 attempts or due to wrong arguments.

EOM
fi

# -------------------------------------------------------------------------------------------
if [ "$@" == "kill" ]; then
    kill -9 $(pidof mysqld) && echo "Force exit." && exit -1
fi

# -------------------------------------------------------------------------------------------
if [ "$@" = "debug" ]; then
    cat <<EOM

--- Caution! ---
The MySQL NDB Cluster Data Node has stopped. The pod or container is currently in debug mode.

EOM
fi

# -------------------------------------------------------------------------------------------
cat <<EOM
If you did not use health checks or readiness probes, you may want to investigate the pod or container.
Currently, the runtime is stuck on the command "tail -f /dev/null."

Good luck!
----------------
EOM

tail -f /dev/null # for debug purpose
