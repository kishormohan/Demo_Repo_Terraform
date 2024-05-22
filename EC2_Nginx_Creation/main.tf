provider "aws" {
    alias = "region1"
    region = "us-east-1"  
}

provider "aws" {
    alias = "region2"
    region = "us-east-2"  
}

resource "aws_instance" "ec2_instance1" {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    provider = "aws.region1"
    tags = {
    Name = "Instance1"
  }
}

resource "aws_instance" "ec2_instance2" {
    ami = "ami-09040d770ffe2224f"
    instance_type = "t2.micro"
    provider = "aws.region2"
    tags = {
    Name = "Instance2"
  }
}



