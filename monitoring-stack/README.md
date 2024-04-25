# monitoring-stack

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | grafana | 7.0.0 |
| https://grafana.github.io/helm-charts | loki-stack | 2.10.1 |
| https://h3poteto.github.io/charts/stable | fluentd-sidecar-injector | 0.4.3 |
| https://helm.influxdata.com/ | influxdb | 4.12.5 |
| https://hiro-microdatacenters-bv.github.io/idrac-exporter/helm-charts | idrac-exporter | 0.1.0 |
| https://nvidia.github.io/gpu-monitoring-tools/helm-charts | dcgm-exporter | 2.4.0 |
| https://prometheus-community.github.io/helm-charts | prometheus | 25.10.0 |
| https://prometheus-community.github.io/helm-charts | prometheus-snmp-exporter | 5.1.0 |
| https://sustainable-computing-io.github.io/kepler-helm-chart | kepler | 0.5.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dcgm-exporter.enabled | bool | `false` |  |
| fluentd-sidecar-injector.enabled | bool | `true` |  |
| fluentd-sidecar-injector.sidecarInjector.fluentbit.aggregatorHost | string | `"{{ tpl .Release.Name . }}-loki"` |  |
| fluentd-sidecar-injector.sidecarInjector.fluentbit.aggregatorPort | int | `3100` |  |
| fluentd-sidecar-injector.sidecarInjector.fluentbit.applicationLogDir | string | `"/var/opt/app/logs"` |  |
| fluentd-sidecar-injector.sidecarInjector.fluentbit.dockerImage | string | `"ghcr.io/h3poteto/fluentd-sidecar-injector:latest"` |  |
| fluentd-sidecar-injector.sidecarInjector.fluentbit.tagPrefix | string | `"sidecar-log"` |  |
| fluentd-sidecar-injector.useCertManager | bool | `false` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".apiVersion | int | `1` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].disableDeletion | bool | `true` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].editable | bool | `true` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].folder | string | `"Kubernetes"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].name | string | `"grafana-dashboards-kubernetes"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].options.path | string | `"/var/lib/grafana/dashboards/grafana-dashboards-kubernetes"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].orgId | int | `1` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].type | string | `"file"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].disableDeletion | bool | `true` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].editable | bool | `true` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].folder | string | `"default"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].name | string | `"default"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].options.path | string | `"/var/lib/grafana/dashboards/default"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].orgId | int | `1` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[1].type | string | `"file"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-system-api-server.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-system-api-server.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-system-api-server.json"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-system-coredns.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-system-coredns.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-system-coredns.json"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-global.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-global.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-views-global.json"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-namespaces.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-namespaces.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-views-namespaces.json"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-nodes.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-nodes.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-views-nodes.json"` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-pods.token | string | `""` |  |
| grafana.dashboards.grafana-dashboards-kubernetes.k8s-views-pods.url | string | `"https://raw.githubusercontent.com/dotdc/grafana-dashboards-kubernetes/master/dashboards/k8s-views-pods.json"` |  |
| grafana.dashboardsConfigMaps.default | string | `"grafana-dashboards"` |  |
| grafana.datasources."datasources.yaml".apiVersion | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[0].isDefault | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].name | string | `"Prometheus"` |  |
| grafana.datasources."datasources.yaml".datasources[0].type | string | `"prometheus"` |  |
| grafana.datasources."datasources.yaml".datasources[0].url | string | `"http://{{ tpl .Release.Name . }}-prometheus-server:80"` |  |
| grafana.datasources."datasources.yaml".datasources[1].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[1].name | string | `"Loki"` |  |
| grafana.datasources."datasources.yaml".datasources[1].type | string | `"loki"` |  |
| grafana.datasources."datasources.yaml".datasources[1].url | string | `"http://{{ tpl .Release.Name . }}-loki:3100"` |  |
| grafana.datasources."datasources.yaml".datasources[2].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[2].jsonData.dbName | string | `"prometheus"` |  |
| grafana.datasources."datasources.yaml".datasources[2].name | string | `"InfluxDB"` |  |
| grafana.datasources."datasources.yaml".datasources[2].secureJsonData.password | string | `"admin"` |  |
| grafana.datasources."datasources.yaml".datasources[2].type | string | `"influxdb"` |  |
| grafana.datasources."datasources.yaml".datasources[2].url | string | `"http://{{ tpl .Release.Name . }}-influxdb:8086"` |  |
| grafana.datasources."datasources.yaml".datasources[2].user | string | `"admin"` |  |
| grafana.enabled | bool | `true` |  |
| grafana.livenessProbe.failureThreshold | int | `10` |  |
| grafana.livenessProbe.initialDelaySeconds | int | `120` |  |
| grafana.livenessProbe.timeoutSeconds | int | `60` |  |
| grafana.resources.limits.cpu | int | `1` |  |
| grafana.resources.limits.memory | string | `"512Mi"` |  |
| grafana.resources.requests.cpu | int | `1` |  |
| grafana.resources.requests.memory | string | `"256Mi"` |  |
| grafana.sidecar.dashboards.enabled | bool | `true` |  |
| idrac-exporter.enabled | bool | `false` |  |
| influxdb.enabled | bool | `true` |  |
| influxdb.env[0].name | string | `"INFLUXDB_DB"` |  |
| influxdb.env[0].value | string | `"prometheus"` |  |
| influxdb.env[1].name | string | `"INFLUXDB_ADMIN_USER"` |  |
| influxdb.env[1].value | string | `"admin"` |  |
| influxdb.env[2].name | string | `"INFLUXDB_ADMIN_PASSWORD"` |  |
| influxdb.env[2].value | string | `"admin"` |  |
| influxdb.image.pullPolicy | string | `"IfNotPresent"` |  |
| influxdb.image.repository | string | `"influxdb"` |  |
| influxdb.image.tag | string | `"1.8"` |  |
| influxdb.persistence.size | string | `"32Gi"` |  |
| influxdb.resources.limits.cpu | int | `4` |  |
| influxdb.resources.limits.memory | string | `"12Gi"` |  |
| influxdb.resources.requests.cpu | int | `3` |  |
| influxdb.resources.requests.memory | string | `"8Gi"` |  |
| kepler.enabled | bool | `false` |  |
| kepler.image.tag | string | `"latest"` |  |
| loki-stack.enabled | bool | `true` |  |
| loki-stack.fluent-bit.enabled | bool | `true` |  |
| loki-stack.loki.persistence.enabled | bool | `true` |  |
| loki-stack.loki.persistence.size | string | `"32Gi"` |  |
| loki-stack.loki.resources.limits.cpu | int | `1` |  |
| loki-stack.loki.resources.limits.memory | string | `"2Gi"` |  |
| loki-stack.loki.resources.requests.cpu | int | `1` |  |
| loki-stack.loki.resources.requests.memory | string | `"1Gi"` |  |
| loki-stack.promtail.enabled | bool | `false` |  |
| loki-stack.table_manager.retention_deletes_enabled | bool | `true` |  |
| loki-stack.table_manager.retention_period | string | `"336h"` |  |
| prometheus-snmp-exporter.enabled | bool | `true` |  |
| prometheus.alertmanager.enabled | bool | `true` |  |
| prometheus.alertmanager.persistence.size | string | `"1Gi"` |  |
| prometheus.alertmanager.resources.limits.cpu | string | `"300m"` |  |
| prometheus.alertmanager.resources.limits.memory | string | `"128Mi"` |  |
| prometheus.alertmanager.resources.requests.cpu | string | `"300m"` |  |
| prometheus.alertmanager.resources.requests.memory | string | `"128Mi"` |  |
| prometheus.enabled | bool | `true` |  |
| prometheus.extraScrapeConfigs | string | `"- job_name: 'prometheus-node-exporter'\n  kubernetes_sd_configs:\n    - role: endpoints\n  relabel_configs:\n  - source_labels: [__meta_kubernetes_endpoints_name]\n    regex: '.*prometheus-node-exporter'\n    action: keep\n- job_name: 'idrac-exporter'\n  params:\n    \"target\": [\"10.14.2.7\"]\n  kubernetes_sd_configs:\n    - role: endpoints\n  relabel_configs:\n  - source_labels: [__meta_kubernetes_endpoints_name]\n    regex: '.*idrac-exporter'\n    action: keep\n- job_name: 'prometheus-snmp-exporter'\n  kubernetes_sd_configs:\n    - role: endpoints\n  relabel_configs:\n  - source_labels: [__meta_kubernetes_endpoints_name]\n    regex: '.*prometheus-snmp-exporter'\n    action: keep\n- job_name: 'dcgm-exporter'\n  kubernetes_sd_configs:\n    - role: endpoints\n  relabel_configs:\n  - source_labels: [__meta_kubernetes_endpoints_name]\n    regex: '.*dcgm-exporter'\n    action: keep\n- job_name: 'kepler'\n  kubernetes_sd_configs:\n    - role: endpoints\n  relabel_configs:\n  - source_labels: [__meta_kubernetes_endpoints_name]\n    regex: 'kepler'\n    action: keep\n"` |  |
| prometheus.kube-state-metrics.enabled | bool | `true` |  |
| prometheus.prometheus-node-exporter.enabled | bool | `true` |  |
| prometheus.server.global.evaluation_interval | string | `"1m"` |  |
| prometheus.server.global.scrape_interval | string | `"1m"` |  |
| prometheus.server.global.scrape_timeout | string | `"11s"` |  |
| prometheus.server.persistentVolume.size | string | `"32Gi"` |  |
| prometheus.server.remoteWrite[0].url | string | `"http://{{ tpl .Release.Name . }}-influxdb:8086/api/v1/prom/write?db=prometheus&u=admin&p=admin"` |  |
| prometheus.server.resources.limits.cpu | int | `1` |  |
| prometheus.server.resources.limits.memory | string | `"2Gi"` |  |
| prometheus.server.resources.requests.cpu | int | `1` |  |
| prometheus.server.resources.requests.memory | string | `"1Gi"` |  |
| prometheus.server.service.retention | string | `"15d"` |  |
| prometheus.server.service.retentionSize | string | `"30Gb"` |  |
| replicaCount | int | `1` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)