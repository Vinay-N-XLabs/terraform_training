variable "bucket_name" {
	description = "This is the bucket name for our S3 Bucket"
	type = string
#	default = "terraformbuk"
}

variable "tags"{
	description = " Tags bro"
	type=map(string)
	default = {"env"="s3","Name"="Tbuck"}
}



variable "acl" {
  description = "The ACL for the bucket"
  type        = string
  default     = "private"
}
