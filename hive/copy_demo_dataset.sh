# Script for uploading some demo data to HDFS
set -e
export HADOOP_HOME=${HOME}/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/


${HADOOP_HOME}/bin/hdfs dfs -cp /user/${USER}/demo/geolocation.csv /user/hive/warehouse/geolocation.csv



