resource "aws_instance" "ubuntu" {
  ami                    = var.ami
  instance_type         = var.instance_type
  key_name              = var.key_name
  count                 = var.instance_count
  subnet_id             = var.subnet_id
  vpc_security_group_ids = [var.ssh_security_group_id]

  tags = merge(
    var.tags,
    {
      Name = "Ubuntu-Instance-${count.index}"
    }
  )
}
