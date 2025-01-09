#!/bin/bash

kubectl apply -n cd -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable
