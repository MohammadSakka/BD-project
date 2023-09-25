SET hive.execution.engine=mr;

USE FlightsDelay;



SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;

-- CREATE EXTERNAL TABLE trip_part(id int, name varchar(255), abv decimal(5,2),  style varchar(50))
-- PARTITIONED BY (tripId int) STORED AS AVRO LOCATION '/FlightsDelay/trip_part' TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

-- INSERT INTO trip_part partition (tripId) SELECT * FROM trip;

-- CREATE EXTERNAL TABLE airport_part(brewery_name varchar(255))
-- PARTITIONED BY (id int) STORED AS AVRO LOCATION '/FlightsDelay/airport_part' TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

-- INSERT INTO airport_part partition (deptno) SELECT * FROM airport;

-- CREATE EXTERNAL TABLE plane_part(ProfileName varchar(255))
-- PARTITIONED BY (id int) STORED AS AVRO LOCATION '/FlightsDelay/plane_part' TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

-- INSERT INTO plane_part partition (deptno) SELECT * FROM plane;

-- CREATE EXTERNAL TABLE carrier_part(id int, appearance decimal(2,2), aroma decimal(2,2), palate decimal(2,2), taste decimal(2,2), timestamp date, total decimal(2,2), beerId int)
-- PARTITIONED BY (carrierId int) STORED AS AVRO LOCATION '/FlightsDelay/carrier_part' TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

-- INSERT INTO carrier_part partition (carrierId) SELECT * FROM carrier;

SET hive.execution.engine=tez;