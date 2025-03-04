#Creation of VPC
resource "aws_vpc" "vpc-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc terraform"
  }
}

#Creation of INTERNET GATEWAY
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "Internet-gateway terraform"
  }
}

#Creation of SUBNET
resource "aws_subnet" "subnet-main" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet terraform"
  }
}

#Creation of ROUTE TABLE
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "route-table terraform"
  }
}

#Creation of ROUTE TABLE ASSICIATION WITH SUBNET
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-main.id
  route_table_id = aws_route_table.route-table.id
}

#Creation of SECURITY GROUP PORT 22 SSH
resource "aws_security_group" "security-group" {
  name        = "security-group-terraform"
  description = "Allow SSH in port 22"
  vpc_id      = aws_vpc.vpc-main.id

  ingress {
    description = "SSH security group terraform"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group terraform"
  }
}