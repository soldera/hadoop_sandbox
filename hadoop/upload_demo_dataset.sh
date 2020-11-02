# Script for uploading some demo data to HDFS
set -e
export HADOOP_HOME=${HOME}/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Download to TMP
wget -P /tmp/ https://github.com/hortonworks/data-tutorials/raw/master/tutorials/hdp/manage-files-on-hdfs-via-cli-ambari-files-view/assets/drivers-datasets/geolocation.csv

# Upload to DFS
${HADOOP_HOME}/bin/hdfs dfs -mkdir demo
${HADOOP_HOME}/bin/hdfs dfs -put /tmp/geolocation.csv demo

# Remove downloaded from the local FS
rm /tmp/geolocation.csv


