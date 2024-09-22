Here’s the updated **README** without the bash commands:

---

# Multi-Container Application Deployment

## Overview
This repository contains the source code and configuration files required to deploy a multi-container application using Docker Compose. The application includes a frontend, backend, and MongoDB database, and is designed for deployment on AWS EC2 with features like auto-scaling, load balancing, and security configurations.

## 1. EC2 Instance Setup

### Instance Configuration:
- **AMI**: Ubuntu 22.04
- **Instance Type**: t2.medium (2 vCPUs, 4GB RAM)
- **Security Group**: Initially configured to allow SSH (port 22). Additional ports for the application services were opened later as required.

### SSH Connection:
Connect to the EC2 instance via SSH using the provided key.

### System Update:
Ensure the system is up-to-date before starting any deployments by running a system update and upgrade.

## 2. Installed Packages

1. **Docker**: Installed for containerizing the application components.
2. **Docker Compose**: Used for managing the multi-container setup.
3. **Netstat**: Installed for monitoring network ports and application health.
4. **Iptables & UFW**: Installed to configure firewall rules for securing the instance.
5. **MongoDB**: Installed to handle the database service for the application.

## 3. Application Setup

### Backend Setup
- A **Dockerfile** was created for the backend using the Node.js 16-alpine image. The backend is responsible for managing the API and communicating with the MongoDB database.
- MongoDB was configured to accept external connections by modifying the bind IP address and exposing port 27017.
- An AWS security group was configured to allow traffic on port 5000 for backend access.

### Frontend Setup
- A multi-stage **Dockerfile** was created for the frontend. The first stage builds the React app, and the second stage serves the built application using NGINX.
- The frontend communicates with the backend API through the environment variable `REACT_APP_BASE_URL`, which points to the backend’s API endpoint.
- An AWS security group was configured to allow traffic on port 80 for frontend access.

## 4. Docker Compose for Multi-Container Application
A `docker-compose.yml` file was created to manage the backend, frontend, and MongoDB services. The file defines the configuration for all three services, including network ports, environment variables, and volumes for data persistence.

## 5. Security Enhancements
Firewall rules were configured using UFW to allow only necessary ports for SSH, frontend, backend, and MongoDB services. This ensures that only relevant traffic is allowed to reach the EC2 instance.

## 6. Load Balancer Configuration
- An **AWS Target Group** was created, and the EC2 instance was registered as a target.
- An **Application Load Balancer (ALB)** was set up to distribute incoming traffic evenly across instances and improve the availability and performance of the application.

## 7. Auto Scaling Configuration
- A **Launch Template** was created with specific instance specs (t2.medium, 2 vCPUs, 4GB RAM) to ensure consistent deployments.
- An **Auto Scaling Group** was configured to scale the number of EC2 instances based on traffic load, ensuring high availability.

## 8. Trivy Security Scan
To enhance security, **Trivy** was used to scan Docker images for vulnerabilities. This ensures that the deployed containers are secure and free from common vulnerabilities, maintaining a high level of security for the application environment.

## 9. Deployed Application
The multi-container application has been successfully deployed and is accessible through the configured load balancer.
