# Day 2 Runbook

## Objective
Deploy application to Kubernetes and implement DevOps practices

## Steps Performed

### 1. Kubernetes Setup
- Created namespace (devops)
- Created deployment for app
- Created MySQL deployment with PVC
- Created services for app and DB

### 2. Image Deployment
- Built Docker image inside Minikube
- Deployed image using Kubernetes deployment

### 3. Access Application
Used port-forwarding:
kubectl port-forward svc/task-app 33399:80 -n devops

Access:
http://127.0.0.1:33399

### 4. Scripts Implementation
- backup_db.sh
- backup_site.sh
- restore_all.sh
- healthcheck.sh
- test_smoke.sh

### 5. CI/CD Pipeline
- Created Jenkinsfile
- Defined stages:
  - Checkout
  - Build
  - Docker build
  - Test

### 6. Infrastructure Setup
- Terraform: simulated infra provisioning
- Ansible: local configuration + healthcheck

## Validation
- App reachable via port-forward
- DB verified using kubectl exec
- Scripts tested successfully

## Issues Faced
- MySQL access denied from host
  → Fixed using kubectl exec
- Port mismatch in smoke test
  → Fixed URL to 127.0.0.1:33399
- Restore script failed
  → Fixed dynamic backup detection

## Outcome
- Fully functional Kubernetes deployment with automation

