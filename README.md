# Hadoop Cluster

We created small [hadoop][hadoop] cluster for tests.

## Architecture of a Hadoop Cluster

Before we start, we have to understand different components of [hadoop][hadoop] cluster.

Basically we have two main components:

- [HDFS][HDFS]
- [YARN][YARN]

### HDFS

[HDFS][HDFS] is a distributed file system designed to run on commodity hardware and has master/slave architecture.

**NameNode** is a single node that manages the file system namespace and regulates access to files by clients.
There are also many **DataNodes** which manage storage attached to the nodes that they run on.

### YARN

[YARN][YARN] - splits up the functionalities of resource management and job scheduling/monitoring into separate daemons.

**ResourceManager** is the ultimate authority that arbitrates resources among all the applications in the system.

**NodeManager** is the per-machine framework agent who is responsible for containers,
monitoring their resource usage (cpu, memory, disk, network) and reporting the same to the ResourceManager/Scheduler.


## Docker images

We built many small images for hadoop_ cluster.

- *base/Dockerfile* - image has installed [hadoop][hadoop] binaries and is also base image for other images
- *namenode/Dockerfile* - hdfs master node
- *datanode/Dockerfile* - hdfs slave node(s)
- *resourcemanager/Dockerfile* - yarn resource manager node
- *nodemanager/Dockerfile* - yarn node manager node
- *historyserver/Dockerfile* - job history server

## Quick start

### Start hadoop cluster

If you want to start [hadoop][hadoop] cluster, run following command:

```
    docker-compose up

```

You can check if containers work and expose web ui pages:

1. For HDFS:

- [dfs namenode web ui](http://localhost:9870)
- [datanode 1](http://localhost:9801)
- [datanode 2](http://localhost:9802)
- [datanode 3](http://localhost:9803)
- [datanode 4](http://localhost:9804)

Please notice, we had to remap default datanode port *9864* to *9801*, *9802*, *9803* and *9804*
for data node instances.

2. For YARN:

- [node manager](http://localhost:8042/node)
- [resource manager](http://localhost:8088)


### Stop hadoop cluster

If you want to stop [hadoop][hadoop] cluster, run following command:


```

    docker-compose down

```

__IMPORTANT__ If you break down running containers by *CTRL+C*,
by killing processes, etc. next start you can have problems with starting
hadoop cluster:

```

    Attaching to hadoop-base, hadoop-namenode, hadoop-datanode4,
    hadoop-datanode1, hadoop-datanode3, hadoop-datanode2,
    hadoop-historyserver, hadoop-nodemanager, hadoop-resourcemanager
    ...
    hadoop-namenode           | namenode is running as process 1.  Stop it first.
    hadoop-datanode4          | datanode is running as process 1.  Stop it first.
    hadoop-datanode1          | datanode is running as process 1.  Stop it first.
    hadoop-datanode3          | datanode is running as process 1.  Stop it first.
    hadoop-datanode2          | datanode is running as process 1.  Stop it first.
    hadoop-historyserver      | historyserver is running as process 6.  Stop it first.
    hadoop-nodemanager        | nodemanager is running as process 1.  Stop it first.
    hadoop-base exited with code 0
    hadoop-namenode exited with code 1
    hadoop-datanode4 exited with code 1
    hadoop-datanode2 exited with code 1
    hadoop-nodemanager exited with code 1
    hadoop-datanode3 exited with code 1
    ...

```

To fix it, you have to run `docker-compose down`. If this does not help, try:

```

    docker-compose build --no-cache
    docker-compose up

```

### Examples

TODO





[hadoop]: http://hadoop.apache.org/
[HDFS]: http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html
[YARN]: http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html
