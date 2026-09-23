# 🚀 Custom Helm Chart for Node.js REST API

A hands-on Kubernetes and Helm project demonstrating how to create a **custom Helm chart from scratch** and deploy a Dockerized Node.js REST API to a local Kubernetes cluster using **Minikube**.

The project covers Helm chart creation, templating, Docker image integration, Kubernetes deployment, service exposure, troubleshooting, Helm upgrades, scaling, release history, and chart packaging.

---

## 📌 Project Overview

In this project, a simple Node.js REST API is:

1. Containerized using Docker
2. Loaded into Minikube
3. Deployed to Kubernetes using a custom Helm chart
4. Exposed internally using a Kubernetes ClusterIP Service
5. Scaled using Helm
6. Versioned and managed using Helm release history
7. Packaged as a Helm chart

### Architecture

```text
                ┌─────────────────────┐
                │    Node.js REST API │
                │       Port 3000     │
                └──────────┬──────────┘
                           │
                           ▼
                    ┌─────────────┐
                    │    Docker   │
                    │ nodejs-api:v1│
                    └──────┬──────┘
                           │
                    minikube image load
                           │
                           ▼
              ┌──────────────────────────┐
              │       Minikube           │
              │     Kubernetes Cluster   │
              │                          │
              │  ┌────────────────────┐  │
              │  │ Helm Deployment    │  │
              │  │                    │  │
              │  │ Pod 1              │  │
              │  │ Pod 2              │  │
              │  │ Pod 3              │  │
              │  └─────────┬──────────┘  │
              │            │             │
              │            ▼             │
              │   ClusterIP Service      │
              └──────────────────────────┘
```

---

## 🛠️ Tech Stack

| Technology | Purpose                    |
| ---------- | -------------------------- |
| Kubernetes | Container orchestration    |
| Helm       | Kubernetes package manager |
| Miniku     |                            |

