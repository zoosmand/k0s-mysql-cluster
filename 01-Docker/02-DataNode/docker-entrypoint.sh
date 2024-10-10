#!/usr/bin/env bash

CURRENT_DIR=$(pwd)
CONFIG=/etc/my.cnf
PATH=$CURRENT_DIR:$PATH
THRESHOLD=9
CNT=0

# -------------------------------------------------------------------------------------------
if [[ "$@" == "ndbd" && -f $CONFIG ]]; then
    while true; do
        /usr/sbin/$1 \
            --foreground \
            --nodaemon
        CNT=$((CNT+1))
        sleep 10
        [[ $CNT -gt $THRESHOLD ]] && break
    done
    cat <<EOM

--- Caution! ---
The MySQL NDB Cluster Data Node has stopped after 10 attempts or due to wrong arguments.

EOM
fi

# -------------------------------------------------------------------------------------------
if [ "$@" = "kill" ]; then
    kill -9 $(pidof ndbd) && echo "Force exit." && exit -1
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
