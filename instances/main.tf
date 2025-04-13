resource "tls_private_key" "terraform" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = tls_private_key.terraform.public_key_openssh
}

resource "aws_instance" "public_instance" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.security_group_id]
  key_name      = aws_key_pair.terraform.key_name  
  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  cd /var/www/html
  echo "Hello from $(hostname -f)" > index.html
  systemctl restart httpd
  systemctl enable httpd
  EOF

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  security_groups = [var.security_group_id]
  key_name      = aws_key_pair.terraform.key_name  

  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  cd /var/www/html
  echo "Hello from $(hostname -f)" > index.html
  systemctl restart httpd
  systemctl enable httpd
  EOF

  tags = {
    Name = "PrivateInstance"
  }
}
