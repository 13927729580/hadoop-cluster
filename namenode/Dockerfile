# NameNode for hadoop cluster
#
# FAQ:
#  - I want to build image
#       docker build --build-arg CLUSTER_NAME=HADOOP_CLUSTER -t hadoop-name-node .
#
#  - I want to run image
#       docker run -it hadoop-namenode

FROM hadoop-base

ARG CLUSTER_NAME=HADOOP_CLUSTER
ARG NAMENODE_PORT=9870
ARG NAMENODE_FS_PORT=9000

HEALTHCHECK CMD curl -f http://hadoop-namenode:$NAMENODE_PORT/ || exit 1

EXPOSE $NAMENODE_PORT $NAMENODE_FS_PORT
RUN $HADOOP_HOME/bin/hdfs namenode -format $CLUSTER_NAME 2>&1
CMD $HADOOP_HOME/bin/hdfs namenode
