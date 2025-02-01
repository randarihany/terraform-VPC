#Create AWS VPC in us-east-1
#CIDR = 10.0.0.0/16

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "main"
  }
}