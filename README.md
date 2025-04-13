# SYST35144 Terraform Lab – Modular AWS Environment

This repository contains a fully modular and reusable Terraform project that provisions a complete AWS infrastructure for the SYST35144 course lab. The project automates the deployment of a VPC, subnets, a security group, and two EC2 web servers—one in a public subnet and one in a private subnet.


## 🚀 What It Does

- ✅ Creates a new **VPC**
- ✅ Adds **1 public** and **1 private** subnet
- ✅ Configures **Internet Gateway** and **Route Tables**
- ✅ Sets up a **Security Group** allowing:
  - SSH (port 22)
  - HTTP (port 80)
- ✅ Launches **two EC2 instances**:
  - One in the **public subnet**
  - One in the **private subnet**
- ✅ Outputs:
  - VPC ID
  - Subnet IDs
  - EC2 Instance IDs and public IP (for the public one)

## 🔧 How to Use

1. Initialize Terraform

    terraform init

2. Review the execution plan

    terraform plan

3. Apply the configuration

    terraform apply

4. Destroy the infrastructure (when done)

    terraform destroy
