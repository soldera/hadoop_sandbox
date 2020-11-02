#!/bin/bash
# A simple script for installing Spark
# Tested in Ubuntu 18.04.5 LTS

set -e

# Download, extract and move Spark to SPARK_HOME folder

HADOOP_OR_LATER_VERSION=3.2
SPARK_VERSION=3.0.1
FILE_PREFIX=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_OR_LATER_VERSION}
FILE_NAME=${FILE_PREFIX}.tgz
SPARK_HOME=${HOME}/spark
mkdir -p ${SPARK_HOME}
cd ${SPARK_HOME}
wget https://downloads.apache.org/spark/spark-${SPARK_VERSION}/${FILE_NAME}
tar xzf ${FILE_NAME}
rm ${FILE_NAME}
mv ${FILE_PREFIX}/* .
rm -r ${FILE_PREFIX}
