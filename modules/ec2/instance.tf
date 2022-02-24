provider "aws" {
     region  = var.region
     #version = "~> 2.1"
}

resource "aws_instance" "web" {
  count                     = length(var.instance-web-tags)
  ami                       = lookup(var.ami, var.region)
  instance_type             = var.instance-type-web
  iam_instance_profile      = var.instance-profile
  user_data                 = file(var.script)
  subnet_id                 = element(var.public-subnets, count.index)
  vpc_security_group_ids    = [var.sgforweb]
  key_name                  = var.key-name
    
  tags = {
    Name = element(var.instance-web-tags, count.index)
  }
}
