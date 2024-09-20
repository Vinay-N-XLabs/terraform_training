output "db_instance_endpoint" {
  value = aws_db_instance.rdsdb.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.rdsdb.id
}
output "db_instance_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.rdsdb.port
}
