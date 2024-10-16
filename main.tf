# VPC 
resource "aws_vpc" "lms-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "lms-vpc"
  }
}

# PUBLIC SUBNET
resource "aws_subnet" "lms-pub-sn" {
  vpc_id     = aws_vpc.lms-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "lms-pub-subnet"
  }
}

# PRIVATE SUBNET
resource "aws_subnet" "lms-pvt-sn" {
  vpc_id     = aws_vpc.lms-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "lms-pvt-subnet"
  }
}
