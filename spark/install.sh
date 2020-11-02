#!/bin/bash
# A simple script for installing Spark
# Tested in Ubuntu 18.04.5 LTS

set -e

# Download, extract and move Spark to SPARK_HOME folder

HADOOP_OR_LATER_VERSION=3.2
SPARK_VERSION=3.0.1
FILE_NAME=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_OR_LATER_VERSION}.tgz
SPARK_HOME=${HOME}/spark
mkdir -p ${SPARK_HOME}
cd ${SPARK_HOME}
wget https://downloads.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_OR_LATER_VERSION}.tgz
tar xzf ${FILE_NAME}
rm ${FILE_NAME}
mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_OR_LATER_VERSION}/* .
rm -r spark-${SPARK_VERSION}-bin-hadoop${HADOOP_OR_LATER_VERSION}
