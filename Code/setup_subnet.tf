#Setup public subnet

resource "aws_subnet" "tf_public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public_subnet
  availability_zone = element(var.us_az, 0)

  tags = {
    Name = "tf_public_subnet"
  }
}

#Setup private subnet

resource "aws_subnet" "tf_private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private_subnet
  availability_zone = element(var.us_az, 1)

  tags = {
    Name = "tf_private_subnet"
  }
}
