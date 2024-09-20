# Terraform Project: AWS Infrastructure Setup

## Overview
This Terraform project sets up a complete AWS infrastructure with the following components:

- **Virtual Private Cloud (VPC)**: A main VPC with public and private subnets.
- **Security Groups**: Controlled access for resources.
- **EC2 Instances**: For hosting applications.
- **RDS (Relational Database Service)**: For database management.
- **S3 Bucket**: For remote state storage with versioning.
- **DynamoDB Table**: For state locking to prevent concurrent operations.

## Directory Structure
terraform-project-using-modules/ ├── main.tf # Root module main configuration ├── variables.tf # Root module variables ├── outputs.tf # Root module outputs └── modules/ ├── ec2/ │ ├── main.tf # EC2 module configuration │ └── variables.tf # EC2 module variables ├── rds/ │ ├── main.tf # RDS module configuration │ └── variables.tf # RDS module variables └── vpc/ ├── main.tf # VPC module
## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS account with appropriate permissions.
- AWS CLI configured with your credentials.

## Configuration

### Variables
The project uses the following variables:
- **AMI**: The AMI ID for EC2 instances (default: `ami-0c55b159cbfafe1f0`).
- **Instance Type**: The instance type for EC2 (default: `t2.micro`).
- **Key Name**: The name of the SSH key pair.
- **Database Configuration**: Includes parameters like `db_name`, `username`, `password`, etc.
- **S3 Bucket Name**: Name of the S3 bucket for state storage.

### Back-end Configuration
The remote state is managed using an S3 bucket. Modify the `backend` block in the root `main.tf` to specify your bucket details:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "terraform/state"
    region         = "your-region"
  }
}
 configuration └── variables.tf # VPC module variables

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS account with appropriate permissions.
- AWS CLI configured with your credentials.

## Configuration

### Variables
The project uses the following variables:
- **AMI**: The AMI ID for EC2 instances (default: `ami-0c55b159cbfafe1f0`).
- **Instance Type**: The instance type for EC2 (default: `t2.micro`).
- **Key Name**: The name of the SSH key pair.
- **Database Configuration**: Includes parameters like `db_name`, `username`, `password`, etc.
- **S3 Bucket Name**: Name of the S3 bucket for state storage.

### Back-end Configuration
The remote state is managed using an S3 bucket. Modify the `backend` block in the root `main.tf` to specify your bucket details:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "terraform/state"
    region         = "your-region"
  }
}
