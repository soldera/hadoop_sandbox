#!/bin/bash
# Script for starting HiveServer2

set -e
export HADOOP_HOME=${HOME}/hadoop
export HIVE_HOME=${HOME}/hive
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/


# HiveServer2 inicialization
$HIVE_HOME/bin/hive --service hiveserver2 &
