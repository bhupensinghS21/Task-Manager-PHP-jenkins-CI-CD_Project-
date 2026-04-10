# Architecture Overview

## High-Level Architecture

The system is composed of the following components:

1. User accesses application via browser
2. Traffic routed via Kubernetes Service
3. Application runs in container (PHP Apache)
4. Backend connects to MySQL database
5. Data stored in persistent volume

---

## Architecture Diagram

          +----------------------+
          |      User Browser    |
          +----------+-----------+
                     |
                     v
        +--------------------------+
        |  Kubernetes Service      |
        |  (ClusterIP / Port-Forward) |
        +------------+-------------+
                     |
                     v
        +--------------------------+
        |   App Pod (PHP Apache)   |
        |   task-app container     |
        +------------+-------------+
                     |
                     v
        +--------------------------+
        |     MySQL Pod            |
        |     Persistent Volume    |
        +--------------------------+

---

## Components

### Application Layer
- PHP application running on Apache
- Handles user requests and form submissions

### Database Layer
- MySQL deployed in Kubernetes
- Persistent storage using PVC

### Containerization
- Docker used to package application

### Orchestration
- Kubernetes manages deployment, scaling, and networking

### CI/CD
- Jenkins pipeline automates build and testing

### Infrastructure
- Terraform simulates infra provisioning
- Ansible handles configuration management

---

## Data Flow

1. User submits form
2. Request hits Kubernetes Service
3. Routed to application pod
4. PHP processes request
5. Data stored in MySQL
6. Response returned to user

---

## Design Decisions

- Used Kubernetes for scalability and orchestration
- Used port-forwarding for controlled access
- Used scripts for operational tasks
- Used Docker for portability

---

## Trade-offs

- Port-forwarding instead of Ingress (simpler setup)
- Local Terraform instead of cloud provisioning
- File-based logs instead of centralized logging

---

## Conclusion

Architecture demonstrates a complete DevOps lifecycle including
application deployment, containerization, orchestration, and automation.

