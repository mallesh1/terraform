provider "aws"{
	region="us-east-1"
 }

resource "aws_vpc" "vp" {
  cidr_block = "10.0.0.0/24"
tags = {
    Name = "vp"
  }
}

resource "aws_subnet" "sn1" {
  vpc_id     = aws_vpc.vp.id
  cidr_block = "10.0.0.0/25"
availability_zone = "ap-southeast-1a"
 map_public_ip_on_launch = true
 tags = {
    Name = "sn1-pub"
  }
}
resource "aws_subnet" "sn2" {
  vpc_id     = aws_vpc.vp.id
  cidr_block = "10.0.0.128/25"
availability_zone = "ap-southeast-1b"
 map_public_ip_on_launch = true
 tags = {
    Name = "sn2-pub"
  }
}
resource "aws_internet_gateway" "igw-12" {
  vpc_id = aws_vpc.vp.id

  tags = {
    Name = "igw-12"
  }
}
resource "aws_route_table" "routpub" {
  vpc_id = aws_vpc.vp.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-12.id
  }
  tags = {
    Name = "routpub"
  }
 }
 resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sn1.id
  route_table_id = aws_route_table.routpub.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sn2.id
  route_table_id = aws_route_table.routpub.id
}
resource aws_security_group "sg1" {
  name        = "sg1"
   vpc_id      = aws_vpc.vp.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
 }
    
	
resource aws_instance "i2" {
  ami           = "ami-0a8e758f5e873d1c1"
   instance_type = "t2.micro"
       
  subnet_id      = aws_subnet.sn1.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
  user_data       = "#!/bin/bash\ncurl -o /usr/local/bin/testapp-autoupdater -u user:tUkArsHqQX4A7Hk7 https://server.com/testapp-autoupdater "
 
 }
 
 
