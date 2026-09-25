# 🚀 Helm Functions & Helpers Lab

A hands-on Helm project focused on using Helm template functions and reusable helper templates to build cleaner, safer, and more maintainable Kubernetes manifests.

## 📌 Project Overview

This project demonstrates commonly used Helm template functions and helper templates:

* `default`
* `quote`
* `required`
* `toYaml`
* `nindent`
* `include`
* `_helpers.tpl`

The project uses an Nginx Deployment as the Kubernetes workload and demonstrates how Helm values are transformed into final Kubernetes YAML manifests.

---

## 🎯 Why This Project?

In real-world Helm charts, templates should not rely on hard-coded values or repeated configuration.

Helm functions help with:

* Providing fallback values
* Handling string values safely
* Validating mandatory configuration
* Converting Helm objects into YAML
* Maintaining correct YAML indentation
* Reusing common template logic
* Reducing duplication across Kubernetes manifests

This project builds the foundation required for writing production-style Helm charts.

---

## 🏗️ Project Flow

```text
values.yaml
     │
     ▼
Helm Template Functions
     │
     ├── default
     ├── quote
     ├── required
     ├── toYaml
     ├── nindent
     └── include
     │
     ▼
_helpers.tpl
     │
     ▼
Kubernetes Deployment Template
     │
     ▼
helm template
     │
     ▼
Rendered Kubernetes YAML
     │
     ▼
helm install
     │
     ▼
Kubernetes Cluster
```

---

## 📁 Project Structure

```text
helm-functions/
│
├── Chart.yaml
├── values.yaml
├── .helmignore
│
└── templates/
    ├── _helpers.tpl
    └── deployment.yaml
```

### Important Files

| File              | Purpose                              |
| ----------------- | ------------------------------------ |
| `Chart.yaml`      | Helm chart metadata                  |
| `values.yaml`     | Configurable chart values            |
| `deployment.yaml` | Kubernetes Deployment template       |
| `_helpers.tpl`    | Reusable Helm helper templates       |
| `.helmignore`     | Files excluded from the Helm package |

---

# 🔧 Helm Functions Demonstrated

## 1. `default`

Provides a fallback value when a value is empty or not provided.

```yaml
replicas: {{ default 1 .Values.replicaCount }}
```

If:

```yaml
replicaCount: 2
```

the output is:

```yaml
replicas: 2
```

If the value is empty:

```yaml
replicaCount:
```

the fallback is used:

```yaml
replicas: 1
```

### Purpose

Useful for providing safe default configuration values.

---

## 2. `quote`

Renders a value as a quoted string.

```yaml
value: {{ .Values.environment | quote }}
```

Input:

```yaml
environment: production
```

Rendered output:

```yaml
value: "production"
```

### Purpose

Useful when rendering string values such as environment variables.

---

## 3. `required`

Ensures that a mandatory value is provided.

```yaml
value: {{ required "databaseHost is required" .Values.databaseHost | quote }}
```

If the value is missing:

```yaml
databaseHost: ""
```

Helm stops rendering and reports:

```text
databaseHost is required
```

### Purpose

Prevents incomplete configuration from being rendered or deployed.

---

## 4. `toYaml`

Converts a Helm object/map into YAML.

Example:

```yaml
resources:
  limits:
    cpu: 500m
    memory: 128Mi
```

Template:

```yaml
{{ toYaml .Values.resources }}
```

### Purpose

Useful for rendering nested configuration such as:

* Resources
* Annotations
* Labels
* Environment configuration

---

## 5. `nindent`

Adds a newline and indentation to rendered content.

Used together with `toYaml`:

```yaml
resources:
  {{- toYaml .Values.resources | nindent 12 }}
```

Rendered result:

```yaml
resources:
  limits:
    cpu: 500m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 64Mi
```

### Purpose

Ensures generated YAML has the correct indentation.

---

## 6. `include`

Allows a reusable helper template to be inserted into another template.

Helper:

```yaml
{{- define "helm-functions.labels" }}
app: {{ .Values.appName }}
environment: {{ .Values.environment }}
{{- end }}
```

Used in Deployment:

```yaml
labels:
  {{- include "helm-functions.labels" . | nindent 8 }}
```

Rendered result:

```yaml
labels:
  app: helm-functions
  environment: production
```

### Purpose

Reduces duplication and promotes reusable Helm templates.

---

# 🧩 `_helpers.tpl`

The project uses `_helpers.tpl` to define reusable labels:

```yaml
{{/*
Create common labels.
*/}}
{{- define "helm-functions.labels" }}
app: {{ .Values.appName }}
environment: {{ .Values.environment }}
{{- end }}
```

The helper is reused with:

```yaml
{{- include "helm-functions.labels" . | nindent 8 }}
```

