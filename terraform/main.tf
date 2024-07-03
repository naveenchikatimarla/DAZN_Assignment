module "ecr" {
  source     = "./ecr"
  region     = var.region
  account_id = var.account_id
}

module "vpc" {
  source = "./vpc"
}

module "instance" {
  source              = "./instance"
  vpc_id              = module.vpc.vpc_id
  subnet_a_id         = module.vpc.subnet_a_id
  security_group_id   = module.vpc.security_group_id
  ecr_repository_url  = module.ecr.repository_url
  region              = var.region
  account_id          = var.account_id
  key_name            = var.key_name
  ami                 = var.ami
  instance_type       = var.instance_type
}

module "load_balancer" {
  source              = "./load_balancer"
  vpc_id              = module.vpc.vpc_id
  subnet_a_id         = module.vpc.subnet_a_id
  subnet_b_id         = module.vpc.subnet_b_id
  security_group_id   = module.vpc.security_group_id
  instance_id         = module.instance.instance_id
}
