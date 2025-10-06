# 🌟 Weekly DevOps Challenge

**Date:** Friday, October 3, 2025  
**Theme:** Automating EKS + CI/CD + Cost Optimization

---

## 📌 Scenario
Your company has a microservices application running on **EKS (private subnets)**. You are tasked with automating the infrastructure, CI/CD pipeline, and optimizing costs.

---

## 🛠️ Challenge Tasks

### 1. Infrastructure as Code (Terraform)
- [ ] Write Terraform to:
  - [ ] Create an **EKS cluster** in private subnets.  
  - [ ] Add a **managed node group**.  
  - [ ] Expose the **EKS API securely** (so CI/CD pipelines can talk to it).  
  - [ ] Configure an **OIDC provider** for IAM Roles for Service Accounts (IRSA).  

### 2. CI/CD (GitLab/GitHub Actions)
- [ ] Build a pipeline that:
  - [ ] Builds a Docker image.  
  - [ ] Pushes the image to **AWS ECR** using **OIDC (no static access keys)**.  
  - [ ] Deploys the service to EKS using a **Helm chart**.  

### 3. Cost Optimization
- [ ] Configure **spot instances** for the worker nodes.  
- [ ] Run **one small long-running workload on Fargate** (to compare pricing vs EC2).  

---

## 📂 Deliverables
- [ ] **Terraform Code** for EKS, NodeGroups, and Fargate profile.  
- [ ] **Pipeline YAML** (GitLab CI/CD or GitHub Actions).  
- [ ] **Helm chart** (can be minimal, just a sample service).  
- [ ] **README Notes** explaining:
  - EKS vs Fargate trade-offs.  
  - Spot vs On-Demand cost benefits.  

---

## 💡 Tips
- Use Terraform modules for EKS and ECR for cleaner code.  
- Secure the API server access with a bastion or private endpoint + IAM.  
- Use `try` and `for_each` in Terraform to handle Spot + On-Demand gracefully.  
- Keep pipeline secrets in GitLab/GitHub **OIDC integration** (no static AWS keys).  

---

## ✅ Success Criteria
- A working EKS cluster with spot + Fargate mix.  
- CI/CD pipeline builds and deploys a service automatically.  
- Documentation clearly explains cost optimization choices.  

---