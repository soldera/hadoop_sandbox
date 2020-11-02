#!/bin/bash
# A simple script for starting Spark Standalone
export SPARK_HOME=${HOME}/spark
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

${SPARK_HOME}/sbin/start-master.sh -h localhost

# Start one Spark Worker
${SPARK_HOME}/sbin/start-slave.sh spark://localhost:7077

