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


## 🛠️ Prerequisites

- AWS account (Permissions to manage AWS services ECS etc...)
- AWS security credentails
- Create domain 
- Terraform installed
- Docker installed

## 🛠️ Guide

## 1. Public Hosted Zone on Route 53 created
- Check a list of NameServer (NS)

## 2. Update Domain 
- Add NS records from Route 53
  
## 3. GitHub Action - Secrets 

Add your AWS access keys
![image](https://github.com/user-attachments/assets/071a0fd4-b203-470d-80b2-f8bf929d676d)

## 4. Build and Push Docker Image

Run the Docker build and push image workflow on GitHub Action

```hcl
    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1

    - name: Build Docker image
      run: |
        docker build -t ptm-ecr-repo .

    - name: Tag Docker image for ECR
      run: |
        docker tag ptm-ecr-repo:latest ${{ steps.login-ecr.outputs.registry }}/ptm-ecr-repo:latest

    - name: Push Docker image to ECR
      run: |
        docker push ${{ steps.login-ecr.outputs.registry }}/ptm-ecr-repo:latest
```


## 5. Edit terraform.tfvars

Add your domain 

```hcl
ACM
dns_name          = "app.<your-domain>"
dns_hosted_zone   = "<your-domain>"
```
## 6. Deploy Terraform 

```hcl
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy - ONLY To destroy Terraform infra 
```

## 7. Test 

Visit application 
```hcl
https://app.<your-domain>
```


