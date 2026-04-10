# DevOps-Ready Web Application

## Project Overview

This project demonstrates a complete DevOps workflow for deploying and managing a PHP-based web application with a MySQL backend. It includes application development, containerization, CI/CD pipeline design, Kubernetes deployment, infrastructure-as-code, and operational scripting.

The application provides a simple website with multiple pages (Home, About, Contact) and supports form submission with persistent storage in a MySQL database.

---

## Repository Structure

```
app/        → Application source (HTML, PHP, DB config, SQL)
docker/     → Dockerfile and Docker Compose setup
ci/         → Jenkins pipeline definition
k8s/        → Kubernetes manifests (base setup)
infra/      → Terraform and Ansible configuration
scripts/    → Operational scripts (backup, restore, healthcheck, etc.)
docs/       → Runbooks, architecture, validation
logs/       → Runtime logs
Makefile    → Command automation
README.md   → Project documentation
```

---

## Setup Instructions

### Prerequisites

* Docker
* Kubernetes (Minikube)
* kubectl
* Jenkins (optional for CI/CD)
* Make

### Clone Repository

```
git clone <repo-url>
cd project
```

---

## How to Run Locally

Run using Docker Compose:

```
cd docker
docker-compose up -d
```

Access the application:

```
http://localhost:8080
```

---

## How to Run via Docker (Manual Build)

```
eval $(minikube docker-env)
docker build -t task-app:latest -f docker/Dockerfile .
```

---

## Kubernetes Deployment

Apply manifests:

```
kubectl apply -f k8s/base/
```

Verify:

```
kubectl get pods -n devops
kubectl get svc -n devops
```

### Access Application (Current Setup)

The application is exposed using **port forwarding**:

```
kubectl port-forward svc/task-app 33399:80 -n devops
```

Access in browser:

```
http://127.0.0.1:33399
```

---

## CI/CD Pipeline (Jenkins)

Pipeline stages:

1. Checkout code
2. Validation / linting
3. Application build
4. Docker image build
5. Smoke testing
6. Deployment (Kubernetes)

The pipeline ensures automated build, test, and deployment workflow.

---

## Infrastructure Approach

### Terraform

* Used to simulate infrastructure provisioning
* Generates configuration files and executes setup steps
* Demonstrates Infrastructure-as-Code principles

### Ansible

* Automates environment configuration
* Deploys application files
* Executes health checks

---

## Scripts Usage

All scripts are located in:

```
scripts/
```

### Backup Database

```
./scripts/backup_db.sh
```

### Backup Site

```
./scripts/backup_site.sh
```

### Restore Application & Database

```
./scripts/restore_all.sh
```

### Health Check

```
./scripts/healthcheck.sh
```

### Smoke Test

```
./scripts/test_smoke.sh
```

### Log Review

```
./scripts/log_review.sh
```

---

## Makefile Commands

```
make build     → Build application
make up        → Start services
make down      → Stop services
make logs      → View logs
make test      → Run smoke tests
make clean     → Cleanup resources
```

---

## Validation

* Application accessible via port-forwarding
* Database connectivity verified
* Data insertion confirmed via SQL queries
* Healthcheck and smoke tests returning HTTP 200
* Backup and restore scripts validated

---

## Known Limitations

* Application access currently relies on port-forwarding (Ingress can be enabled for external access)
* MySQL access is handled via Kubernetes exec (not exposed externally for security)
* Terraform setup is local-scope simulation (not provisioning cloud resources)
* Logging is file-based and not centralized

---

## Conclusion

This project demonstrates a structured DevOps workflow covering application deployment,
 containerization, CI/CD, Kubernetes orchestration, infrastructure automation, and operational tooling, ensuring a reliable and reproducible environment.




