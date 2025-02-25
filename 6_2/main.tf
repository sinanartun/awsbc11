provider "aws" {
  region  = "eu-north-1"
  profile = "deneme"
}

module "vpc" {
  source = "./modules/vpc"
}


module "vpc2" {
  source = "./modules/vpc2"
  hasanin-vpc-id   = module.vpc.hasanin-vpc-id
  aws_route_table_id = module.vpc.aws_route_table_id
  
}
