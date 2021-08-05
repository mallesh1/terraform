provider "aws" {}

resource "aws_instance" "test_machine" {
  ami             = var.ami_id[count.index]
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.test_security_group.id]
  user_data       = "#!/bin/bash\ncurl -o /usr/local/bin/testapp-autoupdater -u user:tUkArsHqQX4A7Hk7 https://server.com/testapp-autoupdater "
}

resource "aws_security_group" "test_security_group" {
  name   = "test_security_group_sg"
  vpc_id = var.vpc_id[count.index] // Name TEST_VPC

  egress {
    from_port = 0
    protocol  = "tcp"
    to_port   = 0
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    self            = true
    cidr_blocks     = "0.0.0.0/0"
  }
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket         = "test"
    key            = "us-east-1/terraform.tfstate"
    region         = "us-east-1"
  }
}
