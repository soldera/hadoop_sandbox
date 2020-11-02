#!/bin/bash
# Script for starting Beeline

set -e
export HADOOP_HOME=${HOME}/hadoop
export HIVE_HOME=${HOME}/hive
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

export HS2_HOST=localhost
export HS2_PORT=10000

# Beeline inicialization
$HIVE_HOME/bin/beeline -u jdbc:hive2://$HS2_HOST:$HS2_PORT
