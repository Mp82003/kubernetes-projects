# Kubernetes Pod Basics

## 📖 Overview

This repository contains hands-on practice for Kubernetes Pods. It covers Pod creation, inspection, troubleshooting, YAML generation, logging, execution inside containers, labels, and other commonly used `kubectl` commands.

The purpose of this lab is to build a strong Kubernetes foundation through practical exercises and command-line practice.

---

## 🎯 Objectives

* Understand what a Pod is
* Create Pods using CLI and YAML
* Generate Pod manifests
* Inspect running Pods
* Execute commands inside a Pod
* View Pod logs
* Work with Pod labels
* Practice important `kubectl` commands for Kubernetes administration

---

## 🛠️ Prerequisites

* Kubernetes Cluster (Minikube)
* kubectl
* Docker
* Linux Terminal

---

## 📂 Project Structure

```text
.
├── README.md
├── pod.yaml
├── pod-backup.yaml
└── screenshots/
```

---

## 🚀 Commands Practiced

### Create Pod

```bash
kubectl run nginx --image=nginx
kubectl run port-nginx --image=nginx --port=80
```

### Generate YAML

```bash
kubectl run pod-yaml --image=nginx --dry-run=client -o yaml
kubectl run pod-yaml --image=nginx --dry-run=client -o yaml > pod.yaml
```

### Create Pod from YAML

```bash
kubectl apply -f pod.yaml
kubectl create -f pod.yaml
```

### View Pods

```bash
kubectl get pods
kubectl get po
kubectl get pods -A
kubectl get pods -o wide
kubectl get pods -w
kubectl get pods -o yaml
kubectl get pods -o json
```

### Describe Pod

```bash
kubectl describe pod nginx
kubectl describe po nginx
```

### View Logs

```bash
kubectl logs nginx
kubectl logs -f nginx
kubectl logs -p nginx
```

### Execute Commands

```bash
kubectl exec -it nginx -- /bin/sh
kubectl exec nginx -- ls
```

### Delete Pod

```bash
kubectl delete pod pod-yaml
kubectl delete pods --all
```

### Explain YAML

```bash
kubectl explain pod
kubectl explain pod.spec
kubectl explain pod.spec.containers
kubectl explain pod --recursive
```

### Events

```bash
kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp
```

### Labels

```bash
kubectl get pods --show-labels
kubectl get pod nginx --show-labels
kubectl get pods -l run=nginx
```

### Pod Information

```bash
kubectl get pods -o name
kubectl get pod nginx -o jsonpath='{.status.podIP}'
kubectl get pod nginx -o jsonpath='{.spec.nodeName}'
kubectl get pod nginx -o jsonpath='{.spec.containers[*].image}'
kubectl get pod nginx -o jsonpath='{.status.phase}'
kubectl get pod nginx -o yaml > pod-backup.yaml
```

### Port Forward

```bash
kubectl port-forward pod/nginx 8080:80
```

---


## 📚 Key Learnings

* Created Pods using both CLI and YAML
* Generated Pod manifests using `--dry-run`
* Applied YAML configurations using `kubectl apply`
* Inspected Pod details using `kubectl describe`
* Viewed application logs
* Executed commands inside running containers
* Used labels and selectors
* Retrieved Pod information using JSONPath
* Performed basic Pod troubleshooting using events

---

## 🏷️ Tech Stack

* Kubernetes
* kubectl
* Minikube
* Docker
* YAML
* Linux

---

## 👨‍💻 Author

**Muskan Patel**

Learning Kubernetes through hands-on practice and building a complete Kubernetes learning series.

