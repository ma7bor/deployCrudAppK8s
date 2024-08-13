#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Constants
NAMESPACE="ams-app"
BACKEND_DEPLOY_DIR="./backend"
# Function to deploy Kubernetes resources
deploy_resources() {
    local resource_type="$1"
    local resource_file="$2"

    echo "Deploying $resource_type from $resource_file..."

    kubectl apply -f "$resource_file" -n "$NAMESPACE"
    echo "Successfully applied $resource_type: $resource_file"
}

# Deploy ConfigMaps and Secrets
deploy_resources "Secrets" "$BACKEND_DEPLOY_DIR/spring-secrets.yaml"
deploy_resources "ConfigMap" "$BACKEND_DEPLOY_DIR/spring-configmap.yaml"

# Deploy Application
deploy_resources "Deployment and Service" "$BACKEND_DEPLOY_DIR/spring-deployment.yaml"

# Wait for deployment to be ready
wait_for_deployment() {
    local deployment_name="$1"
    echo "Waiting for deployment $deployment_name to be ready..."

    # Polling for deployment status
    local ready=""
    local attempts=0
    local max_attempts=30  # Adjust as needed
    while [[ -z $ready && $attempts -lt $max_attempts ]]; do
        ready=$(kubectl get deployment "$deployment_name" -n "$NAMESPACE" -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
        if [[ $ready == "True" ]]; then
            echo "Deployment $deployment_name is ready."
            return 0
        fi
        attempts=$((attempts + 1))
        sleep 10
    done

    echo "Deployment $deployment_name did not become ready within a reasonable time."
    return 1
}

# Replace 'your-deployment-name' with the actual name from your deploy.yaml
wait_for_deployment "spring-deployments"

echo "Deployment completed successfully."