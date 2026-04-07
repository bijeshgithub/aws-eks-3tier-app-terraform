module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.3.0/24"]
  azs             = ["us-east-1"]
}

module "eks" {
  source = "./modules/eks"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source = "./modules/rds"
  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

}


