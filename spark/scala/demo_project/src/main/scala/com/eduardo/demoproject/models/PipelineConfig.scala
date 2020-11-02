package com.eduardo.demoproject.models

case class PipelineConfig(
    hdfsUrl: String,
    sparkMasterUrl: String,
    userName: String,
    demoFolderPath: String,
    geolocationFileName: String,
    appName: String
)

object PipelineConfig {
  def apply(): PipelineConfig = PipelineConfig(
    hdfsUrl = sys.env.getOrElse("HADOOP_HDFS_URL", "hdfs://localhost:9000"),
    sparkMasterUrl = sys.env.getOrElse("SPARK_MASTER_URL", "spark://localhost:7077"),
    userName = sys.env.getOrElse("USER", throw new IllegalArgumentException),
    demoFolderPath = sys.env.getOrElse("DEMO_FOLDER_PATH", "demo"),
    geolocationFileName = sys.env.getOrElse("GEOLOCATION_FILENAME", "geolocation.csv"),
    appName = sys.env.getOrElse("SPARK_APP_NAME", "demoproject")
  )
}
