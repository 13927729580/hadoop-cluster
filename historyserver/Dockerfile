FROM hadoop-base

ARG HISTORY_MANAGER_PORT=8188

HEALTHCHECK CMD curl -f http://localhost:$HISTORY_MANAGER_PORT/ || exit 103
EXPOSE $HISTORY_MANAGER_PORT
CMD $HADOOP_HOME/bin/mapred historyserver 2>&1; sleep infinity
