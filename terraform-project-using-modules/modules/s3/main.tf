##BUCKET FOR VERSIONING AND LOCKS

#S3 Bucket resource
resource "aws_s3_bucket" "terraformbuk" {
  bucket = var.bucket_name
#  acl    = var.acl

  tags = merge(
    var.tags,
    {
      Name = var.bucket_name
    }
  )
}

resource "aws_s3_bucket_acl" "buckacl" {
	bucket=aws_s3_bucket.terraformbuk.id
	acl=var.acl
}
#S# bucket versioning

resource "aws_s3_bucket_versioning" "terraformbuk_versioning" {
  bucket = aws_s3_bucket.terraformbuk.id

  versioning_configuration {
    status = "Enabled" 
  }
}


#DynamoDB for locking so that concurrent operations dont take place

resource "aws_dynamodb_table" "state_locker" {
	name =	"State-Lock"
	billing_mode = "PROVISIONED"
	read_capacity=1
	write_capacity=1
	hash_key = "LockID"
	
	attribute {
	name="LockID"
	type = "S"
	
	}
	tags = {
		Name= "Terraform-state-locking"
		}
}
resource "aws_s3_bucket_website_configuration" "terraformbuk_website" {
  bucket = aws_s3_bucket.terraformbuk.id

  index_document {
    suffix = "index.html"  # Your index document
  }

  error_document {
    key = "error.html"     # Your error document (optional)
  }
}
