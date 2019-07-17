output "oracle_endpoint" {
  value = ["${aws_db_instance.oracle.endpoint}"]
}

output "oracle_address" {
  value = ["${aws_db_instance.oracle.address}"]
}

output "oracle_port" {
  value = ["${aws_db_instance.oracle.port}"]
}

output "oracle_name" {
  value = ["${aws_db_instance.oracle.name}"]
}