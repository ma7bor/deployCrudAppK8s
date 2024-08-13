#!/bin/bash

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Please install it first."
    exit 1
fi

# Define the namespace
namespace="ams-app"

# Function to wait for deployment readiness
wait_for_deployment() {
    echo "Waiting for deployment $1 to be ready..."
    kubectl rollout status deployment/$1 -n "$namespace" --timeout=500s
    if [ $? -ne 0 ]; then
        echo "Deployment $1 failed to become ready within timeout"
        exit 1
    fi
}

# Function to verify resource creation
verify_resource() {
    echo "Verifying $1 $2..."
    kubectl get $1 $2 -n "$namespace" &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$1 $2 was not created successfully"
        exit 1
    fi
}

# Cleanup function
cleanup() {
    echo "Cleaning up resources in namespace $namespace..."
    for file in "${yaml_files[@]}"; do
        kubectl delete -f "$file" -n "$namespace"
    done
    echo "Cleanup complete."
}

# Parse command line arguments
cleanup_flag=false
verbose_flag=false

while getopts "cv" opt; do
    case $opt in
        c) cleanup_flag=true ;;
        v) verbose_flag=true ;;
        \?) echo "Invalid option -$OPTARG" >&2; exit 1 ;;
    esac
done

if $cleanup_flag; then
    cleanup
    exit 0
fi

echo "Deployment is starting..."

# Check if the namespace exists, create it if it doesn't
if ! kubectl get namespace "$namespace" &> /dev/null
then
    echo "Namespace $namespace does not exist. Creating it..."
    kubectl create namespace "$namespace"
    if [ $? -ne 0 ]; then
        echo "Failed to create namespace $namespace"
        exit 1
    fi
else
    echo "Namespace $namespace already exists."
fi

# Define YAML files to be applied in order
yaml_files=(
    "mysql/mysql-secrets.yaml"
    "mysql/mysql-configmap.yaml"
    "mysql/mysql-pvc.yaml"
    "mysql/mysql-deployment.yaml"

    "mysql/phpmyadmin-deployment.yaml"

    "backend/spring-secrets.yaml"
    "backend/spring-configmap.yaml"
    "backend/spring-deployment.yaml"
    
    "frontend/angular-deployment.yaml"
)

# Apply each YAML file in the specified namespace
for file in "${yaml_files[@]}"
do
    if [ -f "$file" ]; then
        echo "Applying $file in namespace $namespace..."
        if $verbose_flag; then
            kubectl apply -f "$file" -n "$namespace"
        else
            kubectl apply -f "$file" -n "$namespace" &> /dev/null
        fi
        if [ $? -ne 0 ]; then
            echo "Failed to apply $file"
            exit 1
        fi
        
        # Verify resource creation based on file name
        case $file in
            mysql/mysql-secrets.yaml) verify_resource "secret" "db-secrets" ;;
            backend/spring-secrets.yaml) verify_resource "secret" "spring-secrets" ;;
            mysql/mysql-configmap.yaml) verify_resource "configmap" "db-cm" ;;
            backend/spring-configmap.yaml) verify_resource "configmap" "spring-cm" ;;
            mysql/mysql-pvc.yaml) verify_resource "pvc" "mysql-pvc" ;;
            mysql/mysql-deployment.yaml) 
                verify_resource "deployment" "mysqldb-deployment"
                wait_for_deployment "mysqldb-deployment"
                ;;
            mysql/phpmyadmin-deployment.yaml) 
                verify_resource "deployment" "phpmyadmin-deployment"
                wait_for_deployment "phpmyadmin-deployment"
                ;;
            backend/spring-deployment.yaml)
                verify_resource "deployment" "spring-deployment"
                wait_for_deployment "spring-deployment"
                ;;
            frontend/angular-deployment.yaml)
                verify_resource "deployment" "angular-deployment"
                wait_for_deployment "angular-deployment"
                ;;
        esac
    else
        echo "File $file does not exist"
        exit 1
    fi
done

echo "All specified YAML files have been applied successfully in namespace $namespace."
echo "Deployment complete."