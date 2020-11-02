package com.eduardo.demoproject

import java.time.Instant

import com.eduardo.demoproject.models.{GeoLocation, PipelineConfig}
import org.apache.spark.SparkContext

case class DemoPipeline(pipelineConfig: PipelineConfig) {

  val GeoLocationsFullPath: String =
    s"${pipelineConfig.hdfsUrl}/user/${pipelineConfig.userName}/" +
      s"${pipelineConfig.demoFolderPath}/${pipelineConfig.geolocationFileName}"
  val GeoLocationHeader: String = "truckid,driverid,event,latitude,longitude,city,state,velocity,event_ind,idling_ind"
  val GeoLocationAggDir: String = s"${pipelineConfig.hdfsUrl}/user/${pipelineConfig.userName}/" +
    s"${pipelineConfig.demoFolderPath}/geolocation_agg"
  val GeoLocationFilteredDir: String = s"${pipelineConfig.hdfsUrl}/user/${pipelineConfig.userName}/" +
    s"${pipelineConfig.demoFolderPath}/geolocation_filtered"

  def build(sc: SparkContext): Unit = {
    val jobStartTimestamp = Instant.now().getEpochSecond.toString
    val geolocationsRdd = sc
      .textFile(GeoLocationsFullPath)
      .filter(_ != GeoLocationHeader)
      .map(DemoPipeline.createGeoLocationFromCsv)

    val cityCountRdd = geolocationsRdd
      .map(DemoPipeline.mapToCities)
      .groupByKey()
      .map(DemoPipeline.countCities)

    // Save City Count
    cityCountRdd
      .map(DemoPipeline.toOutputCsvRow)
      .saveAsTextFile(GeoLocationAggDir + "-" + jobStartTimestamp)

    // Save GeoLocation row only if number of time that this city appears > CityCountThreshold
    geolocationsRdd
      .map(DemoPipeline.pairWithCityKey)
      .join(cityCountRdd)
      .filter(DemoPipeline.filterByCityCount)
      .map(DemoPipeline.createCsvRow)
      .saveAsTextFile(GeoLocationFilteredDir + "-" + jobStartTimestamp)
  }
}

object DemoPipeline {

  def createGeoLocationFromCsv(row: String): GeoLocation = {
    val splittedRow = row.split(",")
    GeoLocation(
      truckId = splittedRow(GeoLocation.truckIdIndex),
      driverId = splittedRow(GeoLocation.driverIdIndex),
      event = splittedRow(GeoLocation.eventIndex),
      latitude = splittedRow(GeoLocation.latitudeIndex).toFloat,
      longitude = splittedRow(GeoLocation.longitudeIndex).toFloat,
      city = splittedRow(GeoLocation.cityIndex),
      state = splittedRow(GeoLocation.stateIndex),
      velocity = splittedRow(GeoLocation.velocityIndex).toFloat,
      eventInd = splittedRow(GeoLocation.eventIndIndex),
      idlingInd = splittedRow(GeoLocation.idlingIndIndex)
    )
  }

  def mapToCities(geoLocation: GeoLocation): (String, Int) = (geoLocation.city, 1)

  def pairWithCityKey(geoLocation: GeoLocation): (String, GeoLocation) = (geoLocation.city, geoLocation)

  def countCities(pair: (String, Iterable[Int])): (String, Int) = (pair._1, pair._2.sum)

  def toOutputCsvRow(pair: (String, Int)): String = s"${pair._1},${pair._2}"

  val CityCountThreshold: Int                                        = 500
  def filterByCityCount(pair: (String, (GeoLocation, Int))): Boolean = pair._2._2 > CityCountThreshold

  def createCsvRow(pair: (String, (GeoLocation, Int))): String = pair._2._1.createCsvRow
}
