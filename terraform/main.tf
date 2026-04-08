module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source = "./modules/eks"
  
  vpc_id  = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source = "./modules/rds"
  
  
  db_username = var.db_username
  db_password = var.db_password
  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

}

module "k8s" {
  source = "./k8s"

  frontend_image = var.frontend_image
  backend_image  = var.backend_image
  db_endpoint    = var.db_endpoint

  providers = {
    kubernetes = kubernetes
  }
}



