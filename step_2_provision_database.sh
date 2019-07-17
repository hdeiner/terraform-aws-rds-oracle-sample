#!/usr/bin/env bash


echo 'classpath=lib/ojdbc-12.2.0.1.jar' > liquibase.properties
echo 'driver=oracle.jdbc.driver.OracleDriver' >> liquibase.properties
echo 'url=jdbc:oracle:thin:@'$echo`cat ./.DNS_NAME`':1521:SAMPLEDB' >> liquibase.properties
echo 'username=oracleuser' >> liquibase.properties
echo 'password=password' >> liquibase.properties

liquibase --changeLogFile=src/main/db/IMDB-schema.xml update

mvn -q clean compile package

java -cp target/terraform-aws-rds-oracle-sample-1.0.jar com.deinersoft.PopulateDatabase

