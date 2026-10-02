# Production-Ready Node.js Helm Chart

Production-style Kubernetes deployment of a Node.js application using Helm.

## Tech Stack

* Kubernetes
* Helm
* Docker
* Node.js
* Nginx Ingress
* Metrics Server
* HPA
* RBAC

## Features

* Helm templating and reusable helpers
* ConfigMap and Secret
* Liveness and Readiness probes
* CPU/Memory requests and limits
* PersistentVolumeClaim
* Nginx Ingress
* Horizontal Pod Autoscaler
* ServiceAccount, Role and RoleBinding
* Kubernetes SecurityContext
* Dev, Staging and Production values
* Helm Upgrade and Rollback
* Helm Test

## Environments

| Environment | Replicas | HPA      | Ingress                |
| ----------- | -------: | -------- | ---------------------- |
| Development |        1 | Disabled | Configurable           |
| Staging     |        2 | 2–4      | `nodejs-staging.local` |
| Production  |        3 | 3–5      | `nodejs-prod.local`    |

## Production Verification

Production deployment was verified with:

* 3/3 Pods Running
* Service available on port 3000
* Ingress configured with Nginx
* HPA configured for CPU utilization
* 1Gi PersistentVolumeClaim
* RBAC enabled
* Non-root container execution
* Resource requests and limits
* Successful Helm upgrade
* Successful Helm rollback
* Successful Helm test

## Useful Commands

```bash
helm lint .
helm upgrade --install node-app-prod . -f values-prod.yaml
helm history node-app-prod
helm rollback node-app-prod 1
helm test node-app-prod
kubectl get pods,svc,ingress,hpa
```