This follows the **DRY (Don't Repeat Yourself)** principle.

---

# ⚙️ Configuration

Current `values.yaml`:

```yaml
replicaCount: 2

image:
  repository: nginx
  tag: "1.27"

appName: helm-functions
environment: production
databaseHost: postgres.default.svc.cluster.local

service:
  type: ClusterIP
  port: 80

resources:
  limits:
    cpu: 500m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 64Mi

annotations:
  team: devops
  project: helm-functions
```

---

# 🚀 How to Run

## 1. Clone the repository

```bash
git clone <repository-url>
cd helm-functions
```

## 2. Validate the chart

```bash
helm lint .
```

Expected:

```text
1 chart(s) linted, 0 chart(s) failed
```

---

## 3. Render the templates

```bash
helm template helm-functions .
```

This renders the Helm templates into Kubernetes YAML without deploying anything.

---

## 4. Perform a dry run

```bash
helm install helm-functions . --dry-run
```

This allows the chart to be tested before creating the actual release.

---

## 5. Install the chart

```bash
helm install helm-functions .
```

---

## 6. Verify the Helm release

```bash
helm list
```

---

## 7. Verify the Deployment

```bash
kubectl get deployment
```

---

## 8. Verify the Pods

```bash
kubectl get pods
```

Expected:

```text
helm-functions-xxxxx   1/1   Running
helm-functions-yyyyy   1/1   Running
```

---

## 9. Remove the Helm release

```bash
helm uninstall helm-functions
```

---

# 🧪 Testing Performed

The following scenarios were tested:

### Default Function

```text
replicaCount = 2
        ↓
replicas: 2
```

Fallback:

```text
replicaCount = empty
        ↓
default 1
        ↓
replicas: 1
```

### Quote Function

```text
production
     ↓
"production"
```

### Required Function

Missing value:

```text
databaseHost = empty
        ↓
Helm rendering fails
        ↓
databaseHost is required
```

Valid value:

```text
databaseHost = postgres.default.svc.cluster.local
        ↓
Successful rendering
```

### toYaml + nindent

Nested resource configuration was converted into correctly indented Kubernetes YAML.

### Include

Common labels were defined once in `_helpers.tpl` and reused inside the Deployment template.

---

# 📸 Project Screenshots

| Screenshot                         | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| `01-default-function-output.png`   | Default function with configured replica count |
| `02-default-fallback.png`          | Default fallback behavior                      |
| `03-default-value-restored.png`    | Restored configured value                      |
| `04-quote-function-output.png`     | Quote function rendering                       |
| `05-required-function-error.png`   | Required function validation failure           |
| `06-required-function-success.png` | Required function successful rendering         |
| `07-toyaml-nindent-output.png`     | `toYaml` and `nindent` output                  |
| `08-include-helper-output.png`     | Reusable helper with `include`                 |
| `09-helm-lint-success.png`         | Helm lint validation                           |
| `10-final-helm-template.png`       | Final rendered Kubernetes manifest             |
| `11-helm-dry-run-success.png`      | Helm dry-run validation                        |
| `12-helm-install-kubernetes.png`   | Helm installation and Kubernetes verification  |
| `13-final-project-structure.png`   | Final project structure                        |

---

# 🧠 Key Learnings

After completing this project, I learned how to:

* Use Helm template functions
* Provide fallback configuration using `default`
* Render strings using `quote`
* Validate mandatory values using `required`
* Convert Helm objects into YAML using `toYaml`
* Maintain YAML indentation using `nindent`
* Create reusable helper templates
* Use `_helpers.tpl`
* Reuse helpers with `include`
* Validate Helm charts using `helm lint`
* Render templates using `helm template`
* Perform Helm dry runs
* Deploy and verify Helm releases on Kubernetes

---

# 💼 Interview Questions

### 1. What is the purpose of `default` in Helm?

`default` provides a fallback value when the supplied value is empty or not provided.

### 2. What does `required` do?

`required` ensures that a mandatory value is provided. If the value is missing or empty, Helm returns an error.

### 3. What is `_helpers.tpl`?

`_helpers.tpl` contains reusable named Helm templates that can be used across multiple Kubernetes manifests.

### 4. What is the difference between `include` and `define`?

`define` creates a named helper template, while `include` renders that helper template at another location.

### 5. Why is `nindent` commonly used with `toYaml`?

`toYaml` converts an object into YAML, while `nindent` ensures the generated YAML is correctly indented at its destination.

### 6. Why use Helm functions instead of hard-coding values?

They make charts reusable, configurable, maintainable, and safer.

### 7. What is the purpose of `helm template`?

It renders Helm templates locally into Kubernetes manifests without installing them into a cluster.

### 8. What is the purpose of `helm lint`?

It checks the Helm chart for common structural and configuration problems before deployment.

---

# 🏆 Project Outcome

This project demonstrates the ability to create cleaner and more maintainable Helm templates using built-in functions and reusable helper templates.

The project provides a foundation for moving from basic Helm charts toward more advanced and production-oriented Helm deployments.

---

## 🛠️ Technologies Used

* Kubernetes
* Helm
* Helm Templates
* YAML
* Nginx
* Minikube
* Linux / WSL

---

## 👨‍💻 Skills Demonstrated

```text
Helm
├── Values
├── Template Functions
│   ├── default
│   ├── quote
│   ├── required
│   ├── toYaml
│   └── nindent
│
├── Template Helpers
│   ├── define
│   └── include
│
├── Chart Validation
│   ├── helm lint
│   └── helm template
│
└── Kubernetes Deployment
    ├── Helm Install
    ├── Deployment
    └── Pod Verification
```

