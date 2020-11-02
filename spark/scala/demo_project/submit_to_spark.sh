#!/bin/bash
# A Simple script to package and submit the Scala JAR to Spark

set -e
sbt package

export SPARK_HOME=${HOME}/spark

${SPARK_HOME}/bin/spark-submit \
--class "com.eduardo.demoproject.Main" \
--master local[4] \
target/scala-2.12/demo_project_2.12-1.0.jar
