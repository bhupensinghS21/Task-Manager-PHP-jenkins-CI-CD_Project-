# Day 1 Runbook

## Objective
Set up application, containerization, and local execution.

## Steps Performed

### 1. Application Setup
- Created HTML pages (index, about, contact)
- Implemented PHP backend (contact.php)
- Configured DB connection (config/db.php)

### 2. Database Setup
- Created schema.sql
- Created seed.sql
- Verified DB manually using MySQL queries

### 3. Docker Setup
- Built Dockerfile using php:8.2-apache
- Installed mysqli extension
- Copied app into container

### 4. Docker Compose
- Defined services:
  - app
  - mysql
- Exposed port 8080

### 5. Validation
Commands used:
- docker build
- docker-compose up -d
- curl http://localhost:8080

Result:
Application accessible locally

## Issues Faced
- DB connection issues initially
- Fixed by correcting credentials in db.php

## Outcome
- Application successfully running in Docker

