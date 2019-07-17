resource "aws_security_group" "oracle" {
  name = "terraform-aws-rds-oracle-sample"
  description = "terraform-aws-rds-oracle-sample Oracle Access"
  ingress {
    protocol = "tcp"
    from_port = 1521
    to_port = 1521
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}