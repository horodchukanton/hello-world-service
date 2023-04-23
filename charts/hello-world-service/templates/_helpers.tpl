{{/* Define a name for the application */}}
{{- define "hello-world-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Define a name for the Kubernetes service */}}
{{- define "hello-world-service.name" -}}
{{- printf "%s-%s" .Release.Name "hello-world-service" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
