module "security-group" {
  source      = "./modules/security-groups"
  name        = "user-service"
  description = "Security group for ec2 instance where nginx is running!"
  vpc_id      = "vpc-750ffb1e"

  ingress_cidr_blocks = ["58.84.61.206/32"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  ingress_with_cidr_blocks = [

  ]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_instance" {
  source = "./modules/aws-ec2"

  name = "spot-instance"

  create_spot_instance  = true
  spot_price            = "0.60"
  spot_type             = "persistent"
  create_security_group = false

  instance_type          = "t3.micro"
  ami                    = "ami-0d0ad8bb301edb745"
  key_name               = "demo-key-pair"
  vpc_security_group_ids = [module.security-group.security_group_id]
  monitoring             = true
  subnet_id              = "subnet-f83faa83"
  user_data              = file("user_data.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}