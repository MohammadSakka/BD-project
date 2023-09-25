SET hive.execution.engine=mr;

USE FlightsDelay;


SET hive.enforce.bucketing=true;

CREATE EXTERNAL TABLE Trip_buck(
    id int,
    year timestamp, 
	Month timestamp, 
	DayofMonth decimal(5,2), 
	DayOfWeek decimal(5,2), 
	DepTime decimal(5,2), 
	CRSDepTime decimal(5,2), 
	FlightNum int,
	ActualElapsedTime decimal(5,2),
    total decimal(5,2), 
	CRSElapsedTime   decimal(5,2), 
	AirTime  decimal(5,2), 
	Distance decimal(5,2), 
	TaxiIn decimal(5,2),
    TaxiOut decimal(5,2),
	Cancelled int,
    CancellationCode text,
    Diverted int,
    airportId integer,
    plainId  integer,
    carrierId integer
    
    ) 
    CLUSTERED BY (id) into 3 buckets
    STORED AS AVRO LOCATION '/FlightsDelay/Trip_buck' 
    TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

INSERT INTO Trip_buck SELECT * Trip;
CREATE EXTERNAL TABLE Carrier_buck(
    carrier_code int  ,
    delay decimal(5,2)
) 
    CLUSTERED BY (id) into 3 buckets
    STORED AS AVRO LOCATION '/FlightsDelay/Carrier_buck' 
    TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

INSERT INTO Carrier_buck SELECT * Carrier;

CREATE EXTERNAL TABLE Plane(
    tail_number varchar(255)
) 
    CLUSTERED BY (tail_number) into 3 buckets
    STORED AS AVRO LOCATION '/FlightsDelay/plane_buck' 
    TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

INSERT INTO plane_buck SELECT * FROM plane;

CREATE EXTERNAL TABLE Airport_buck(
    IATA_code varchar(255)
) 
    CLUSTERED BY (IATA_code) into 3 buckets
    STORED AS AVRO LOCATION '/FlightsDelay/Airport_buck' 
    TBLPROPERTIES ('AVRO.COMPRESS'='SNAPPY');

INSERT INTO Airport_buck SELECT * FROM Airport;

SET hive.execution.engine=tez;