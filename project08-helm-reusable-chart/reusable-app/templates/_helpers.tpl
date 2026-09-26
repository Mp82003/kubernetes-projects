{{/*
Expand the name of the chart.
*/}}
{{- define "reusable-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "reusable-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version.
*/}}
{{- define "reusable-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "reusable-app.labels" -}}
helm.sh/chart: {{ include "reusable-app.chart" . }}
{{ include "reusable-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "reusable-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "reusable-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account.
*/}}
{{- define "reusable-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "reusable-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a simple reusable application name.
*/}}
{{- define "reusable-app.appName" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{/*
Create environment label.
*/}}
{{- define "reusable-app.environment" -}}
{{ .Values.environment | default "dev" | quote }}
{{- end }}
