#!/bin/bash 
psql -U postgres -f ../sql/db.sql 
 
wget https://jdbc.postgresql.org/download/postgresql-42.6.0.jar --no-check-certificate 
 
cp  postgresql-42.6.0.jar /usr/hdp/current/sqoop-client/lib/ 
 
mkdir ../flightsDelay 
 
sqoop import-all-tables \ 
    -Dmapreduce.job.user.classpath.first=true \ 
    --connect jdbc:postgresql://localhost/FlightsDelay \ 
    --username postgres \ 
    --warehouse-dir /FlightsDelay \ 
    --as-avrodatafile \ 
    --compression-codec=snappy \ 
    --outdir /FlightsDelay/avsc \ 
    --m 1