# 🚀 Nginx on AWS with Terraform + GitLab CI/CD

This project provisions an **Nginx web server** on AWS EC2 using **Terraform** and automates its deployment with **GitLab CI/CD**.  
It also includes monitoring and alerting via **CloudWatch Alarms + SNS**.

---

## 📂 Project Structure
- `modules/aws-ec2/` → EC2 instance + IAM role
- `modules/security-groups/` → Security group for SSH & HTTP
- `modules/aws-iam-policy/` → Custom IAM policy
- `modules/aws-sns/` → SNS topic + subscription
- `modules/aws-metric-alarm/` → CloudWatch alarm
- `user_data.sh` → Installs and starts Nginx on EC2
- `.gitlab-ci.yml` → CI/CD pipeline for Terraform

---

## ⚙️ Features
- Provisions an **Amazon Linux 2 EC2 instance**
- **Installs Nginx** via `user_data`
- Security group with:
  - HTTP (80) open
  - SSH (22) restricted to your IP
- **IAM role** with SSM and CloudWatch Agent policies
- **CloudWatch alarm**: CPU > 70% for 2 minutes
- **SNS notification**: Email alert on alarm
- GitLab CI/CD pipeline with:
  - `terraform init`
  - `terraform plan`
  - Manual approval for `terraform apply`

---

## 🚀 Deployment

### 1. Clone repo & initialize Terraform
```bash
git clone https://github.com/<your-repo>.git
cd <your-repo>
terraform init