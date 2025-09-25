#################
# Security group
#################
variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

variable "create_sg" {
  description = "Whether to create security group"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "ID of existing security group whose rules we will manage"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix or fixed name. Should be true to able to update security group name after initial creation"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}

variable "create_timeout" {
  description = "Time to wait for a security group to be created"
  type        = string
  default     = "10m"
}

variable "delete_timeout" {
  description = "Time to wait for a security group to be deleted"
  type        = string
  default     = "15m"
}

##########
# Ingress
##########
variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "ingress_with_self" {
  description = "List of ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_ipv6_cidr_blocks" {
  description = "List of ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_with_prefix_list_ids" {
  description = "List of ingress rules to create where 'prefix_list_ids' is used only"
  type        = list(map(string))
  default     = []
}

###################
# Computed Ingress
###################
variable "computed_ingress_rules" {
  description = "List of computed ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "computed_ingress_with_self" {
  description = "List of computed ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_cidr_blocks" {
  description = "List of computed ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_ipv6_cidr_blocks" {
  description = "List of computed ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_source_security_group_id" {
  description = "List of computed ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_prefix_list_ids" {
  description = "List of computed ingress rules to create where 'prefix_list_ids' is used"
  type        = list(map(string))
  default     = []
}

###################################
# Number of computed ingress rules
###################################
variable "number_of_computed_ingress_rules" {
  description = "Number of computed ingress rules to create by name"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_self" {
  description = "Number of computed ingress rules to create where 'self' is defined"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_cidr_blocks" {
  description = "Number of computed ingress rules to create where 'cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_ipv6_cidr_blocks" {
  description = "Number of computed ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_source_security_group_id" {
  description = "Number of computed ingress rules to create where 'source_security_group_id' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_prefix_list_ids" {
  description = "Number of computed ingress rules to create where 'prefix_list_ids' is used"
  type        = number
  default     = 0
}

#########
# Egress
#########
variable "egress_rules" {
  description = "List of egress rules to create by name"
  type        = list(string)
  default     = []
}

variable "egress_with_self" {
  description = "List of egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_ipv6_cidr_blocks" {
  description = "List of egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_prefix_list_ids" {
  description = "List of egress rules to create where 'prefix_list_ids' is used only"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["::/0"]
}

variable "egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules"
  type        = list(string)
  default     = []
}

##################
# Computed Egress
##################
variable "computed_egress_rules" {
  description = "List of computed egress rules to create by name"
  type        = list(string)
  default     = []
}

variable "computed_egress_with_self" {
  description = "List of computed egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_cidr_blocks" {
  description = "List of computed egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_ipv6_cidr_blocks" {
  description = "List of computed egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_source_security_group_id" {
  description = "List of computed egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_prefix_list_ids" {
  description = "List of computed egress rules to create where 'prefix_list_ids' is used only"
  type        = list(map(string))
  default     = []
}

##################################
# Number of computed egress rules
##################################
variable "number_of_computed_egress_rules" {
  description = "Number of computed egress rules to create by name"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_self" {
  description = "Number of computed egress rules to create where 'self' is defined"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_cidr_blocks" {
  description = "Number of computed egress rules to create where 'cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_ipv6_cidr_blocks" {
  description = "Number of computed egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_source_security_group_id" {
  description = "Number of computed egress rules to create where 'source_security_group_id' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_prefix_list_ids" {
  description = "Number of computed egress rules to create where 'prefix_list_ids' is used only"
  type        = number
  default     = 0
}

variable "putin_khuylo" {
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}

#################EC2##################

variable "region" {
  description = "Region where the resource(s) will be managed. Defaults to the Region set in the provider configuration"
  type        = string
  default     = null
}

################################################################################
# Instance
################################################################################

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

variable "ami_ssm_parameter" {
  description = "SSM parameter name for the AMI ID. For Amazon Linux AMI SSM parameters see [reference](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters-ami.html)"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

variable "ignore_ami_changes" {
  description = "Whether changes to the AMI ID changes should be ignored by Terraform. Note - changing this value will result in the replacement of the instance"
  type        = bool
  default     = false
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "capacity_reservation_specification" {
  description = "Describes an instance's Capacity Reservation targeting option"
  type = object({
    capacity_reservation_preference = optional(string)
    capacity_reservation_target = optional(object({
      capacity_reservation_id                 = optional(string)
      capacity_reservation_resource_group_arn = optional(string)
    }))
  })
  default = null
}

variable "cpu_options" {
  description = "Defines CPU options to apply to the instance at launch time."
  type = object({
    amd_sev_snp      = optional(string)
    core_count       = optional(number)
    threads_per_core = optional(number)
  })
  default = null
}

variable "cpu_credits" {
  description = "The credit option for CPU usage (unlimited or standard)"
  type        = string
  default     = null
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = null
}

variable "disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection"
  type        = bool
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "enclave_options_enabled" {
  description = "Whether Nitro Enclaves will be enabled on the instance. Defaults to `false`"
  type        = bool
  default     = null
}

variable "enable_primary_ipv6" {
  description = "Whether to assign a primary IPv6 Global Unicast Address (GUA) to the instance when launched in a dual-stack or IPv6-only subnet"
  type        = bool
  default     = null
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  type = map(object({
    device_name  = string
    no_device    = optional(bool)
    virtual_name = optional(string)
  }))
  default = null
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it"
  type        = bool
  default     = null
}

variable "hibernation" {
  description = "If true, the launched EC2 instance will support hibernation"
  type        = bool
  default     = null
}

variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = null
}

variable "host_resource_group_arn" {
  description = "ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the `tenancy` parameter or set it to `host`"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  type        = string
  default     = null
}

variable "instance_market_options" {
  description = "The market (purchasing) option for the instance. If set, overrides the `create_spot_instance` variable"
  type = object({
    market_type = optional(string)
    spot_options = optional(object({
      instance_interruption_behavior = optional(string)
      max_price                      = optional(string)
      spot_instance_type             = optional(string)
      valid_until                    = optional(string)
    }))
  })
  default = null
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  type        = number
  default     = null
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = list(string)
  default     = null
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "launch_template" {
  description = "Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template"
  type = object({
    id      = optional(string)
    name    = optional(string)
    version = optional(string)
  })
  default = null
}

variable "maintenance_options" {
  description = "The maintenance options for the instance"
  type = object({
    auto_recovery = optional(string)
  })
  default = null
}

variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_protocol_ipv6          = optional(string)
    http_put_response_hop_limit = optional(number, 1)
    http_tokens                 = optional(string, "required")
    instance_metadata_tags      = optional(string)
  })
  default = {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = null
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type = map(object({
    delete_on_termination = optional(bool)
    device_index          = optional(number) # Will fall back to use map key as device index
    network_card_index    = optional(number)
    network_interface_id  = string
  }))
  default = null
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  type        = string
  default     = null
}

variable "placement_partition_number" {
  description = "Number of the partition the instance is in. Valid only if the `aws_placement_group` resource's `strategy` argument is set to `partition`"
  type        = number
  default     = null
}

variable "private_dns_name_options" {
  description = "Customize the private DNS name options of the instance"
  type = object({
    enable_resource_name_dns_a_record    = optional(bool)
    enable_resource_name_dns_aaaa_record = optional(bool)
    hostname_type                        = optional(string)
  })
  default = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type = object({
    delete_on_termination = optional(bool)
    encrypted             = optional(bool)
    iops                  = optional(number)
    kms_key_id            = optional(string)
    tags                  = optional(map(string))
    throughput            = optional(number)
    size                  = optional(number)
    type                  = optional(string)
  })
  default = null
}

variable "secondary_private_ips" {
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e. referenced in a `network_interface block`"
  type        = list(string)
  default     = null
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  type        = bool
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}


variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host"
  type        = string
  default     = null
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set"
  type        = bool
  default     = null
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time"
  type        = map(string)
  default     = {}
}

variable "enable_volume_tags" {
  description = "Whether to enable volume tags (if enabled it conflicts with root_block_device tags)"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Spot Instance Request
################################################################################

variable "create_spot_instance" {
  description = "Depicts if the instance is a spot instance"
  type        = bool
  default     = false
}

variable "spot_instance_interruption_behavior" {
  description = "Indicates Spot instance behavior when it is interrupted. Valid values are `terminate`, `stop`, or `hibernate`"
  type        = string
  default     = null
}

variable "spot_launch_group" {
  description = "A launch group is a group of spot instances that launch together and terminate together. If left empty instances are launched and terminated individually"
  type        = string
  default     = null
}

variable "spot_price" {
  description = "The maximum price to request on the spot market. Defaults to on-demand price"
  type        = string
  default     = null
}

variable "spot_type" {
  description = "If set to one-time, after the instance is terminated, the spot request will be closed. Default `persistent`"
  type        = string
  default     = null
}

variable "spot_wait_for_fulfillment" {
  description = "If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached"
  type        = bool
  default     = null
}

variable "spot_valid_from" {
  description = "The start date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = null
}

variable "spot_valid_until" {
  description = "The end date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = null
}

################################################################################
# EBS Volume(s)
################################################################################

variable "ebs_volumes" {
  description = "Additional EBS volumes to attach to the instance"
  type = map(object({
    encrypted            = optional(bool)
    final_snapshot       = optional(bool)
    iops                 = optional(number)
    kms_key_id           = optional(string)
    multi_attach_enabled = optional(bool)
    outpost_arn          = optional(string)
    size                 = optional(number)
    snapshot_id          = optional(string)
    tags                 = optional(map(string), {})
    throughput           = optional(number)
    type                 = optional(string, "gp3")
    # Attachment
    device_name                    = optional(string) # Will fall back to use map key as device name
    force_detach                   = optional(bool)
    skip_destroy                   = optional(bool)
    stop_instance_before_detaching = optional(bool)
  }))
  default = null
}

################################################################################
# IAM Role / Instance Profile
################################################################################

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (`iam_role_name` or `name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "IAM role path"
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  type        = string
  default     = null
}

variable "iam_role_policies" {
  description = "Policies attached to the IAM role"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "A map of additional tags to add to the IAM role/profile created"
  type        = map(string)
  default     = {}
}

################################################################################
# Security Group
################################################################################

variable "create_security_group" {
  description = "Determines whether a security group will be created"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Name to use on security group created"
  type        = string
  default     = null
}

variable "security_group_use_name_prefix" {
  description = "Determines whether the security group name (`security_group_name` or `name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = null
}

variable "security_group_vpc_id" {
  description = "VPC ID to create the security group in. If not set, the security group will be created in the default VPC"
  type        = string
  default     = null
}

variable "security_group_tags" {
  description = "A map of additional tags to add to the security group created"
  type        = map(string)
  default     = {}
}

variable "security_group_egress_rules" {
  description = "Egress rules to add to the security group"
  type = map(object({
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string, "tcp")
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
    to_port                      = optional(number)
  }))
  default = {
    ipv4_default = {
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all IPv4 traffic"
      ip_protocol = "-1"
    }
    ipv6_default = {
      cidr_ipv6   = "::/0"
      description = "Allow all IPv6 traffic"
      ip_protocol = "-1"
    }
  }
}

variable "security_group_ingress_rules" {
  description = "Ingress rules to add to the security group"
  type = map(object({
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string, "tcp")
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
    to_port                      = optional(number)
  }))
  default = null
}

################################################################################
# Elastic IP
################################################################################

variable "create_eip" {
  description = "Determines whether a public EIP will be created and associated with the instance."
  type        = bool
  default     = false
}

variable "eip_domain" {
  description = "Indicates if this EIP is for use in VPC"
  type        = string
  default     = "vpc"
}

variable "eip_tags" {
  description = "A map of additional tags to add to the eip"
  type        = map(string)
  default     = {}
}
################################
#Cloudwatch metric alarm
###############################
variable "create_metric_alarm" {
  description = "Whether to create the Cloudwatch metric alarm"
  type        = bool
  default     = true
}

variable "alarm_name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account."
  type        = string
  default     = null
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
  default     = null
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  type        = string
  default     = null
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = null
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = null
}

variable "threshold_metric_id" {
  description = "If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  type        = string
  default     = null
}

variable "unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
  default     = null
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  type        = string
  default     = null
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics."
  type        = string
  default     = null
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = null
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}

variable "actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true."
  type        = bool
  default     = true
}

variable "datapoints_to_alarm" {
  description = "The number of datapoints that must be breaching to trigger the alarm."
  type        = number
  default     = null
}

variable "dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = any
  default     = null
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  type        = string
  default     = null
}

variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching."
  type        = string
  default     = "missing"
}

variable "evaluate_low_sample_count_percentiles" {
  description = "Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate."
  type        = string
  default     = null
}

variable "metric_query" {
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  type        = any
  default     = []
}
########################################
#SNS TOPIC AND SUB
########################################
variable "sns_create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}


################################################################################
# Topic
################################################################################

variable "topic_name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = null
}


variable "application_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "content_based_deduplication" {
  description = "Boolean indicating whether or not to enable content-based deduplication for FIFO topics."
  type        = bool
  default     = false
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "fifo_throughput_scope" {
  description = "Enables higher throughput for FIFO topics by adjusting the scope of deduplication. This attribute has two possible values, Topic and MessageGroup"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic"
  type        = bool
  default     = false
}

variable "firehose_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "http_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "lambda_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "topic_policy" {
  description = "An externally created fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "sqs_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "signature_version" {
  description = "If SignatureVersion should be 1 (SHA1) or 2 (SHA256). The signature version corresponds to the hashing algorithm used while creating the signature of the notifications, subscription confirmations, or unsubscribe confirmation messages sent by Amazon SNS."
  type        = number
  default     = null
}

variable "tracing_config" {
  description = "Tracing mode of an Amazon SNS topic. Valid values: PassThrough, Active."
  type        = string
  default     = null
}

variable "archive_policy" {
  description = "The message archive policy for FIFO topics."
  type        = string
  default     = null
}

################################################################################
# Topic Policy
################################################################################

variable "create_topic_policy" {
  description = "Determines whether an SNS topic policy is created"
  type        = bool
  default     = true
}

variable "source_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "enable_default_topic_policy" {
  description = "Specifies whether to enable the default topic policy. Defaults to `true`"
  type        = bool
  default     = true
}

variable "topic_policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

################################################################################
# Subscription(s)
################################################################################

variable "create_subscription" {
  description = "Determines whether an SNS subscription is created"
  type        = bool
  default     = true
}

variable "subscriptions" {
  description = "A map of subscription definitions to create"
  type        = any
  default     = {}
}

################################################################################
# Data Protection Policy
################################################################################

variable "data_protection_policy" {
  description = "A map of data protection policy statements"
  type        = string
  default     = null
}