# Project 06 — Helm Built-in Objects Lab

## Overview

This project demonstrates how Helm built-in objects can be used inside Kubernetes manifests.

The lab focuses on four important Helm built-in objects:

* `.Values`
* `.Release`
* `.Chart`
* `.Capabilities`

A Kubernetes ConfigMap is used to display information generated from these objects.

---

## Objectives

By completing this project, I learned how to:

* Use values from `values.yaml` with `.Values`
* Access Helm release information with `.Release`
* Access chart metadata with `.Chart`
* Access Kubernetes cluster information with `.Capabilities`
* Render Helm templates using `helm template`
* Validate charts using `helm lint`
* Install and upgrade Helm releases
* Understand Helm release revisions and history

---

## Project Structure

```text
project06-helm-built-in-objects/
└── built-in-objects/
    ├── Chart.yaml
    ├── values.yaml
    ├── README.md
    └── templates/
        └── info-configmap.yaml
```

---

## Helm Built-in Objects

### 1. `.Values`

`.Values` is used to access configuration values defined in `values.yaml`.

Example:

```yaml
appName: helm-built-in-objects
environment: dev
owner: devops
```

Template usage:

```yaml
{{ .Values.appName }}
{{ .Values.environment }}
{{ .Values.owner }}
```

---

### 2. `.Release`

`.Release` provides information about the current Helm release.

Examples:

```yaml
{{ .Release.Name }}
{{ .Release.Namespace }}
{{ .Release.Revision }}
```

In this project:

```text
Release Name: my-lab
Namespace: default
Revision: 2
```

The revision increased from `1` to `2` after performing a Helm upgrade.

---

### 3. `.Chart`

`.Chart` provides information about the current Helm chart.

Examples:

```yaml
{{ .Chart.Name }}
{{ .Chart.Version }}
{{ .Chart.AppVersion }}
```

Example output:

```text
Chart Name: built-in-objects
Chart Version: 0.1.0
```

---

### 4. `.Capabilities`

`.Capabilities` provides information about the Kubernetes environment where Helm is rendering the chart.

Examples:

```yaml
{{ .Capabilities.KubeVersion.Version }}
{{ .Capabilities.KubeVersion.Major }}
{{ .Capabilities.KubeVersion.Minor }}
```

Example:

```text
Kubernetes Version: v1.35.1
Major Version: 1
Minor Version: 35
```

---

## ConfigMap

The project creates:

```text
my-lab-info
```

The ConfigMap contains information from all four built-in objects.

Example:

```yaml
data:
  app-name: helm-built-in-objects
  environment: dev
  owner: devops
  release-name: my-lab
  release-namespace: default
  release-revision: "2"
  chart-name: built-in-objects
  chart-version: 0.1.0
  kube-version: v1.35.1
```

---

## Commands Used

### Create Helm chart

```bash
helm create built-in-objects
```

### Validate chart

```bash
helm lint .
```

### Render templates

```bash
helm template my-lab .
```

### Install release

```bash
helm install my-lab .
```

### List releases

```bash
helm list
```

### Check ConfigMap

```bash
kubectl get configmap my-lab-info -o yaml
```

### Upgrade release

```bash
helm upgrade my-lab .
```

### Check release history

```bash
helm history my-lab
```

### Check release status

```bash
helm status my-lab
```

---

## What I Learned

This project provided practical experience with Helm's built-in objects and showed how Helm templates dynamically receive information about:

```text
values.yaml
    ↓
.Values

Helm release
    ↓
.Release

Chart metadata
    ↓
.Chart

Kubernetes cluster
    ↓
.Capabilities
```

These objects are important when creating reusable and environment-aware Helm charts.

---

## Screenshots

Screenshots captured during the lab:

```text
01-helm-lint-success.png
02-helm-template-rendered-output.png
03-helm-install-release.png
04-helm-release-list.png
05-configmap-created.png
06-built-in-objects-configmap.png
07-values-yaml-custom-values.png
08-values-template-rendered.png
09-built-in-objects-final-configmap.png
10-helm-upgrade-revision-2.png
11-release-revision-2.png
12-helm-history.png
13-final-helm-status.png
```

---

## Key Interview Questions

### What is `.Values`?

`.Values` is used to access configuration values provided through `values.yaml`, command-line overrides, or other values sources.

### What is `.Release`?

`.Release` provides information about the current Helm release, such as release name, namespace, and revision.

### What is `.Chart`?

`.Chart` provides metadata about the current Helm chart, such as chart name and chart version.

### What is `.Capabilities`?

`.Capabilities` provides information about the Kubernetes cluster and available API capabilities during template rendering.

### What is `.Release.Revision`?

It represents the revision number of the Helm release. The revision changes when the release is installed, upgraded, or rolled back.

### Difference between `.Values` and `.Release`?

`.Values` contains chart configuration supplied by the user, while `.Release` contains information about the Helm release itself.

### Why use `.Capabilities`?

It allows templates to make decisions based on the Kubernetes environment and available capabilities instead of assuming a fixed cluster configuration.

---

## Conclusion

This project demonstrates practical usage of Helm built-in objects and provides a foundation for building dynamic, reusable, and environment-aware Helm charts.

