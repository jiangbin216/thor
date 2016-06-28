#!/bin/sh

base_dir=$(dirname $0)

if [ "x$THOR_LOG4J_OPTS" = "x" ]; then
    export THOR_LOG4J_OPTS="-Dlog4j.configurationFile=file:$base_dir/../config/log4j2.xml"
fi

if [ "x$THOR_HEAP_OPTS" = "x" ]; then
    export THOR_HEAP_OPTS="-Xmx1G -Xms1G"
fi

EXTRA_ARGS="-name thor -loggc"

exec $(dirname $0)/run-class.sh $EXTRA_ARGS org.apache.kafka.connect.cli.ConnectStandalone "$@"
