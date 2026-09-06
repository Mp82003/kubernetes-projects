# Kubernetes Taints and Tolerations

## 📌 Project Overview

This project demonstrates how Kubernetes **Taints and Tolerations** control Pod scheduling and workload placement.

In this hands-on lab, a Kubernetes worker node is dedicated to a special workload using:

- Node Labels
- Node Taints
- Pod Tolerations
- `nodeSelector`

The goal is to prevent normal Pods from running on the dedicated node while allowing specially configured Pods to run there.

---

## 🏗️ Lab Setup

The project uses a 2-node Minikube cluster:

```text
Kubernetes Cluster
│
├── cka-taint-lab
│   └── Control Plane
│
└── cka-taint-lab-m02
    └── Worker Node
        ├── Label: dedicated=special
        └── Taint: dedicated=special:NoSchedule
