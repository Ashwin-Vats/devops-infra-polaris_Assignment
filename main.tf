module "vpc" {
  source       = "./modules/vpc"
  project_name = "devops"
  vpc_cidr     = "10.0.0.0/16"
  azs          = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "devops-eks"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  env             = "dev"
}
