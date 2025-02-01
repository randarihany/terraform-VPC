#Elastic ip
#without elastic ip can not create nat gateway

resource "aws_eip" "nat_eip" {
  vpc = true
}


# Create the NAT Gateway in the Public Subnet

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.tf_public_subnet.id

  tags = {
    Name = "NAT-Gateway"
  }

  depends_on = [aws_eip.nat_eip]
}