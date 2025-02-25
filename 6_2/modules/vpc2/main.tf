provider "aws" {
  region  = "eu-north-1"
  profile = "deneme"
}

variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "hasanin-vpc-id" {
  type    = string
}

variable "profile" {
  type    = string
  default = "deneme"
}

variable "aws_route_table_id" {
  type    = string
  
}



data "aws_availability_zones" "available" {}






resource "aws_subnet" "public" {
  count                                       = 3
  vpc_id                                      = var.hasanin-vpc-id
  cidr_block                                  = element(["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"], count.index)
  map_public_ip_on_launch                     = false
  availability_zone                           = data.aws_availability_zones.available.names[count.index]
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 4}"
  }
}


resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = var.aws_route_table_id
}



