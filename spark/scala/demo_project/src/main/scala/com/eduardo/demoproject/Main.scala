package com.eduardo.demoproject

import com.eduardo.demoproject.models.PipelineConfig
import org.apache.spark.{SparkConf, SparkContext}

object Main {
  def main(args: Array[String]): Unit = {
    val pipelineConfig: PipelineConfig = PipelineConfig()

    val sparkConf = new SparkConf()
      .setAppName(pipelineConfig.appName)
      .setMaster(pipelineConfig.sparkMasterUrl)

    val sc = new SparkContext(sparkConf)

    val demoPipeline = DemoPipeline(pipelineConfig)

    demoPipeline.build(sc)
    sc.stop()
  }
}
