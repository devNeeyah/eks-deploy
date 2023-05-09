output "region" {
  description = "AWS region"
  value       = var.region
}

output "public_ip_of_dev_server" {
    description = "Public IP"
    value = aws_instance.dev-server.public_ip
}

output "private_ip_of_dev_server" {
    description = "Private IP"
    value = aws_instance.dev-server.private_ip
}