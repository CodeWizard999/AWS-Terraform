provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "./vpc"
  cidr_block           = var.cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

module "security_group" {
  source     = "./security_group"
  vpc_id     = module.vpc.vpc_id
}


module "instances" {
  source             = "./instances"
  ami_id             = "ami-0453ec754f44f9a4a"  
  public_subnet_id   = module.vpc.public_subnet_id
  private_subnet_id  = module.vpc.private_subnet_id
  security_group_id  = module.security_group.security_group_id
  instance_type      = var.instance_type
}
