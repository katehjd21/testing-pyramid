provider "aws" {
  region = "eu-west-2"
}

 data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "testing-pyramid" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id              = "subnet-84e2f4fc"
  vpc_security_group_ids = ["sg-00d5a1d67232f43a4"]

  tags = {
    Name = "testing-pyramid"
  }
}