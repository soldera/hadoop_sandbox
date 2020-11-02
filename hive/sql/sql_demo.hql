CREATE EXTERNAL TABLE IF NOT EXISTS geolocation(
        TruckId STRING,
        DriverId STRING,
        Event STRING,
        Latitude FLOAT,
        Longitude FLOAT,
        City STRING,
        State STRING,
        Velocity FLOAT,
        EventInd STRING,
        IdlingInd STRING )
    COMMENT 'Geolocation data from demonstration dataset'
    ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    LOCATION '/user/hive/warehouse/'
    TBLPROPERTIES('skip.header.line.count'='1');

SELECT 
    t.City,
    t.CityCount
FROM (
    SELECT City, COUNT(1) CityCount FROM geolocation GROUP BY City
) as t 
WHERE t.CityCount>500;