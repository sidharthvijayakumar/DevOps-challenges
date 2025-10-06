module "vpc" {
  source = "./modules/vpc"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Terraform   = "true"
    Environment = "dev"
    purpose     = "eks"
  }
}

module "security-group" {
  source      = "./modules/security-groups"
  name        = "eks-sg"
  description = "Security group for EKS"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}

module "eks" {
  source             = "./modules/eks"
  name               = "dev-eks-cluster"
  kubernetes_version = "1.32"
  subnet_ids         = module.vpc.private_subnets
  enable_irsa        = true
  tags = {
    cluster = "demo"
  }
  vpc_id = module.vpc.vpc_id
  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2_x86_64"
      instance_types = ["t3.micro"]
      vpc_security_group_ids = [module.security-group.security_group_id]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
