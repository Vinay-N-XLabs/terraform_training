# AWS RDS Instance Terraform Module

This Terraform module creates an AWS RDS (Relational Database Service) instance using the specified configuration parameters.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- AWS account with appropriate permissions to create RDS instances.
- AWS credentials configured (e.g., via `aws configure`).

## Module Structure

The module contains the following resources:

### `aws_db_instance`

- **Identifier**: Unique identifier for the DB instance.
- **Engine**: The database engine to use (e.g., MySQL, PostgreSQL, etc.).
- **Engine Version**: The version of the database engine.
- **Instance Class**: The compute and memory capacity of the DB instance (e.g., `db.t2.micro`).
- **Allocated Storage**: The amount of storage (in GB) to allocate for the DB instance.
- **DB Name**: The name of the initial database to create.
- **Username**: The master username for the DB instance.
- **Password**: The master password for the DB instance.
- **Skip Final Snapshot**: If set to `true`, the final snapshot will be skipped when the DB instance is deleted.
- **Publicly Accessible**: Whether the DB instance should be publicly accessible or not.
- **Tags**: Tags to apply to the DB instance.

## Usage

To use this module, include it in your Terraform configuration:

```hcl
module "rds_instance" {
  source                  = "./path/to/your/module"  # Update this path
  db_instance_identifier  = "your-db-identifier"
  engine                 = "mysql"                    # or another supported engine
  engine_version         = "8.0"                      # specify your version
  instance_class         = "db.t2.micro"              # specify your instance class
  allocated_storage       = 20                         # specify allocated storage
  db_name                = "yourdbname"               # specify the initial database name
  username               = "yourusername"             # specify the master username
  password               = "yourpassword"             # specify the master password
  publicly_accessible     = false                      # set to true for public access
  tags                   = {                          # add any 
