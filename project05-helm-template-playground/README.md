# Helm Template Playground 🚀

A hands-on Helm project focused on learning Helm templating and managing Kubernetes applications using dynamic values, conditional rendering, loops, Helm releases, upgrades, and rollbacks.

## 📌 Project Overview

This project demonstrates how Helm can be used to create dynamic Kubernetes manifests instead of maintaining completely static YAML files.

The project focuses on three important Helm templating concepts:

- `if / else` — conditional rendering
- `with` — changing the template context
- `range` — iterating over key-value pairs

The project also covers the basic Helm application lifecycle:

```text
Helm Chart
    ↓
values.yaml
    ↓
Helm Templates
    ↓
helm template
    ↓
Kubernetes Manifests
    ↓
helm install
    ↓
helm upgrade
    ↓
helm rollback
```

---

## 🛠️ Technologies Used

- Kubernetes
- Helm
- Minikube
- Docker
- Nginx
- YAML
- Linux / WSL

---

## 📁 Project Structure

```text
project05-helm-template-playground/
│
├── Chart.yaml
├── values.yaml
├── README.md
│
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    └── configmap.yaml
```

### Chart.yaml

Contains Helm chart metadata such as:

- Chart name
- Chart version
- Application version
- Chart type

### values.yaml

Contains configurable values used by the Helm templates.

Example:

```yaml
replicaCount: 2

image:
  repository: nginx
  tag: "1.27"

service:
  enabled: true
  type: ClusterIP
  port: 80

app:
  name: helm-playground
  environment: dev
```

---

# 🧠 Helm Templating Concepts

## 1. `if / else`

The `if` statement is used to conditionally render Kubernetes resources.

Example:

```gotemplate
{{- if .Values.service.enabled }}
...
{{- else }}
...
{{- end }}
```

When:

```yaml
service:
  enabled: true
```

the Service is rendered.

When:

```yaml
service:
  enabled: false
```

the Service is not rendered.

Test:

```bash
helm template myapp . --set service.enabled=false
```

---

## 2. `with`

The `with` statement changes the current template context.

Example:

```gotemplate
{{- with .Values.app }}
...
{{ .name }}
{{ .environment }}
{{- end }}
```

Instead of repeatedly writing:

```text
.Values.app.name
.Values.app.environment
```

inside the block, we can use:

```text
.name
.environment
```

---

## 3. `range`

The `range` statement is used to iterate over lists or maps.

Example:

```gotemplate
{{- range $key, $value := .Values.extraLabels }}
{{ $key }}: {{ $value }}
{{- end }}
```

Given:

```yaml
extraLabels:
  team: devops
  project: helm-playground
  owner: platform
```

Helm dynamically renders:

```yaml
team: devops
project: helm-playground
owner: platform
```

Adding another label does not require modifying the template.

---

# 🔥 Combining `if`, `with`, and `range`

The project also demonstrates how these concepts can be combined.

The ConfigMap uses:

```text
if
 ↓
with
 ↓
range
```

Conceptually:

```text
config.enabled
      ↓
     if
      ↓
config.data
      ↓
    with
      ↓
key/value pairs
      ↓
    range
```

This allows the ConfigMap to be enabled/disabled dynamically and allows additional configuration entries to be added without changing the template.

---

# 🔍 Helm Template Rendering

Before installing the application, the templates were rendered locally using:

```bash
helm template myapp .
```

This converts Helm templates into standard Kubernetes YAML.

Debug rendering was also tested using:

```bash
helm template myapp . --debug
```

### Important difference

```text
helm template
    ↓
renders YAML locally
```

It does not deploy anything to Kubernetes.

---

# ✅ Helm Validation

The chart was validated using:

```bash
helm lint .
```

Expected result:

```text
1 chart(s) linted, 0 chart(s) failed
```

---

# 🚀 Helm Installation

The chart was installed into a Minikube Kubernetes cluster using:

```bash
helm install myapp .
```

The release was verified using:

```bash
helm list
```

Kubernetes resources were checked using:

```bash
kubectl get pods
kubectl get deployment
kubectl get service
kubectl get configmap
```

---

# 🔄 Helm Upgrade

The project demonstrated upgrading an existing Helm release.

Initial configuration:

```yaml
replicaCount: 2
```

The value was changed to:

```yaml
replicaCount: 3
```

The rendered configuration was verified:

```bash
helm template myapp .
```

Then the existing release was upgraded:

```bash
helm upgrade myapp .
```

The Kubernetes deployment was verified:

```bash
kubectl get deployment
```

The deployment changed from:

```text
2/2
```

to:

```text
3/3
```

---

# ↩️ Helm Rollback

Helm release history was inspected using:

```bash
helm history myapp
```

The release was rolled back to an earlier revision using:

```bash
helm rollback myapp 1
```

The Kubernetes deployment was then verified:

```bash
kubectl get deployment
```

This demonstrated how Helm can restore a previous release configuration.

---

# 🔎 Useful Helm Commands Learned

```bash
helm lint .
```

Validate a Helm chart.

```bash
helm template myapp .
```

Render templates locally.

```bash
helm template myapp . --debug
```

Render templates with debugging information.

```bash
helm install myapp .
```

Install a new Helm release.

```bash
helm list
```

List Helm releases.

```bash
helm upgrade myapp .
```

Upgrade an existing release.

```bash
helm history myapp
```

View release history.

```bash
helm rollback myapp 1
```

Rollback to a previous revision.

```bash
helm status myapp
```

View release status.

```bash
helm get values myapp --all
```

View values used by the release.

```bash
helm get manifest myapp
```

View the rendered manifest of the installed release.

```bash
helm uninstall myapp
```

Remove the Helm release.

---

# 🎯 What I Learned

Through this project, I practiced:

- Helm chart structure
- `Chart.yaml`
- `values.yaml`
- `.Values`
- Helm template syntax
- `if / else`
- `with`
- `range`
- Dynamic Kubernetes manifests
- ConfigMaps
- Kubernetes Deployments
- Kubernetes Services
- `helm template`
- `helm template --debug`
- `helm lint`
- `helm install`
- `helm upgrade`
- `helm history`
- `helm rollback`
- `helm status`
- `helm get`
- Helm release lifecycle

---

# 📸 Project Evidence

The project was tested using Minikube and the following Helm/Kubernetes operations were verified:

- Helm chart validation
- Template rendering
- Conditional Service rendering
- Dynamic ConfigMap rendering
- Dynamic labels using `range`
- Kubernetes deployment
- Helm upgrade
- Replica scaling from 2 to 3
- Helm rollback
- Kubernetes resource verification

---

# 🚀 Future Improvements

Possible extensions for this project:

- Add Helm helper templates using `_helpers.tpl`
- Add named templates
- Add `include`
- Add `required`
- Add `default`
- Add `tpl`
- Add multiple values files such as `values-dev.yaml` and `values-prod.yaml`
- Add Ingress
- Add resource requests and limits
- Add ConfigMap and Secret management
- Add Helm hooks
- Add CI/CD pipeline for Helm deployment

---

## 👩‍💻 Author

**Muskan Patel**

Hands-on Kubernetes & Helm learning project focused on DevOps skills and production-oriented Kubernetes workflows.
