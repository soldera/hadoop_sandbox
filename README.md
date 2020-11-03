# Hadoop Sandbox

## Motivation
This is a Hadoop Ecosystem Sandbox, only for learning purposes. Use it as you like!

## What to expect
- Shell scripts for local HDFS and Yarn installation, setup and inicialization
- Shell scripts for Spark's installation and Master/Slave initialization
- Sample Spark pipeline using Scala with SBT
- Shell scripts for Hive installation, setup and inicialization
- Sample Hive's table and query

The scripts were successfully tested in Ubuntu 18.04.5 LTS

```
Be aware: HDFS will be installed in your /tmp folder. If you want persistent storage, please change the `.xml` configuration files created by the /hadoop/setup.sh script.

Hadoop, Hive and Spark will be installed in your HOME directory.
- ${HOME}/hadoop
- ${HOME}/hive 
- ${HOME}/spark
```

## Versions
- Hadoop: 3.3.0
- Spark: 3.0.1
- Hive: 3.1.2


## Hadoop installation, setup and initialization

1. Run `./hadoop/install.sh`. This will install needed OS dependencies like Java JDK, SSH, PDSH and will download and extract hadoop.
2. Make sure you can access `ssh localhost` without a password. [Check this](https://stackoverflow.com/questions/7439563/how-to-ssh-to-localhost-without-password)
3. Run `./hadoop/setup.sh`. This will create the configuration files in the hadoop's `etc` folder (core-site.xml, hdfs-site.xml, mapred-site.xml and yarn-site.xml) and it will format the HDFS.
4. Run `./hadoop/start.sh`. This will start Hadoop's Namenode and Datanode, YARN and it'll create a hadoop directory with your username `/user/${USER}`
5. Run `./hadoop/upload_demo_dataset.sh`. This will download a small sample dataset and it'll upload it to HDFS, allowing Spark and Hive demonstration.


## Spark installation, setup and initialization

1. Run `./spark/install.sh`. This will download and extract Spark.
2. Run `./spark/start.sh`. This will set Spark Master and (1) Slave up and running.

## Spark demonstration project in Scala

1. Make sure you have initializated spark (check out http://localhost:8080/)
2. Make sure you have Java JDK and SBT installed.
3. Run `./spark/submit_to_spark.sh`. The scala project will build, package and it'll be sent to Spark.

## Hive installation, setup and inicialization

1. Run `./hive/install.sh`. Hive will be downloaded and extracted.
2. Run `./hive/setup.sh`. This will create the needed Hive folders in HDFS, it will create a setup file (hive-site.xml) for Hive and will inicialize Hive's metastore
3. Run `./hive/start_server.sh`. This will start Hiveserver2.
4. Run `./hive/copy_demo_dataset.sh` to copy the sample dataset to Hive's HDFS folder.
4.1. Run `./hive/start_cli.sh` if you want to open the Beeline SQL CLI.
4.2. Run `./hive/run_sql_demo.sh` to run the demonstration SQL DDL for table creation and also an example query.


## Next Steps
- Add Unit and Integration tests in the scala project.
- Share bash script code (like JDK exports and such)