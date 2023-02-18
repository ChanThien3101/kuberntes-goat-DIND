#!/bin/bash
# Author: Madhu Akula
# This program has been created as part of Kuberentes Goat
# Kuberentes Goat Access vulnerable infrastrcuture

# Checking kubectl setup
kubectl version --short > /dev/null 2>&1
if [ $? -eq 0 ];
then
    echo "kubectl setup looks good."
else
    echo "Please check kubectl setup."
    exit;
fi

# Exposing DIND (docker-in-docker) exploitation Scenario
export POD_NAME=$(kubectl get pods --namespace default -l "app=health-check" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME --address 0.0.0.0 1231:80 > /dev/null 2>&1 &

echo "using port 1231"