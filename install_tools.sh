#!/bin/bash

kubectl apply -n cd -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable

# Install KEDA

helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm install keda kedacore/keda --namespace keda --create-namespace

#metric-server
