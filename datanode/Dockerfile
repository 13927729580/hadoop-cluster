# NameNode for hadoop cluster
#
# FAQ:
#  - I want to build image
#       docker build --build-arg CLUSTER_NAME=HADOOP_CLUSTER -t hadoop-name-node .
#
#  - I want to run image
#       docker run -it hadoop-namenode

FROM hadoop-base

ARG DATANODE_HTTP_PORT=9864
ARG DATANODE_TRANSFER_PORT=9866
ARG DATANODE_IPC_PORT=9867
ARG DATANODE_HTTPS_PORT=9865

HEALTHCHECK CMD curl -f http://localhost:$DATANODE_HTTP_PORT/ || exit 1

EXPOSE $DATANODE_HTTP_PORT $DATANODE_TRANSFER_PORT $DATANODE_IPC_PORT $DATANODE_HTTPS_PORT

CMD sleep 5 && $HADOOP_HOME/bin/hdfs datanode
