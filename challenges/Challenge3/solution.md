# ⚡ DevOps Challenge Solution #3

## 🎯 Goal
Deploy a simple **Python Flask application** to a **local Kubernetes cluster (kind or minikube)**, monitor it with **Prometheus + Grafana**, and add a custom **alerting script**.
```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Simple hello world program!"

@app.route("/health")
def health_check():
    return "I am alive and kicking!"
```
## Build dockerfile using:
```commandline
#To build the image use
docker build -t sidharthpai/challenge3-flaskapp .
# To run the image use
docker run -itd -p 8080:80 sidharthpai/challenge3-flaskapp 
```
## Install the helm chart using command:
```commandline
helm install app python-flask
#Upgrade the release using
helm upgrade app python-flask
```
---

## 1️⃣ Infra Setup
- Use **kind** (Kubernetes in Docker) or **minikube** to create a local K8s cluster.
- Install **Helm** if not already installed.
```commandline
#install kind in the local
kind cluster create --name multi-node-cluster --config=kind-config.yaml

#install metric server in local which hpa will use
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

#Once this is running we will need to edit the deployment
sidharth@Sidharths-MacBook-Air Challenge3 % k get po -n kube-system| grep metrics-server

#Add the below line
- --kubelet-insecure-tls

#Sample:
containers:
- name: metrics-server
  image: registry.k8s.io/metrics-server/metrics-server:v0.8.0
  args:
    - --cert-dir=/tmp
    - --secure-port=4443
    - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
    - --kubelet-insecure-tls


```

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