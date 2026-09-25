{{/*
Create common labels.
*/}}
{{- define "helm-functions.labels" }}
app: {{ .Values.appName }}
environment: {{ .Values.environment }}
{{- end }}
