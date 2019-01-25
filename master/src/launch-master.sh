#!/usr/bin/env bash

# This script is a modified version of the launch-spark-cloud.sh script that is part of the Sparkling water
# build. It is almost identical to that script except that it only starts a master node (as opposed to
# starting a master and some number of workers, which is the behaviour of the original script). The reason
# for changing this behaviour is so that we can separate master nodes from worker nodes i.e. run them in
# separate containers rather than all in one container.

export SPARK_PRINT_LAUNCH_COMMAND=1
# If SPARK_MASTER_HOST is defined externally (e.g. by K8s), then use that definition. Otherwise use localhost.
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
