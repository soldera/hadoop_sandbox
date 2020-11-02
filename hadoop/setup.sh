#!/bin/bash
# Script for setting up Hadoop in a Pseudo-Distributed Mode

set -e
HADOOP_HOME=${HOME}/hadoop

# Create Hadoop Config Files

cat > ${HADOOP_HOME}/etc/hadoop/core-site.xml << EOF
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
EOF

cat > ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml << EOF
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOF

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Format HDFS
${HADOOP_HOME}/bin/hdfs namenode -format

# Adds env-vars exports to hadoop-env file
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh
echo "export PDSH_RCMD_TYPE=ssh" >> ${HADOOP_HOME}/etc/hadoop/hadoop-env.sh
