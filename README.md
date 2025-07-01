# AWS ECS DEPLOYMENT PROJECT 

## Overview 

This project demonstrates deploying a Node.js application using modern infrastructure tools such as Docker, Terraform, and various AWS services such as ECS (Fargate). The application is securely hosted on AWS, with domain management handled through AWS Route 53. The entire infrastructure is fully automated using Infrastructure as Code (IaC) principles, ensuring reliable and repeatable deployments.


## 🛠️ Technologies Used
- **AWS**: ECR, ECS, ALB, ACM, VPC, Route 53
- **Terraform**: Infrastructure as Code (IaC) automation
- **Docker**: Containerisation of the application
- **GitHub Actions**: Continuous Integration & Deployment (CI/CD)
  


## 🔧 Key Features

| **Features**                             | **Description**                                                                                  |
|-------------------------------------------|--------------------------------------------------------------------------------------------------|
| **Amazon Elastic Container Registry (ECR)** | Stores Docker images built from the application, enabling ECS to pull and deploy them.          |
| **Amazon ECS (Elastic Container Service)** | Orchestrates containerized application deployment on AWS infrastructure.                        |
| **Application Load Balancer (ALB)**        | Distributes incoming traffic across ECS services and handles SSL termination and routing.       |
| **Terraform**                              | Manages infrastructure as code (IaC), provisioning AWS resources like ECS, ALB, VPC, etc.       |
| **GitHub Actions CI/CD**                   | Automates build, test, Docker image push to ECR, and infrastructure deployment with Terraform.  |
| **Docker**                                 | Builds container images for deployment; defined via a `Dockerfile` in the project root.         |
| **AWS Certificate Manager (ACM)**          | Manages and provisions certificates for secure communication over HTTPS.                |
| **Amazon Route 53**                        | Provides DNS routing for the deployed application, integrating with ALB and ACM.                |
| **VPC**                                    | Sets up secure networking infrastructure for services and supporting components.                |
