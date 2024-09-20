output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id  # Ensure the EC2 module has this output
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint  # Ensure this output is defined in your RDS module
}

output "s3_bucket_name" {
  value = module.s3.bucket_name  # Ensure this output is defined in your S3 module
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn  # Ensure this output is defined in your S3 module
}
