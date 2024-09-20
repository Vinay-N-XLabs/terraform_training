provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "terrafrombuk"
    key    = "terraform/dev/state"
    region = "ap-south-1"
  }
}

# VPC Module for Development
module "vpc" {
  source                = "./modules/vpc"
  cidr                  = "15.0.0.0/16"
  cidr_public_subnet    = "15.1.0.0/24"  # Smaller CIDR for dev
  cidr_private_subnet   = "15.2.0.0/24"  # Smaller CIDR for dev
}

# RDS Module for Development
module "rds" {
  source                  = "./modules/rds"
  db_instance_identifier  = "dev-rds-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"  # Free tier eligible
  allocated_storage       = 20              # Adjust for dev
  db_name                = "devdatabase"
  username               = "devuser"
  password               = "devpassword"    # Change for security
  publicly_accessible     = true             # Typically allowed in dev
  tags = {
    Environment = "dev"
    Project     = "dev-project"
  }
}

# EC2 Module for Development
module "ec2" {
  source                   = "./modules/ec2"
  key_name                 = "MyDevKeyPair"   # Change to your key pair
  ssh_security_group_id    = module.vpc.security_group_id
  subnet_id                = module.vpc.public_subnet_id
  ami                      = "ami-0c55b159cbfafe1f0"  # Example Ubuntu AMI
  instance_type           = "t2.micro"          # Free tier eligible
  instance_count          = 1                    # Launch one instance
  tags = {
    Name        = "dev-ec2-instance"
    Environment = "dev"
  }
}
