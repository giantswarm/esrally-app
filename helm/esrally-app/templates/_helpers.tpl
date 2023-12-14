{{/*
Common labels
*/}}
{{- define "labels.common" -}}
app.kubernetes.io/name: "{{ .Release.Name }}"
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
{{- end -}}
