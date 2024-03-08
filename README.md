# Monitoring Stack

# Build

* Install [helm-docs](https://github.com/norwoodj/helm-docs).

* Pre-commit hook
  [install the pre-commit binary](https://pre-commit.com/#install). Then run:
  ```console
  pre-commit install
  pre-commit install-hooks
  ```

* Install [Helm](https://helm.sh). Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

  Install dependency helm chart monitoring platform
  this will install prometheus, grafana, influxdb helm chart.
  These charts are defined in Chart.yaml file

  ```console
  helm dependency update ./monitoring-stack
  ```

  ```console
  helm dependency build ./monitoring-stack
  ```

## Usage
[Helm](https://helm.sh) must be installed to use Monitoring Platform.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Add helm repo:
```console
    helm repo add monitoring-charts https://hiro-microdatacenters-bv.github.io/monitoring-stack/helm-charts
```

Get values yaml file and customize it for your environment:
```console
    helm show values monitoring-charts/monitoring-stack > values.yaml
```

Install the monitoring stack:
```console
    helm install ms monitoring-charts/monitoring-stack --values ./values.yaml
```

---

### Port-forward

port forward prometheus server service
```console
kubectl port-forward svc/<release name>-prometheus-server 8080:80
```

port forward grafana service
```console
kubectl port-forward service/<release name>-grafana 3000:80 
```


Get grafana password
 
```console
kubectl get secret <release name>-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
