variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"  # Change as necessary
}

variable "bucket_name" {
  description = "The name of the S3 bucket for remote state"
  type        = string
  default     = "terrafrombuk" # Change as necessary
}

