resource "aws_instance" "app" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]
  associate_public_ip_address = true
  tags = {
    Name = "Servidores Para Despliege Automatizado"
  }
  timeouts {
    create = "1m"
  }
}