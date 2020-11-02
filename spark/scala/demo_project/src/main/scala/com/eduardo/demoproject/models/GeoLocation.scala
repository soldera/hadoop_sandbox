package com.eduardo.demoproject.models

case class GeoLocation(
    truckId: String,
    driverId: String,
    event: String,
    latitude: Float,
    longitude: Float,
    city: String,
    state: String,
    velocity: Float,
    eventInd: String,
    idlingInd: String
) {
  def createCsvRow: String =
    s"${truckId},${driverId},${event},${latitude},${longitude},${city},${state},${velocity},${eventInd},${idlingInd}"
}

object GeoLocation {
  val (
    truckIdIndex,
    driverIdIndex,
    eventIndex,
    latitudeIndex,
    longitudeIndex,
    cityIndex,
    stateIndex,
    velocityIndex,
    eventIndIndex,
    idlingIndIndex
  ) = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
}
