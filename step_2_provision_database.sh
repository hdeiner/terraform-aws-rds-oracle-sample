#!/usr/bin/env bash

liquibase --changeLogFile=src/main/db/IMDB-schema.xml update

mvn -q clean compile package

java -cp target/terraform-aws-rds-oracle-sample-1.0.jar com.deinersoft.PopulateDatabase

