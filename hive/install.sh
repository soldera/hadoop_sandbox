#!/bin/bash
# A simple script for installing Hive
# Tested in Ubuntu 18.04.5 LTS

set -e

# Download, extract and move Hive to HIVE_HOME folder

HIVE_VERSION=3.1.2
FILE_PREFIX=apache-hive-${HIVE_VERSION}-bin
FILE_NAME=${FILE_PREFIX}.tar.gz
HIVE_HOME=${HOME}/hive
mkdir -p ${HIVE_HOME}
cd ${HIVE_HOME}
wget https://downloads.apache.org/hive/hive-${HIVE_VERSION}/${FILE_NAME}
tar xzf ${FILE_NAME}
rm ${FILE_NAME}
mv ${FILE_PREFIX}/* .
rm -r ${FILE_PREFIX}
