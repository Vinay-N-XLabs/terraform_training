variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"  # Optional default value
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "ssh_security_group_id" {
  description = "The security group ID for SSH access"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to assign to the EC2 instance"
  type        = map(string)
  default     = {
    Name = "EC2-Instance"
    Environment = "dev"
  }
}
