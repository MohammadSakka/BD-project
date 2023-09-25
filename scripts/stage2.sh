#!/bin/bash 
hdfs dfs -mkdir -p /FlightsDelay/avsc 
 
hdfs dfs -put /FlightsDelay/avsc/*.avsc /FlightsDelay/avsc 
 
hive -f ../hql/db.hql > ../hql/hive_results.txt 
 
hive -f ../hql/queries.hql 
 
 
mkdir ../output 
 
bash outputs.sh 
 
mkdir ../clean_output