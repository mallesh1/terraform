variable "region" {
}

variable "vpc_id"{
    type = "map"
    default = {
      eu-west-1    = "vpc-29f64350"
      us-east-1    = "vpc-c82949b5"
}
}
variable "sn_id"{
  type=list
  default = {
      eu-west-1    = "subnet-aad620e1"
      us-east-1    = "subnet-32643054"
}
}

variable "ami_id" {
  type = "map"
  default = {
    us-east-1    = "ami-04d29b6f966df1537"
    eu-west-1    = "ami-0a8e758f5e873d1c1"
  }
}


variable "instance_type" {
  type    = "string"
  default = "t2.micro"
  }
  