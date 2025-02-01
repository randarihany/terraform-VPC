resource "aws_instance" "ec2" {
  ami           = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tf_public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  associate_public_ip_address = true
 tags = {
    Name = "public EC2 "
  }
  
 }
 
 
# EC2 Instance in Private Subnet with Apache Installation
resource "aws_instance" "ec2_private" {
  ami           = "ami-0c614dee691cbbf37"  # Choose the correct AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tf_private_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_private.id]
  associate_public_ip_address = true

  # User data script to install Apache on the private EC2 instance
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "Apache is running on the private EC2 instance" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Private EC2"
  }
}