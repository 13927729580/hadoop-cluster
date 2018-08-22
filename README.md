# Hadoop Cluster

We created small [hadoop][hadoop] cluster for tests.

## Architecture of a Hadoop Cluster

Before we start, we have to understand different components of [hadoop][hadoop] cluster.

Basically we have two main components:

- [HDFS][HDFS]
- [YARN][YARN]

## HDFS

[HDFS][HDFS] is a distributed file system designed to run on commodity hardware and has master/slave architecture.

**NameNode** is a single node that manages the file system namespace and regulates access to files by clients.
There are also many **DataNodes** which manage storage attached to the nodes that they run on.

## YARN

[YARN][YARN] - splits up the functionalities of resource management and job scheduling/monitoring into separate daemons.

**ResourceManager** is the ultimate authority that arbitrates resources among all the applications in the system.

**NodeManager** is the per-machine framework agent who is responsible for containers,
monitoring their resource usage (cpu, memory, disk, network) and reporting the same to the ResourceManager/Scheduler.


[hadoop]: http://hadoop.apache.org/
[HDFS]: http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html
[YARN]: http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html
