#!/bin/bash
# Author: Madhu Akula
# This program has been created as part of Kuberentes Goat
# Teardown Kuberentes Goat setup

# Removing the superadmin cluster role/binding
kubectl delete clusterrolebindings superadmin
kubectl delete serviceaccount -n kube-system superadmin

# Removing the helm-tiller cluster role/binding
kubectl delete clusterrole all-your-base
kubectl delete clusterrolebindings belong-to-us

# Removing metadata db chart
helm delete metadata-db --no-hooks
# helm2 delete pwnchart --purge

# Remove tiller deployment
kubectl delete deployments -n kube-system tiller-deploy


# Delete the scenarios
kubectl delete -f deployment.yaml


echo "remove success"
