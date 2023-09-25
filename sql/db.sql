Drop Database if exists FlightDelay; 
create database FlightsDelay; 
\c FlightDelay; 
 
START TRANSACTION;  
 
CREATE TABLE Airport(  
    IATA_code varchar(255) NOT NULL  PRIMARY KEY 
);  
  
CREATE TABLE Plane(  
    tail_number varchar(255) NOT NULL  PRIMARY KEY 
);  
  
CREATE TABLE Carrier(   
    carrier_code varchar(255) NOT NULL  PRIMARY KEY  ,
    delay decimal
   
);  
  


Create TABLE Trip(    
    id serial not null primary KEY, 
    year text,
    Month decimal,
    DayofMonth decimal,
    DayOfWeek  decimal,
    DepTime decimal,
    CRSDepTime decimal,
    FlightNum integer not null,
    ActualElapsedTime decimal,
    CRSElapsedTime   decimal,
    AirTime  decimal,
    Distance decimal,
    TaxiIn decimal,
    TaxiOut decimal,
    Cancelled BOOLEAN,
    CancellationCode text,
    Diverted BOOLEAN,
    airportId integer,
    plainId  integer,
    carrierId integer,
    
);  
  
ALTER TABLE Trip ADD CONSTRAINT fk_airport_id FOREIGN KEY(airportId) REFERENCES Airport(IATA_code);  
  
ALTER TABLE Trip ADD CONSTRAINT fk_plane_id FOREIGN KEY(plainId) REFERENCES Plane(tail_number);  
  
ALTER TABLE Trip ADD CONSTRAINT fk_carrier_Id FOREIGN KEY(carrierId) REFERENCES Carrier(carrier_code);  
  
  
CREATE TEMP TABLE temp( 
    Year text, 
    Month int,
    DayofMonth int,
    DayOfWeek int,
    DepTime decimal,
    CRSDepTime decimal,
    ArrTime decimal,
    UniqueCarrier_code text,
    FlightNum  int,
    TailNum int,
    ActualElapsedTime decimal,
    CRSElapsedTime decimal,
    AirTime decimal,
    ArrDelay decimal,
    DepDelay decimal,
    Origin_code text,
    Dest_code text,
    Distance decimal,
    TaxiIn decimal,
    TaxiOut decimal,
    Cancelled BOOLEAN,
    CancellationCode text,
    Diverted BOOLEAN,
    CarrierDelay decimal,
    WeatherDelay decimal,
    NASDelay decimal,
    SecurityDelay decimal,
    LateAircraftDelay decimal
    
); 
 
\COPY temp FROM '/HDFS/data/DelayedFlights.csv' DELIMITER ',' CSV HEADER NULL AS 'null'; 
 

INSERT INTO Airport (IATA_code) 
SELECT DISTINCT IATA_code 
FROM temp; 
 
INSERT INTO Plane (tail_number) 
SELECT DISTINCT  tail_number 
FROM temp; 
 
INSERT INTO Carrier (carrier_code,delay)
SELECT DISTINCT carrier_code,delay
FROM temp; 


INSERT INTO Trip (year, Month,
    DayofMonth
    DayOfWeek,
    DepTime,
    CRSDepTime,
    FlightNum,
    ActualElapsedTime,
    CRSElapsedTime,
    AirTime,
    Distance ,
    TaxiIn ,
    TaxiOut ,
    Cancelled ,
    CancellationCode,
    Diverted ,
    airportId ,
    plainId ,
    carrierId  ) 
SELECT DISTINCT year, Month,
    DayofMonth
    DayOfWeek,
    DepTime,
    CRSDepTime,
    FlightNum,
    ActualElapsedTime,
    CRSElapsedTime,
    AirTime,
    Distance ,
    TaxiIn ,
    TaxiOut ,
    Cancelled ,
    CancellationCode,
    Diverted ,
    airportId ,
    plainId ,
    carrierId  
FROM temp;

DROP TABLE temp; 
 
Commit; 
 
SELECT * FROM Airport; 
SELECT * FROM Plane; 
SELECT * FROM Carrier; 
SELECT * FROM Trip;