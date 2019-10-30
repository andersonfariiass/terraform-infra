variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = "map"
  default = {
    "amazon_ami" = "ami-0b69ea66ff7391e80"
    "ubuntu_ami" = "ami-04b9e92b5572fa0d1"
    "redhat_ami" = "ami-0c322300a1dd5dc79"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-aws"
}

variable "tag" {
  type = "map"
  default = {
    vm-dev = "vm-dev"
    vm-homo = "vm-homologacao"
    vm-prod = "vm-producao"
  }
}

variable "cidr_blocks" {
  type = "list"
  default = ["0.0.0.0/0","0.0.0.0/0"]
}

variable "aws_bucket" {
  default = "bucket-dev01"
}

