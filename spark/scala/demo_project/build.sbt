name := "demo_project"

version := "1.0"

scalaVersion := "2.12.10"

val sparkCoreVersion    = "3.0.1"
val hadoopClientVersion = "3.3.0"

libraryDependencies ++= Seq(
  "org.apache.spark"  %% "spark-core"   % sparkCoreVersion,
  "org.apache.hadoop" % "hadoop-client" % hadoopClientVersion
)
