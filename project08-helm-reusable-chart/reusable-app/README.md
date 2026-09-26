# Reusable Helm Chart

A beginner-friendly Helm project demonstrating reusable templates with `_helpers.tpl`.

## What I Learned

- Helm `_helpers.tpl`
- `define` and `include`
- `.Release.Name` and `.Chart.Name`
- Reusable names and labels
- `.Values` with custom environment
- `nindent`
- Helm lint and template validation
- Helm install and upgrade

## Project Structure

```text
reusable-app/
├── templates/
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   └── service.yaml
├── values.yaml
├── Chart.yaml
└── README.md
