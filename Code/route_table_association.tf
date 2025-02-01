#Attaching subnets to certain tables
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.tf_public_subnet.id
  route_table_id = aws_route_table.public_subnet_rt.id
  depends_on = [ aws_subnet.tf_public_subnet,aws_route_table.public_subnet_rt]
}


resource "aws_route_table_association" "private_subnet_association" {
  subnet_id = aws_subnet.tf_private_subnet.id
  route_table_id = aws_route_table.private_subnet_rt.id
  depends_on = [ aws_subnet.tf_private_subnet,aws_route_table.private_subnet_rt]
}

