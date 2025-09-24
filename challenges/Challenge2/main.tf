module "iam_policy" {
  source = "./modules/aws-iam-policy"

  policy_name        = "ec2-instance-policy"
  path               = "/"
  policy_description = "My policy for challnege2"

  policy = file("modules/aws-iam-policy/policy.json")

}

module "security-group" {
  source      = "./modules/security-groups"
  name        = "user-service"
  description = "Security group for ec2 instance where nginx is running!"
  vpc_id      = "vpc-750ffb1e"

  ingress_cidr_blocks = ["58.84.61.125/32"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  ingress_with_cidr_blocks = [

  ]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_instance" {
  source = "./modules/aws-ec2"

  name                        = "spot-instance"
  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    CWAgent             = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    Customerpolicy      = module.iam_policy.policy_arn
  }
  create_spot_instance = false
  #spot_price            = "0.90"
  #spot_type             = "persistent"
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
module "sns" {
  source = "./modules/aws-sns"
  subscriptions = [
    {
      protocol = "email"
      endpoint = "sidharthvijayakumar7@gmail.com"
    }
  ]
}


module "metric_alarm" {
  source              = "./modules/aws-metric-alarm"
  alarm_name          = "high-cpu-utilisation"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  period              = 60
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This alarm triggers if CPU > 70% for 2 minutes"
  dimensions = {
    InstanceId = module.ec2_instance.id
  }
  alarm_actions = [module.sns.topic_arn] # Notify via SNS
}