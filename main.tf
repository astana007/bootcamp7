provider "aws"{
region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent      = true
  owners           = [" 137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.0.20230503.0-*"]
  }
}



resource "aws_instance" "amazon_linux"{
instance_type = var.ant
ami= data.aws_ami.amazon_linux.id

tags = {
    Name = var.name_of_insyance
}


output "machine_name" {
    value = "Instance ID is ${aws_instance.amazon_linux.id}"
}




variable "type"{
    description = "intance type
    type = string"
default = "t3.micro"


}

}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = 
    Name = "vpc - $ {var.name}"
    }
} 



resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    
    tags = {
        Name = "subnet-${var.name}
    }
}