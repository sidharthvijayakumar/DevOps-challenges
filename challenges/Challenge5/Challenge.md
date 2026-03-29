# 🚀 DevOps Friday Challenge: HPA vs Deployment Scaling

## 🎯 Objective

Understand how **Kubernetes Deployment** and **Horizontal Pod Autoscaler (HPA)** interact under load, and how scaling behavior works in real-world scenarios.

---

## 🧩 Scenario

You are deploying a simple web application in Kubernetes with the following requirements:

- Application should start with **1 pod**
- It should **auto-scale under load**
- Scaling should have a **maximum limit**
- You must **observe and validate scaling behavior**

---

## 🛠️ Tasks

### 🔹 Task 1: Create Deployment

Create a Deployment with:

- Name: `hpa-demo`
- Image: `nginx`
- Replicas: `1`
- CPU request: `100m`
- CPU limit: `200m`

> ⚠️ HPA will NOT work without CPU requests.

---

### 🔹 Task 2: Expose Service

```bash
kubectl expose deployment hpa-demo --port=80 --type=ClusterIP
```
Scenario 1: Remove CPU Requests
	•	What happens to HPA?

Scenario 2: Set Deployment Replicas = 3
	•	Does it scale down to 1?

Scenario 3: Set HPA maxReplicas = 3
	•	What happens under heavy load?

Scenario 4: Remove Metrics Server
	•	What error do you see?