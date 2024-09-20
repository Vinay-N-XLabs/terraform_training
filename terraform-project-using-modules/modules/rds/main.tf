resource "aws_db_instance" "rdsdb" {
	identifier = var.db_instance_identifier
	engine = var.engine
	engine_version = var.engine_version
	instance_class = var.instance_class
	allocated_storage = var.allocated_storage
	db_name = var.db_name
	username = var.username
	password = var.password
	skip_final_snapshot = true
	publicly_accessible = var.publicly_accessible
	vpc_security_group_ids = [var.vpc_security_group_id]	
	tags = merge(
	var.tags,
	{
	Name=var.db_instance_identifier
	})
}
