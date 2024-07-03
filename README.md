# DAZN DevOps Assignment

## Overview

This repository contains the home assignment for the DevOps role at DAZN. The assignment involves deploying a Dockerized web application on AWS infrastructure using Terraform. The infrastructure includes an ECR repository, a VPC with necessary networking resources, a VM instance, and a Load Balancer.

## Project Structure
DAZN_Assignment/
├── .gitignore
├── Dockerfile
├── README.md
├── index.html
├── main.tf
├── ecr/
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
├── instance/
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
├── load_balancer/
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
└── vpc/
├── main.tf
## Steps to Deploy

### Prerequisites

- Terraform installed
- AWS CLI configured
- Docker installed and running

### Instructions

1. **Clone the Repository**

   git clone https://github.com/YOUR_GITHUB_USERNAME/DAZN-DevOps-Assignment.git
   cd DAZN-DevOps-Assignment

2. **Build and Push Docker Image**

**Note** : In case Terraform automatically did not push and pull the code follow below steps

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
docker build -t webimage .
docker tag webimage:latest YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/webimage:latest
docker push YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/webimage:latest

3.**Terraform Setup**
   Initialize Terraform, plan, and apply the configuration:

   terraform init
   terraform plan
   terraform apply

4. **Output**
   
After applying the Terraform configuration, the following resources will be created:

An ECR repository named webimage.
A VPC with necessary networking resources.
A VM instance within the VPC.
A Load Balancer to balance traffic to the VM instance.

Please find screenshots for reference 

![image](https://github.com/naveenchikatimarla/DAZN_Assignment/assets/174331198/e4202169-aef4-420e-9fd3-f3d0b69cd2ae)

![image](https://github.com/naveenchikatimarla/DAZN_Assignment/assets/174331198/2daa0d2e-c87a-4cca-af43-78fe7025f5c3)

![image](https://github.com/naveenchikatimarla/DAZN_Assignment/assets/174331198/4c691951-f4bd-41b6-b331-c51c228f5a98)

![image](https://github.com/naveenchikatimarla/DAZN_Assignment/assets/174331198/0313bc05-57be-414b-acf9-bb1f5425bde3)

**Accessing the Application**
Once the infrastructure is deployed and the Docker container is running, you can access the web application using the public IP address of the Load Balancer.****

http://dazn-lb-927543995.us-east-1.elb.amazonaws.com/

![image](https://github.com/naveenchikatimarla/DAZN_Assignment/assets/174331198/26ef0b46-65c2-4e38-9e0e-e8cdec55a7bc)

**Clean Up**
To clean up and destroy the created infrastructure, run:
terraform destroy

**Conclusion**
This assignment demonstrates the deployment of a Dockerized web application on AWS using Terraform. The setup includes building and pushing a Docker image to ECR, creating a VPC, VM instance, and Load Balancer, and running the application on the VM instance.
Please let me know if you need any further information or clarification.

Thanks,
Naveen.











