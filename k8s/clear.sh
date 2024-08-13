#!/bin/bash

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Please install it first."
    exit 1
fi

echo "Clearing is starting..."
# Define the namespace
namespace="ams-app"

# Delete all resources in the namespace
kubectl delete all --all -n $namespace
kubectl delete configmap --all -n $namespace
kubectl delete pvc --all -n $namespace
kubectl delete pv --all -n $namespace
kubectl delete secret --all -n $namespace
kubectl delete service --all -n $namespace
kubectl delete ingress --all -n $namespace

# kubectl delete namespace $namespace

echo "The namespace $namespace has been cleared successfully"