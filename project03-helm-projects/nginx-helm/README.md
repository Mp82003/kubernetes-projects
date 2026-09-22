# Nginx Deployment Using Helm

A beginner-friendly Kubernetes project demonstrating how to package, deploy, upgrade, and rollback an Nginx application using **Helm**.

## 📌 Project Overview

In this project, I deployed an Nginx web server on Kubernetes using a Helm Chart.

The project covers the basic Helm workflow:

**Create → Configure → Template → Install → Upgrade → Rollback**

## 🛠️ Technologies Used

* Kubernetes
* Helm 3
* Nginx
* Minikube
* Docker
* Ubuntu WSL

## 📁 Project Structure

```text
nginx-helm/
├── Chart.yaml
├── values.yaml
├── charts/
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── hpa.yaml
│   ├── serviceaccount.yaml
│   ├── _helpers.tpl
│   └── tests/
└── .helmignore
```

## ⚙️ Helm Concepts Practiced

### 1. Chart.yaml

Contains metadata about the Helm chart.

Important fields:

```yaml
name: nginx-helm
version: 0.1.0
appVersion: "1.16.0"
```

* `version` → Helm chart version
* `appVersion` → application version

### 2. values.yaml

Contains configurable values used by the Helm templates.

Example:

```yaml
replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: ""

service:
  type: ClusterIP
  port: 80
```

### 3. Helm Templates

The templates use values from `values.yaml`.

Example:

```yaml
replicas: {{ .Values.replicaCount }}
```

Helm renders these templates into standard Kubernetes YAML manifests.

## 🚀 Deployment

Create the Helm chart:

```bash
helm create nginx-helm
```

Validate the generated Kubernetes manifests:

```bash
helm template nginx-app .
```

Install the application:

```bash
helm install nginx-app .
```

Check the Helm release:

```bash
helm list
```

Check the pods:

```bash
kubectl get pods -l app.kubernetes.io/instance=nginx-app
```

Check the service:

```bash
kubectl get svc -l app.kubernetes.io/instance=nginx-app
```

## 🌐 Access Nginx

The service uses `ClusterIP`, so it can be accessed locally using port forwarding:

```bash
kubectl port-forward svc/nginx-app-nginx-helm 8080:80
```

Then open:

```text
http://localhost:8080
```

## 🔄 Helm Upgrade

I changed the replica count in `values.yaml`:

```yaml
replicaCount: 3
```

Then upgraded the release:

```bash
helm upgrade nginx-app .
```

Verify the replicas:

```bash
kubectl get pods -l app.kubernetes.io/instance=nginx-app
```

This demonstrates how Helm manages changes to an existing Kubernetes deployment.

## ⏪ Helm Rollback

View the release history:

```bash
helm history nginx-app
```

Rollback to a previous revision:

```bash
helm rollback nginx-app 1
```

Verify the current release:

```bash
helm history nginx-app
```

Important observation:

Helm does not delete the revision history during rollback. Instead, it creates a new revision containing the configuration of the selected previous revision.

## 📊 Helm Release Lifecycle

```text
        Helm Chart
             │
             ▼
      helm install
             │
             ▼
       Revision 1
             │
             ▼
      helm upgrade
             │
             ▼
       Revision 2
             │
             ▼
      helm rollback
             │
             ▼
   New Revision Created
```

## 🎯 What I Learned

* Helm Chart structure
* `Chart.yaml`
* `values.yaml`
* Helm templates
* Helm template rendering
* Helm installation
* Helm releases
* Helm upgrades
* Helm revision history
* Helm rollback
* Kubernetes Services
* Kubernetes Deployments
* Port forwarding

## 🔍 Useful Commands

```bash
helm version
helm create nginx-helm
helm template nginx-app .
helm install nginx-app .
helm list
helm status nginx-app
helm get values nginx-app
helm history nginx-app
helm upgrade nginx-app .
helm rollback nginx-app 1
helm uninstall nginx-app
```

## 👨‍💻 Project Purpose

This project is part of my hands-on **DevOps and Kubernetes learning journey**, focusing on understanding Helm before moving toward more advanced topics such as:

* Custom Helm charts
* Multiple environments
* ConfigMaps and Secrets
* Helm dependencies
* Helm with CI/CD
* Helm deployment on AWS EKS
* GitOps workflows

