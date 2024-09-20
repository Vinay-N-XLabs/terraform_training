# AWS VPC Terraform Configuration

This Terraform configuration sets up an AWS Virtual Private Cloud (VPC) with the following components:

- A main VPC
- A public subnet
- A private subnet
- An Internet Gateway
- A routing table for the public subnet
- A security group for web traffic

## Prerequisites

- **Terraform**: Ensure you have Terraform installed. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
- **AWS Account**: You need an AWS account with the necessary permissions to create VPCs, subnets, and other networking components.

## Configuration Overview

### Variables

The following variables are used in the configuration. You can define these in a `terraform.tfvars` file or provide them during the Terraform apply command.

- `cidr`: The CIDR block for the main VPC (e.g., `10.0.0.0/16`).
- `cidr_public_subnet`: The CIDR block for the public subnet (e.g., `10.0.1.0/24`).
- `cidr_private_subnet`: The CIDR block for the private subnet (e.g., `10.0.2.0/24`).

### Components

1. **Main VPC**: 
   - CIDR Block: Defined by the `var.cidr` variable.
   - DNS Support and Hostnames: Enabled.

2. **Public Subnet**:
   - CIDR Block: Defined by the `var.cidr_public_subnet` variable.
   - Availability Zone: `ap-south-1`.
   - Automatically assigns public IP addresses to instances.

3. **Private Subnet**:
   - CIDR Block: Defined by the `var.cidr_private_subnet` variable.
   - Availability Zone: `ap-south-1`.
   - Does not assign public IP addresses.

4. **Internet Gateway**: 
   - Attached to the main VPC to enable internet access for the public subnet.

5. **Routing Table**: 
   - Routes traffic from the public subnet to the internet through the Internet Gateway.

6. **Security Group**: 
   - Allows HTTP traffic (port 80) from any IP address.
   - Allows all outbound traffic.

