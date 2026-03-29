## Step 1: Install nginx using Helm
------------
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-nginx bitnami/nginx
```
### Step 2: Add values.yaml and overwrite the existing deployment yaml
```yaml
replicas: 1

resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 200m
    memory: 192Mi
```
Create a values.yaml file and then apply using that values.yaml file
```cmd
helm upgrade my-nginx bitnami/nginx --values values.yaml
```

This is how the yaml would looks like:
```
sidharth@Sidharths-MacBook-Air Challenge5 % k get po                                                
NAME                        READY   STATUS    RESTARTS   AGE
my-nginx-5d9b6c49dc-lgk2c   1/1     Running   0          13m
sidharth@Sidharths-MacBook-Air Challenge5 % k describe po 
Name:             my-nginx-5d9b6c49dc-lgk2c
Namespace:        default
Priority:         0
Service Account:  my-nginx
Node:             single-node-control-plane/172.18.0.2
Start Time:       Sun, 29 Mar 2026 15:43:55 +0530
Labels:           app.kubernetes.io/instance=my-nginx
                  app.kubernetes.io/managed-by=Helm
                  app.kubernetes.io/name=nginx
                  app.kubernetes.io/version=1.29.4
                  helm.sh/chart=nginx-22.4.3
                  pod-template-hash=5d9b6c49dc
Annotations:      <none>
Status:           Running
IP:               10.244.0.22
IPs:
  IP:           10.244.0.22
Controlled By:  ReplicaSet/my-nginx-5d9b6c49dc
Init Containers:
  preserve-logs-symlinks:
    Container ID:    containerd://c15a3c2efd00188e01eab03b897026cb64c16003504d58b2c17c04344c9cd2ff
    Image:           registry-1.docker.io/bitnami/nginx:latest
    Image ID:        registry-1.docker.io/bitnami/nginx@sha256:0395d4f646e90a60ccbe484078470e9fd26f7d4eabe20323135f70367ce443eb
    Port:            <none>
    Host Port:       <none>
    SeccompProfile:  RuntimeDefault
    Command:
      /bin/bash
    Args:
      -ec
      #!/bin/bash
      . /opt/bitnami/scripts/libfs.sh
      # We copy the logs folder because it has symlinks to stdout and stderr
      if ! is_dir_empty /opt/bitnami/nginx/logs; then
        cp -r /opt/bitnami/nginx/logs /emptydir/app-logs-dir
      fi
      
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Sun, 29 Mar 2026 15:43:55 +0530
      Finished:     Sun, 29 Mar 2026 15:43:55 +0530
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     200m
      memory:  192Mi
    Requests:
      cpu:     100m
      memory:  128Mi
```

## Step 3:Install metrics server in kind locak

```yaml
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
Once installed patch it as it would crash in kind cluster

```yaml
kubectl patch deployment metrics-server -n kube-system \
  --type='json' \
  -p='[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
```
## Step 4: Run load test on the nginx deployment endpoint(http://<svc-name>)
This url would not work on browser if u need to access the url on browser use port-forward:

```
k port-forward svc/my-nginx 8080:80
```
Once this is done run the below command to provide stress to the service:
```
while true; do
  kubectl run ab \
    --image=jordi/ab \
    --restart=Never \
    --rm -i -- \
    -t 600 -c 100 http://my-nginx/
done
```
Once you do this it runs infinite loop and tests this urls. This increase the cpu utilization of the deployment.
As you can see that when the cpu utilization went above the pod stated spinning up on the cluster.This shows that hpa is working as expected
```yaml
sidharth@Sidharths-MacBook-Air DevOps-challenges % k get hpa -w
NAME       REFERENCE             TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
my-nginx   Deployment/my-nginx   1%/80%    1         5         2          55m
my-nginx   Deployment/my-nginx   35%/80%   1         5         2          55m
my-nginx   Deployment/my-nginx   73%/80%   1         5         2          55m
my-nginx   Deployment/my-nginx   59%/80%   1         5         2          56m
my-nginx   Deployment/my-nginx   77%/80%   1         5         2          56m
my-nginx   Deployment/my-nginx   105%/80%   1         5         2          56m
my-nginx   Deployment/my-nginx   70%/80%    1         5         3          56m
my-nginx   Deployment/my-nginx   107%/80%   1         5         3          57m
my-nginx   Deployment/my-nginx   86%/80%    1         5         3          57m
my-nginx   Deployment/my-nginx   91%/80%    1         5         3          57m
my-nginx   Deployment/my-nginx   92%/80%    1         5         4          58m
my-nginx   Deployment/my-nginx   78%/80%    1         5         4          58m
my-nginx   Deployment/my-nginx   74%/80%    1         5         4          58m
my-nginx   Deployment/my-nginx   70%/80%    1         5         4          58m
my-nginx   Deployment/my-nginx   82%/80%    1         5         4          59m
my-nginx   Deployment/my-nginx   69%/80%    1         5         4          59m
my-nginx   Deployment/my-nginx   72%/80%    1         5         4          59m
my-nginx   Deployment/my-nginx   70%/80%    1         5         4          59m
my-nginx   Deployment/my-nginx   75%/80%    1         5         4          60m
my-nginx   Deployment/my-nginx   73%/80%    1         5         4          60m
```
Pods starts coming up in the cluster.

