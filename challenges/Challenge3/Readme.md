# ⚡ DevOps Challenge #3

## 🎯 Goal
Deploy a simple **Python Flask application** to a **local Kubernetes cluster (kind or minikube)**, monitor it with **Prometheus + Grafana**, and add a custom **alerting script**.

---

## 1️⃣ Infra Setup
- Use **kind** (Kubernetes in Docker) or **minikube** to create a local K8s cluster.
- Install **Helm** if not already installed.

---

## 2️⃣ App Deployment
- Write a simple **Flask app** with one endpoint: `/healthz` returning `200 OK`.
- Containerize it using **Docker**.
- Deploy to Kubernetes with:
  - A **Deployment** (2 replicas)
  - A **Service** (ClusterIP or NodePort to expose it)

---

## 3️⃣ Monitoring Stack
- Deploy **Prometheus + Grafana** via Helm charts.
- Expose Grafana on a NodePort so you can open it in your browser.
- Configure Prometheus to scrape metrics from your Flask app:
  - Use the `prometheus_client` Python library
  - Expose metrics at `/metrics`

---

## 4️⃣ Alerting
- Create a **Prometheus alert rule**:  
  Trigger if `http_requests_total` > 10 in 1 minute.
- Write a **Python script** that:
  - Polls Prometheus Alertmanager API
  - Prints:  
    ```bash
    ALERT: High traffic
    ```
    when the alert is active.

---

## 5️⃣ Bonus (Optional 🌟)
- Add **Grafana dashboards** to visualize requests hitting your Flask app.
- Deploy an **Ingress Controller** (nginx ingress) instead of NodePort.
- Push your Docker image to **DockerHub** and pull it in your K8s manifests.
- Write a **Makefile** with shortcuts:  
  - `make build` → build Docker image  
  - `make deploy` → deploy to K8s  
  - `make monitor` → run monitoring script  

---

## ✅ Verification
1. Deploy the app and send test traffic:
   ```bash
   curl http://<service-ip>:<port>/healthz