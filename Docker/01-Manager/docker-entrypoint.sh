#!/usr/bin/env bash

CURRENT_DIR=$(pwd)
CONFIG=$CURRENT_DIR/config.ini
PATH=$CURRENT_DIR:$PATH
THRESHOLD=9
CNT=0

if [[ $1 == "ndb_mgmd" && -f $CONFIG ]]; then
    while true; do
        /usr/sbin/$1 \
            --configdir=$(pwd) \
            --config-file=$CONFIG \
            --nodaemon \
            --reload
        CNT=$((CNT+1))
        sleep 10
        [[ $CNT -gt $THRESHOLD ]] && break
    done
fi

cat <<EOM

--- Caution! ---
The MySQL NDB Cluster Manager stopped after 10 attempts or due to wrong arguments.

If you did not use health checks or readiness probes, you may want to investigate the pod or container.
Currently, the runtime is stuck on the command "tail -f /dev/null."

Good luck!
----------------
EOM

tail -f /dev/null # for debug purpose
