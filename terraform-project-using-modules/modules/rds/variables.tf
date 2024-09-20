variable "db_instance_identifier" {
  description = "The name of the DB instance"
  type        = string
  default     = "my-rds-instance"  # Default value
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"             # Default value
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "8.0"               # Default value
}

variable "instance_class" {
  description = "The instance type of the DB instance"
  type        = string
  default     = "db.t2.micro"       # Default value
}

variable "allocated_storage" {
  description = "The amount of storage (in gigabytes) to allocate for the DB instance"
  type        = number
  default     = 20                   # Default value
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "mydatabase"         # Default value
}

variable "username" {
  description = "The name of the master user for the database"
  type        = string
  default     = "admin"              # Default value
}

variable "password" {
  description = "The password for the master user"
  type        = string
  sensitive   = true
  default     = "yourpassword"       # Default value (make sure to change this for security)
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
  default     = false                 # Default value
}

variable "tags" {
  description = "Tags to assign to the DB instance"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "my-project"
  }                                    # Default values
}
variable "vpc_security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}
