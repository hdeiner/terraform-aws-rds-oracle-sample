Demonstrate the Simpliest Possible Way to Generate On-Demand Oracle Enterprise Edition 11g Release 2 Database Servers and Use Them From a Local Client
======================================================================================================================================================

* We will use Terraform to tell AWS RDS to generate the Oracle Database Server in step_1_build_database_server.sh

* We will use SqlPlus to communicate with the database generated in step_1 to add the schema, static data, in step_2_provision_database.sh

* We will use SqlPlus to communicate with the database provisioned in step_2 to do whatever work we want on the database in step_3_use_database.sh

* We will use Terraform to destroy all AWS assets in step_4_destroy_database_server.sh