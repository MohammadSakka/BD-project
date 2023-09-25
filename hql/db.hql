DROP DATABASE IF EXISTS FlightsDelay CASCADE;


CREATE DATABASE FlightsDelay;
USE FlightsDelay;

SET mapreduce.map.output.compress = true;
SET mapreduce.map.output.compress.codec = org.apache.hadoop.io.compress.SnappyCodec;



CREATE EXTERNAL TABLE Trip STORED AS AVRO LOCATION '/FlightsDelay/Trip' TBLPROPERTIES ('avro.schema.url'='/FlightsDelay/avsc/Trip.avsc');



CREATE EXTERNAL TABLE Carrier STORED AS AVRO LOCATION '/FlightsDelay/Carrier' TBLPROPERTIES ('avro.schema.url'='/FlightsDelay/avsc/Carrier.avsc');



CREATE EXTERNAL TABLE plane STORED AS AVRO LOCATION '/FlightsDelay/plane' TBLPROPERTIES ('avro.schema.url'='/FlightsDelay/avsc/plane.avsc');


CREATE EXTERNAL TABLE airport STORED AS AVRO LOCATION '/FlightsDelay/airport' TBLPROPERTIES ('avro.schema.url'='/FlightsDelay/avsc/airport.avsc');

SELECT * FROM plane;
SELECT * FROM Carrier;
SELECT * FROM Trip;
SELECT * FROM airport;