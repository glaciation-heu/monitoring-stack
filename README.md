# Hiro Monitoring Platform #

---

## Usage
[Helm](https://helm.sh) must be installed to use Monitoring Platform.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repository as follows:

```console
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```


Install dependency helm chart monitoring platform
this will install prometheus, grafana, influxdb helm chart.
These charts are defined in Chart.yaml file

```console
helm dependency update monitoring-stack
```

install monitoring-stack helm chart in namespace monitoring with release name monitoring-stack
monitoring namespace will be created if not exists

```console
helm install monitoring-stack ./monitoring-stack -n monitoring --create-namespace
```

To uninstall monitoring-stack helm release

```console
helm uninstall monitoring-stack -n monitoring
```

---

### Port-forward

port forward prometheus server service
```console
kubectl port-forward svc/monitoring-stack-prometheus-server 8080:80 -n monitoring
```

port forward grafana service
```console
kubectl port-forward service/monitoring-stack-grafana 3000:80 -n monitoring
```


Get grafana password
 
```console
kubectl get secret --namespace monitoring monitoring-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

### Configure grafana DashBoard

Prometheus datasource is automatically configured with monitoring-stack helm chart with clusterIp URL

http://monitoring-stack-prometheus-server:80


Dashboard id to be imported : 3662

---

## TODO

port forward prometheus server service
```console
kubectl port-forward deployment/monitoring-stack-grafana 3000
```

kubectl expose service monitoring-stack-prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext

minikube service prometheus-server-ext -n telemetry

kubectl expose service monitoring-stack-grafana --type=NodePort --target-port=3000 --name=telemetry-grafana-ext
minikube service telemetry-grafana-ext -n telemetry

kubectl expose service monitoring-stack-grafana --type=NodePort --target-port=3000 --name=telemetry-grafana-ext


dashboard id : 3662


separate installation for testing

helm upgrade --install my-release influxdata/influxdb

helm show values prometheus-community/prometheus > values.yml

helm uninstall telemetry -n monitoring