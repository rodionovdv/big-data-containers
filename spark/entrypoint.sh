#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_HOME/jre/lib/amd64/server/

# start spark and mesodocker rmi -f s
supervisord -n -c /usr/local/supervisor/supervisord.conf
