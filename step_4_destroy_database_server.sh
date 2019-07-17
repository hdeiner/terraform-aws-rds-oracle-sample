#!/usr/bin/env bash

cd ./terraform-oracle/

terraform destroy -auto-approve

cd ..

rm ./.IP_ADDRESS
rm ./.DNS_NAME
rm ./liquibase.properties