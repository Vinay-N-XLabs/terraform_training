# AWS S3 Bucket and DynamoDB Locking Terraform Module

This Terraform module creates an AWS S3 bucket with versioning enabled and a DynamoDB table for state locking to prevent concurrent operations during deployments.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- AWS account with appropriate permissions to create S3 buckets and DynamoDB tables.
- AWS credentials configured (e.g., via `aws configure`).

## Module Structure

The module includes the following resources:

### `aws_s3_bucket`

- **Bucket**: The name of the S3 bucket.
- **Tags**: Tags to apply to the bucket.

### `aws_s3_bucket_acl`

- **Bucket**: The ID of the S3 bucket for which the ACL (Access Control List) is applied.
- **ACL**: The access control policy for the bucket.

### `aws_s3_bucket_versioning`

- **Bucket**: The ID of the S3 bucket for which versioning is enabled.
- **Versioning Configuration**: Status set to "Enabled" to allow versioning.

### `aws_dynamodb_table`

- **Name**: The name of the DynamoDB table for state locking.
- **Billing Mode**: Set to "PROVISIONED".
- **Read and Write Capacity**: Set to 1 for both.
- **Hash Key**: The primary key for the table, which is "LockID".

## Usage

To use this module, include it in your Terraform configuration:

```hcl
module "s3_dynamodb" {
  source          = "./path/to/your/module"  # Update this path
  bucket_name     = "your-unique-bucket-name"
  acl             = "private"                  # or another ACL value
  tags            = {
    Environment = "dev",
    Project     = "YourProject"
  }
}
