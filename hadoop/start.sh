# Script for starting Hadoop

export HADOOP_HOME=${HOME}/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH

export HDFS_NAMENODE_USER=${USER}
export HDFS_DATANODE_USER=${USER}
export HDFS_SECONDARYNAMENODE_USER=${USER}
export YARN_RESOURCEMANAGER_USER=${USER}
export YARN_NODEMANAGER_USER=${USER}

# Start DFS
${HADOOP_HOME}/sbin/start-dfs.sh

# Create initial directories
${HADOOP_HOME}/bin/hdfs dfs -mkdir /user
${HADOOP_HOME}/bin/hdfs dfs -mkdir /user/${USER}

# Start YARN
${HADOOP_HOME}/sbin/start-yarn.sh
