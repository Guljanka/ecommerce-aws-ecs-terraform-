# AWS Enterprise E-Commerce Platform

## Project Overview

This project demonstrates the design and deployment of a production-style AWS cloud environment using Infrastructure as Code (Terraform), containerized applications (Docker), Amazon ECS Fargate, Application Load Balancer, Aurora, Redis, CloudWatch monitoring, Auto Scaling, and GitHub Actions CI/CD.

The goal of this project is to simulate a real-world enterprise cloud environment while applying DevOps, cloud architecture, automation, security, monitoring, and deployment best practices.

---

# Enterprise Cloud Architecture

This environment was built using a layered architecture approach commonly used in enterprise AWS environments.

## 1. Governance Layer

Services:
- AWS Organizations
- Organizational Units (OU)
- Service Control Policies (SCP)
- AWS CloudTrail
- AWS Config

Purpose:
- Governance and account management
- Compliance monitoring
- Security guardrails
- Auditing and activity tracking

---

## 2. Network Layer

Services:
- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups

Purpose:
- Network isolation
- Secure communication between resources
- Controlled internet access
- High availability across Availability Zones

---

## 3. Security Layer

Services:
- AWS WAF
- AWS Shield
- IAM Roles
- IAM Policies
- Security Groups

Purpose:
- Protect web applications from Layer 7 attacks
- Enforce least-privilege access
- Protect infrastructure from unauthorized access
- Improve security posture

---

## 4. Compute Layer

Services:
- Amazon ECS Fargate
- Docker
- Amazon ECR
- Application Load Balancer (ALB)

Purpose:
- Run containerized applications
- Provide high availability
- Support horizontal scaling
- Distribute traffic across healthy tasks

---

## 5. Data Layer

Services:
- Amazon Aurora
- Amazon ElastiCache (Redis)
- Amazon DynamoDB
- Amazon S3

Purpose:
- Relational database storage
- Application caching
- Terraform state locking
- Remote Terraform state storage

---

## 6. Observability Layer

Services:
- Amazon CloudWatch
- CloudWatch Dashboards
- CloudWatch Alarms
- Amazon SNS
- ECS Auto Scaling

Purpose:
- Monitor application health
- Generate alerts
- Visualize metrics
- Automatically scale workloads based on demand

---

## 7. DevOps Automation Layer

Services:
- Terraform
- GitHub Actions
- Docker
- Amazon ECR

Purpose:
- Infrastructure as Code
- Automated deployments
- Continuous Integration
- Continuous Delivery

---

# Architecture Diagram

```text
                     Users
                       │
                       ▼
                    Route53
                       │
                       ▼
                    AWS WAF
                       │
                       ▼
           Application Load Balancer
                       │
                       ▼
                ECS Fargate Service
                       │
        ┌──────────────┴──────────────┐
        ▼                             ▼
   Amazon Aurora                 Redis Cache
        │
        ▼
      Data

Monitoring:
CloudWatch Dashboard
CloudWatch Alarms
SNS Notifications
ECS Auto Scaling

CI/CD:
GitHub Actions
        │
        ▼
Amazon ECR
        │
        ▼
Amazon ECS
```

---

# Infrastructure as Code

Infrastructure is provisioned using Terraform modules.

Key components managed by Terraform:

- VPC
- Security Groups
- Application Load Balancer
- ECS Cluster
- ECS Service
- ECS Task Definitions
- Aurora Database
- Redis Cache
- CloudWatch Resources
- IAM Roles
- Auto Scaling Policies

---

# Remote Terraform Backend

Terraform state is stored remotely using:

- Amazon S3
- Amazon DynamoDB State Locking

Benefits:

- State protection
- Team collaboration
- State consistency
- Prevention of concurrent modifications

---

# CI/CD Pipeline

GitHub Actions automates deployments.

Pipeline Flow:

1. Developer pushes code to GitHub
2. GitHub Actions starts workflow
3. Docker image is built
4. Image is pushed to Amazon ECR
5. ECS service receives a new deployment
6. New tasks are launched
7. Application becomes available through ALB

---

# Monitoring and Auto Scaling

CloudWatch monitors:

- CPU Utilization
- Memory Utilization
- ECS Task Count

Auto Scaling Configuration:

- Minimum Tasks: 1
- Maximum Tasks: 4
- Target CPU Utilization: 50%

Benefits:

- Cost optimization
- High availability
- Automatic scaling during traffic spikes

---

# Security Features

- AWS Organizations
- Service Control Policies (SCP)
- AWS Config
- CloudTrail
- AWS WAF
- IAM Least Privilege
- Security Groups
- Private Subnets
- Encrypted Terraform Backend

---

# Skills Demonstrated

- AWS Cloud Architecture
- Terraform
- Docker
- Amazon ECS Fargate
- Amazon ECR
- Application Load Balancer
- Route53
- Aurora
- Redis
- CloudWatch
- Auto Scaling
- AWS Organizations
- AWS WAF
- GitHub Actions
- CI/CD
- Infrastructure as Code
- DevOps Best Practices

---

# Author

Gulzhan Abdukalilova

AWS | Terraform | Docker | ECS Fargate| DevOps Engineering


