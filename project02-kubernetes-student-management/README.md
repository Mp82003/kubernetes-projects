# 🚀 Project 02 — Kubernetes Student Management Platform

A hands-on Kubernetes project designed to practice and strengthen core Kubernetes concepts by building and operating a containerized Student Management Platform.

The project focuses on Kubernetes resources, networking, configuration management, persistent storage, health checks, scaling, rolling updates, rollbacks, and node-level workloads.

---

## 🏗️ Architecture

```text
                         Browser
                            |
                            v
                  +-------------------+
                  | Frontend Service  |
                  |     NodePort      |
                  |      :30080       |
                  +---------+---------+
                            |
                            v
                +----------------------+
                |   Frontend Pods      |
                |    Nginx x2          |
                +----------+-----------+
                           |
                           | Kubernetes DNS
                           v
                +----------------------+
                |   MySQL Service      |
                |      ClusterIP       |
                |       :3306          |
                +----------+-----------+
                           |
                           v
                +----------------------+
                |     MySQL Pod        |
                +----------+-----------+
                           |
                           v
                     +-----------+
                     |   PVC     |
                     |   1Gi     |
                     +-----------+

        ConfigMap  ---> Application Configuration
        Secret     ---> Database Credentials
        DaemonSet  ---> Node-level Monitoring Workload


project02-kubernetes-student-management/
│
├── README.md
├── namespace.yaml
├── pod.yaml
├── deployment.yaml
├── service.yaml
├── configmap.yaml
├── secret.yaml
├── mysql-deployment.yaml
├── mysql-service.yaml
├── pvc.yaml
├── daemonset.yaml
│
└── screenshots/
    ├── 1-namespce.png
    ├── 2-lebel&selectors.png
    ├── 3-deployemnt.png
    ├── 4-services.png
    ├── 5-nginxpage.png
    ├── 6-nginx working.png
    ├── 7-configMap.png
    ├── 8-configMap pods.png
    ├── 9-pvc.png
    ├── 10-mysql service.png
    ├── 11-liveness-pods.png
    ├── 12-liveness-readness.png
    ├── 13-rollback.png
    ├── 14-rollaback update.png
    └── 15-daemonset.png

Kubernetes Student Management Platform is a hands-on Kubernetes project that demonstrates how to deploy and manage a containerized application using core Kubernetes concepts. The project includes Deployments, Services, ConfigMaps, Secrets, Persistent Storage (PVC), MySQL, Health Probes, Resource Management, Scaling, Rolling Updates, Rollbacks, and DaemonSets, with Kubernetes DNS used for internal service discovery.

Tech Stack: Kubernetes, Minikube, Docker, Nginx, MySQL, kubectl, YAML, WSL.
