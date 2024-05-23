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
  user_data = base64encode(file("userdata.sh"))
}

resource "aws_instance" "ec2_instance2" {
    ami = "ami-09040d770ffe2224f"
    instance_type = "t2.micro"
    provider = "aws.region2"
    tags = {
    Name = "Instance2"
  }
  user_data = base64encode(file("userdata1.sh"))
}



data "aws_vpc" "default" {
 default = true
}
resource "aws_security_group" "grp_instance1" {
  
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
