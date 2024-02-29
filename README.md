# Hiro Monitoring Platform #

---

## Usage
[Helm](https://helm.sh) must be installed to use Monitoring Platform.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repository as follows:

```console
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

create monitoring namespace in k8 cluster
```console
kubectl create namespace monitoring
```

install dependency helm chart monitoring platform
this will install prometheus, grafana, influxdb helm chart.
These charts are defined in Chart.yaml file

```console
helm dependency update hiro-telemetry -n monitoring
```

install monitoring helm chart in namespace platform with release name hiro-telemetry

```console
helm install hiro-telemetry ./hiro-telemetry -n monitoring
```
to uninstall hiro-telemetry release

```console
helm uninstall hiro-telemetry -n monitoring
```

---

### Port-forward

port forward prometheus server service
```console
kubectl port-forward svc/hiro-telemetry-prometheus-server 8080:80 -n monitoring
```

port forward grafana service
```console
kubectl port-forward service/hiro-telemetry-grafana 3000:80 -n monitoring
```

```console
kubectl port-forward deployment/telemetry-grafana 3000
```


Get grafana password
 
```console
kubectl get secret --namespace monitoring hiro-telemetry-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

Configure grafana DashBoard
Use clusterIp service for connecting prometheus as data source in grafana

http://hiro-telemetry-prometheus-server:80

Dashboard id to be imported : 3662

---

## TODO

kubectl expose service telemetry-prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext

minikube service prometheus-server-ext -n telemetry

kubectl expose service telemetry-grafana --type=NodePort --target-port=3000 --name=telemetry-grafana-ext
minikube service telemetry-grafana-ext -n telemetry

kubectl expose service telemetry-grafana --type=NodePort --target-port=3000 --name=telemetry-grafana-ext


dashboard id : 3662


separate installation for testing

helm upgrade --install my-release influxdata/influxdb

helm show values prometheus-community/prometheus > values.yml

helm uninstall telemetry -n monitoring