#!/usr/bin/env bash

export SPARK_PRINT_LAUNCH_COMMAND=1
export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-"localhost"}
export SPARK_MASTER_PORT="7077"
export SPARK_WORKER_PORT="7087"
export SPARK_WORKER_INSTANCES=${1:-3}
export MASTER="spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT"

if [ ! -d "$SPARK_HOME" ]; then
  echo "Please setup SPARK_HOME variable to your Spark installation!"
  exit -1
fi

# Configure tmp dir
tmpdir=${TMPDIR:-"/tmp/"}
export SPARK_LOG_DIR="${tmpdir}spark/logs"
export SPARK_LOCAL_DIRS="${tmpdir}spark/work"

cat <<EOF
Starting Spark cluster ... 1 master
 * Log dir is located in $SPARK_LOG_DIR"
EOF

echo "Starting master on $SPARK_MASTER_HOST..."
"$SPARK_HOME"/sbin/start-master.sh
