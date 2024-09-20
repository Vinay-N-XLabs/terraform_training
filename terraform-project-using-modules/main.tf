provider "aws" {
  region = "ap-south-1"
}

module "s3" {
  source      = "./modules/s3"  # Adjust path if necessary
  bucket_name = var.bucket_name   # Ensure this variable is defined in your variables.tf
  tags        = {
    Environment = "dev"
    Project     = "my-project"
  }
  acl         = "private"  # Change as needed
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  cidr   = "15.0.0.0/16"
  cidr_public_subnet = "15.1.0.0/16"
  cidr_private_subnet = "15.2.0.0/16"
}

# RDS Module
module "rds" {
  source                  = "./modules/rds"
  db_instance_identifier  = "my-rds-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  allocated_storage       = 10
  db_name                = "mydatabase"
  username               = "terrafrom"
  password               = "password"
  publicly_accessible     = false
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
  # You might want to specify a security group for the RDS if necessary
  vpc_security_group_id = module.vpc.security_group_id
}

# EC2 Module
module "ec2" {
  source                   = "./modules/ec2"
  ami                      = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type           = "t2.micro"               # Change if needed
  key_name                 = "MyKeyPair"
  subnet_id               = module.vpc.public_subnet_id
  ssh_security_group_id    = module.vpc.security_group_id
  instance_count           = 1
  tags = {
    Name = "My EC2 Instance"
    Environment = "dev"
  }
}
