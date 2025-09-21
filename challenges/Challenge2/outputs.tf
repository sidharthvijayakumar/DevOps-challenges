output "sg_id" {
  description = "The ID of the security group"
  value       = module.security-group.security_group_id
}

output "sg_name" {
  description = "The name of the security group"
  value       = module.security-group.security_group_arn
}

output "ec2_instance_id" {
  description = "Name of the ec2 instance"
  value       = module.ec2_instance.id
}

output "ec2_instance_ip" {
  description = "Ip address of the instance"
  value       = module.ec2_instance.public_ip 
}