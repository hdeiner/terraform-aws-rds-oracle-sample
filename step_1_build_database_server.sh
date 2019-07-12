#!/usr/bin/env bash

cd ./terraform-oracle/

terraform init
terraform apply -auto-approve

cd ..