#Route table for public subnet --> will use IGW
resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }

  tags = {
    Name = "Public subnet RT"
  }
}


#Route table for private subnet --> will use NAT Gateway
resource "aws_route_table" "private_subnet_rt" {
  vpc_id = aws_vpc.main.id
  depends_on = [aws_nat_gateway.nat_gateway]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Private subnet RT"
  }
}