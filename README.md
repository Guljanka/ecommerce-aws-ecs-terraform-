AWS ECS Fargate Production Infrastructure with Terraform

Overview

This project demonstrates a production-style AWS infrastructure deployed using Terraform and containerized applications running on Amazon ECS Fargate.

The infrastructure follows DevOps best practices including Infrastructure as Code (IaC), CI/CD automation, centralized Terraform state management, monitoring, alerting, and auto scaling.

⸻

Architecture

User
  │
  ▼
Route53
  │
  ▼
ACM HTTPS Certificate
  │
  ▼
Application Load Balancer (ALB)
  │
  ▼
ECS Fargate Service
  │
  ▼
Docker Container
  │
  ├── CloudWatch Logs
  ├── CloudWatch Metrics
  └── Auto Scaling

⸻

Technologies Used

AWS Services

* Amazon ECS Fargate
* Amazon ECR
* Application Load Balancer (ALB)
* Route53
* AWS Certificate Manager (ACM)
* CloudWatch
* SNS
* S3
* DynamoDB
* VPC
* Security Groups
* NAT Gateway

DevOps Tools

* Terraform
* Docker
* GitHub Actions
* GitHub
* AWS CLI

⸻

Features

Infrastructure as Code

* Modular Terraform architecture
* Reusable Terraform modules
* Environment separation
* Version-controlled infrastructure

Container Platform

* Dockerized application
* Amazon ECS Fargate deployment
* Application Load Balancer integration
* Health checks and traffic routing

CI/CD Pipeline

GitHub Actions workflow automatically:

1. Detects code changes
2. Builds Docker image
3. Pushes image to Amazon ECR
4. Triggers ECS deployment
5. Deploys updated application

Monitoring & Observability

* CloudWatch Logs
* CloudWatch Dashboard
* CPU Utilization Monitoring
* Memory Utilization Monitoring
* SNS Email Notifications
* ECS Service Health Monitoring

Auto Scaling

* ECS Service Auto Scaling
* CPU-based scaling policies
* Minimum task count: 1
* Maximum task count: 4

Terraform Remote State

Terraform state is stored securely in Amazon S3.

State locking is implemented using DynamoDB to prevent concurrent infrastructure changes.

⸻

Project Structure

.
├── .github/
│   └── workflows/
├── app/
├── environments/
│   └── production/
├── modules/
├── README.md
└── .gitignore

⸻

Deployment Workflow

Developer
    │
    ▼
GitHub Push
    │
    ▼
GitHub Actions
    │
    ▼
Docker Build
    │
    ▼
Amazon ECR
    │
    ▼
Amazon ECS Fargate
    │
    ▼
Application Load Balancer

⸻

Security

* Private subnets for backend resources
* Security Groups for network access control
* HTTPS encryption using ACM certificates
* Terraform state encryption in S3
* State locking with DynamoDB

⸻

Key Achievements

* Built a complete AWS production environment using Terraform
* Implemented CI/CD with GitHub Actions
* Deployed containerized applications to ECS Fargate
* Configured monitoring, alerting, and dashboards
* Implemented ECS Auto Scaling
* Configured secure remote Terraform state management

⸻

Author

Gulzhan Abdukalilova

DevOps Engineer | AWS | Terraform | Docker | ECS | GitHub Actions
