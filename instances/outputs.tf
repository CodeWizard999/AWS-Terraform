output "public_instance_id" {
  value = aws_instance.public_instance.id
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}

output "private_key" {
  value = tls_private_key.terraform.private_key_pem
  sensitive = true
}

output "public_instance_ip" {
  value = aws_instance.public_instance.public_ip
  description = "Public IP of the EC2 instance"
}

output "private_instance_ip" {
  value = aws_instance.private_instance.private_ip
  description = "Private IP of the EC2 instance"
}

