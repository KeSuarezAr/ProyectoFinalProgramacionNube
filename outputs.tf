output "public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.public_ips
}
output "private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = module.ec2.private_ips
}