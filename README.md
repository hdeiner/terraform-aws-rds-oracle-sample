Demonstrate the Simpliest Possible Way to Generate On-Demand Oracle Enterprise Edition 11g Release 2 Database Servers and Use Them From a Local Client
======================================================================================================================================================

* We will use Terraform to tell AWS RDS to generate the Oracle Database Server in step_1_build_database_server.sh

* We will use SqlPlus to communicate with the database generated in step_1 to add the schema, static data, in step_2_provision_database.sh

* We will use SqlPlus to communicate with the database provisioned in step_2 to do whatever work we want on the database in step_3_use_database.sh

* We will use Terraform to destroy all AWS assets in step_4_destroy_database_server.sh


NOTE:
=====

There seems to be a problem with Terraform whereby the public ip associated with the RDS instance can not be reported back as an output variable.

As a workaround for now, issue the following AWS CLI command:

```bash
aws ec2 describe-network-interfaces
```

You will be presented with JSON to the console that has our answer burried in it:

```console
{
    "NetworkInterfaces": [
        {
            "Description": "RDSNetworkInterface",
            "NetworkInterfaceId": "eni-09f6c921aee86a7c8",
            "SourceDestCheck": true,
            "PrivateDnsName": "ip-172-31-19-117.ec2.internal",
            "OwnerId": "178844964995",
            "PrivateIpAddress": "172.31.19.117",
            "VpcId": "vpc-ca8295ad",
            "Attachment": {
                "DeleteOnTermination": false,
                "AttachmentId": "eni-attach-0819ac0c5c0d23bea",
                "AttachTime": "2019-07-12T11:33:17.000Z",
                "Status": "attached",
                "InstanceOwnerId": "amazon-rds",
                "DeviceIndex": 1
            },
            "InterfaceType": "interface",
            "TagSet": [],
            "Ipv6Addresses": [],
            "SubnetId": "subnet-feb06da5",
            "Status": "in-use",
            "MacAddress": "0e:42:07:66:8a:34",
            "Groups": [
                {
                    "GroupName": "terraform-aws-rds-oracle-sample",
                    "GroupId": "sg-048e836de266136bd"
                }
            ],
            "AvailabilityZone": "us-east-1b",
            "RequesterId": "amazon-rds",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "172.31.19.117",
                    "Association": {
                        "IpOwnerId": "amazon-rds",
                        "PublicIp": "34.231.30.61",
                        "PublicDnsName": "ec2-34-231-30-61.compute-1.amazonaws.com"
                    },
                    "PrivateDnsName": "ip-172-31-19-117.ec2.internal"
                }
            ],
            "RequesterManaged": true,
            "Association": {
                "IpOwnerId": "amazon-rds",
                "PublicIp": "34.231.30.61",
                "PublicDnsName": "ec2-34-231-30-61.compute-1.amazonaws.com"
            }
        }
    ]
}
```

Find the lines near the bottom that speak to the PublicIp and PublicDnsName.  Use that information to update the URL line in the liquibase.properties file after the step_1_build_database_server.sh has been executed and before step_2_provision_database.sh has been executed.  You will also have to update step_3_use_database.sh with that value as well.