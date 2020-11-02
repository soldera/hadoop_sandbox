#!/bin/bash
# A simple script for installing Hadoop.
# Tested in Ubuntu 18.04.5 LTS

set -e

# Install Java JDK 1.8
sudo apt-get update
sudo apt-get -y install openjdk-8-jdk

# Install SSH and PDSH
sudo apt-get -y install ssh
sudo apt-get -y install pdsh

# Test and Setup 
# Password-less access to SSH
# Command for testing:
# $ ssh localhost


# Download, extract and move Hadoop to HADOOP_HOME folder
VERSION=3.3.0
FILE_NAME=hadoop-${VERSION}.tar.gz
HADOOP_HOME=${HOME}/hadoop
mkdir -p ${HADOOP_HOME}
cd ${HADOOP_HOME}
wget https://downloads.apache.org/hadoop/common/hadoop-${VERSION}/${FILE_NAME}
tar xzf ${FILE_NAME}
rm ${FILE_NAME}
mv hadoop-${VERSION}/* .
rm -r hadoop-${VERSION}
