# Kubernetes Project 04 - Labels & Selectors

## 📌 Objective

Learn how to use Kubernetes Labels and Selectors to organize, identify, and filter Pods.

---

## 📂 Project Files

- nginx-dev.yaml
- nginx-prod.yaml
- redis-prod.yaml

---

## 🚀 Create Pods

```bash
kubectl apply -f nginx-dev.yaml
kubectl apply -f nginx-prod.yaml
kubectl apply -f redis-prod.yaml
```

---

## 📋 Verify Pods

```bash
kubectl get pods
```

---

## 🏷 Show Labels

```bash
kubectl get pods --show-labels
```

---

## ➕ Add Label

```bash
kubectl label pod nginx-dev team=devops
```

---

## ✏️ Update Label

```bash
kubectl label pod nginx-dev env=prod --overwrite
```

---

## ❌ Delete Label

```bash
kubectl label pod nginx-dev team-
```

---

## 🔍 Select Pods by Label

Get all nginx Pods

```bash
kubectl get pods -l app=nginx
```

Get all production Pods

```bash
kubectl get pods -l env=prod
```

Get nginx production Pods

```bash
kubectl get pods -l app=nginx,env=prod
```

Get all Pods except redis

```bash
kubectl get pods -l app!=redis
```

Set-based selector

```bash
kubectl get pods -l 'app in (nginx,redis)'
```

---

## 📚 Concepts Learned

- Kubernetes Labels
- Label Selectors
- Equality Selectors
- Set-based Selectors
- Add Labels
- Update Labels
- Delete Labels
- Filter Pods using Labels

---

## 🛠 Technologies Used

- Kubernetes
- kubectl
- Minikube
- YAML

---

## 👩‍💻 Author

Muskan Patel
