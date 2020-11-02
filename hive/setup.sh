#!/bin/bash
# Script for setting up Hive

export HADOOP_HOME=${HOME}/hadoop
export HIVE_HOME=${HOME}/hive
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Create required folders in HDFS for Hive
$HADOOP_HOME/bin/hdfs dfs -mkdir       /tmp
$HADOOP_HOME/bin/hdfs dfs -mkdir       /user/hive/
$HADOOP_HOME/bin/hdfs dfs -mkdir       /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w   /tmp
$HADOOP_HOME/bin/hdfs dfs -chmod g+w   /user/hive/warehouse

# Resolve lib conflict
rm $HIVE_HOME/lib/guava-19.0.jar
cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/guava-27.0-jre.jar

# set property to resolve login problem in beeline and sets the bytes/reducer property
cat > ${HIVE_HOME}/conf/hive-site.xml << EOF
<configuration>
    <property>
        <name>hive.server2.enable.doAs</name>
        <value>false</value>
    </property>
    <property>
        <name>hive.exec.reducers.bytes.per.reducer</name>
        <value>67108864</value>
    </property>
</configuration>
EOF

# Hive inicialization step
$HIVE_HOME/bin/schematool -dbType derby -initSchema