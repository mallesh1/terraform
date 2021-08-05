
variable "region" {
}

variable "vpc_id"{
    type = "map"
    default = {
      eu-west-1    = "vpc-29f64350"
}
}
variable "sn_id"{
  type=list
  default = {
      eu-west-1    = "subnet-aad620e1"
}
}

variable "ami_id" {
  type = "map"
  default = {
    eu-west-1    = "ami-0a8e758f5e873d1c1"
  }
}


variable "instance_type" {
  type    = "string"
  default = "t2.micro"
  }
