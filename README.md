# CloudSim: LocalStack-Powered AWS Infrastructure Automation

This project automates the deployment of a highly available web architecture using **Terraform**, but instead of deploying to the live AWS cloud, it targets **LocalStack**. This allows for full-cycle DevOps testing in a local, cost-free environment.



## 🛠 Features
- **Local AWS Simulation**: Uses LocalStack to mock VPC, EC2, and ALB services.
- **Zero Cost**: Develop and destroy infrastructure without an AWS bill.
- **High Availability**: Simulates a multi-AZ deployment with a Load Balancer.

## 🏗 Architecture
- **VPC & Networking**: Custom VPC with 2 Public Subnets.
- **Compute**: 2 EC2 Instances (simulated) running Apache.
- **Traffic Management**: Application Load Balancer (ALB) distributing local traffic.

## 🚀 Getting Started

### 1. Prerequisites
- **Terraform** installed.
- **Docker** (Required to run LocalStack).
- **LocalStack CLI** or Docker Compose.

### 2. Start LocalStack
Run LocalStack via Docker:
```bash
docker run --rm -it -p 4566:4566 -p 4571:4571 localstack/localstack
3. Initialize & Apply
Bash

terraform init
terraform plan
terraform apply -auto-approve
4. Verification
Since this is local, you can verify the resources using the LocalStack CLI (awslocal):

Bash

awslocal ec2 describe-instances
The Load Balancer DNS will point to localhost. You can curl the endpoint to see the load balancing in action.

🧹 Cleanup
Bash

terraform destroy

---

### **How to test this locally**
Because LocalStack is running in Docker, your "Public IP" or "Load Balancer DNS" won't be a real internet address. You can test the connection by running:
`curl http://localhost:4566` (or whatever port LocalStack assigns to the ELB service).