```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get po   
NAME                        READY   STATUS              RESTARTS   AGE
ab                          0/1     ContainerCreating   0          2s
my-nginx-5d9b6c49dc-7jjnd   1/1     Running             0          114s
my-nginx-5d9b6c49dc-d72h9   1/1     Running             0          39s
my-nginx-5d9b6c49dc-lgk2c   1/1     Running             0          77m
my-nginx-5d9b6c49dc-lll2g   1/1     Running             0          6m9s
```
## Scenario 1:
When cpu is not defined in values we get below error. Hence, HPA would not work

```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get hpa    
NAME       REFERENCE             TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
my-nginx   Deployment/my-nginx   <unknown>/80%   1         5         1          89m
```
## Scenario 2:
If replicas is set to 3 then pod will use hpa min replica during the normal phase where there is no load.
```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k describe po| grep -i "replica"
Controlled By:  ReplicaSet/my-nginx-574bd6fc4c
```

## Scenario 3:
If we keep max replica in hpa to 3 its a max cap and it will not be able to scale further
```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get hpa
NAME       REFERENCE             TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
my-nginx   Deployment/my-nginx   1%/80%    1         3         1          99m
```
## Sceanrio 4:
If metrics server itself is removed then hpa would have no understanding about how much is the current cpu utilization. Hence 

```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get po -n kube-system
NAME                                                READY   STATUS    RESTARTS   AGE
coredns-76f75df574-h279n                            1/1     Running   0          4h23m
coredns-76f75df574-tqwtk                            1/1     Running   0          4h23m
etcd-single-node-control-plane                      1/1     Running   0          4h23m
kindnet-b5856                                       1/1     Running   0          4h23m
kube-apiserver-single-node-control-plane            1/1     Running   0          4h23m
kube-controller-manager-single-node-control-plane   1/1     Running   0          4h23m
kube-proxy-sfwwb                                    1/1     Running   0          4h23m
kube-scheduler-single-node-control-plane            1/1     Running   0          4h23m
metrics-server-6db6cd6674-hzng7                     1/1     Running   0          50m
sidharth@Sidharths-MacBook-Air Challenge5 % k get po -n kube-system |grep -i "metrics"
metrics-server-6db6cd6674-hzng7                     1/1     Running   0          50m

sidharth@Sidharths-MacBook-Air Challenge5 % k get deploy -n kube-system
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
coredns          2/2     2            2           4h24m
metrics-server   1/1     1            1           52m
sidharth@Sidharths-MacBook-Air Challenge5 % k delete deploy metrics-server
Error from server (NotFound): deployments.apps "metrics-server" not found
sidharth@Sidharths-MacBook-Air Challenge5 % k delete deploy metrics-server -n kube-system
deployment.apps "metrics-server" deleted
```
Check the hpa after deletting metrics server
```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get hpa                                 
NAME       REFERENCE             TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
my-nginx   Deployment/my-nginx   <unknown>/80%   1         3         1          101m
```

Again install metrics server
```yaml
sidharth@Sidharths-MacBook-Air Challenge5 % k get po -n kube-system |grep -i "metrics"
metrics-server-6db6cd6674-r9n2r                     1/1     Running   0          25s

sidharth@Sidharths-MacBook-Air Challenge5 % k get hpa
NAME       REFERENCE             TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
my-nginx   Deployment/my-nginx   1%/80%    1         3         1          103m
```