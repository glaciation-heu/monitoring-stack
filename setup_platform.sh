#!/bin/bash

echo "creating namespace monitoring"

# creating namespace monitoring in k8 cluster
kubectl create namespace monitoring

# update dependency of hiro-telemetry helm chart from Chart.yaml file
helm dependency update hiro-telemetry -n monitoring