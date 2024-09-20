output "bucket_name" {
  value = aws_s3_bucket.terraformbuk.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.terraformbuk.arn
}

output "website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.terraformbuk_website.website_endpoint}"
}
