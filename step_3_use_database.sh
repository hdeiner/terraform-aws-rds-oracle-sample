#!/usr/bin/env bash

sqlplus oracleuser/password@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/a-query.sql