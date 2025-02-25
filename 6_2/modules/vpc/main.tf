provider "aws" {
  region  = "eu-north-1"
  profile = "deneme"
}

variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "profile" {
  type    = string
  default = "deneme"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc-ama-bu-yeni-olan"
  }
}



data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "bizim-route-table"
  }
}




resource "aws_subnet" "public" {
  count                                       = 3
  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = element(["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"], count.index)
  map_public_ip_on_launch                     = false
  availability_zone                           = data.aws_availability_zones.available.names[count.index]
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}


resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


output "hasanin-vpc-id" {
  value = aws_vpc.main.id
  
}

output "aws_route_table_id" {
  value = aws_route_table.public.id
  
}
# output "available_azs" {
#   value = [data.aws_availability_zones.available.names]
# }