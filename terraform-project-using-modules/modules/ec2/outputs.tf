output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.ubuntu[*].id
}

output "public_ips" {
  description = "The public IP addresses of the created EC2 instances"
  value       = aws_instance.ubuntu[*].public_ip
}

output "private_ips" {
  description = "The private IP addresses of the created EC2 instances"
  value       = aws_instance.ubuntu[*].private_ip
}
output "instance_id" {
  value = aws_instance.ubuntu[*].id 
}
