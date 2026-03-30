<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/0fd49852-5c69-4e05-899c-3dfc6fc47b86" />



🚀 Azure End-to-End Automation: Terraform & Jenkins CI/CD
=========================================================

This repository demonstrates a complete **Infrastructure as Code (IaC)** and **Continuous Integration/Continuous Deployment (CI/CD)** pipeline. It automates the provisioning of cloud infrastructure on **Microsoft Azure** and the deployment of a web application using **Jenkins** and **Terraform**.

🏗️ Architecture Overview
-------------------------

The pipeline follows a modern DevOps workflow to eliminate manual environment setup:

1.  **Code Commit:** Developer pushes code to GitHub.
    
2.  **Orchestration:** Jenkins detects the push via Webhooks/Polling.
    
3.  **IaC Provisioning:** Terraform initializes and applies configurations to create:
    
    *   Virtual Network (VNet) & Subnets
        
    *   Network Security Groups (NSG) for port 80/22 access.
        
    *   Azure Virtual Machine (Ubuntu).
        
4.  **Configuration:** A startup script installs the Apache Web Server during the VM boot process.
    
5.  **App Deployment:** Jenkins uses SSH to transfer application files (HTML/CSS) to the web server directory.
    

🛠️ Tech Stack
--------------

**Category Technology**

**Cloud Provider** [Microsoft Azure](https://azure.microsoft.com/)

**Infrastructure** [Terraform (HCL)](https://www.terraform.io/)

**CI/CD Tool** [Jenkins](https://www.jenkins.io/)

**Web Server** Apache (HTTPD)

**Scripting** Bash

🔑 Key Features
---------------

*   **Automated Infrastructure:** Zero-touch provisioning of networking and compute resources.
    
*   **Security First:** Uses Azure Service Principals for Terraform authentication and SSH keys for secure VM access.
    
*   **Idempotent Deployments:** Terraform ensures the infrastructure state is maintained and consistent.
    
*   **Seamless CI/CD:** A single Jenkinsfile manages the entire lifecycle from terraform plan to app deployment.
    

🚀 Getting Started
------------------

### Prerequisites

*   An **Azure Subscription** and a Service Principal (Client ID, Secret, Tenant ID).
    
*   **Jenkins Server** with Terraform and Pipeline plugins installed.
    
*   **Terraform CLI** installed on the Jenkins agent.
    

### Setup & Execution

1.  Bashgit clone https://github.com/HP04Harsh/azure-cicd-terraform-pipeline.git
    
2.  Add your Azure Service Principal and SSH private keys to the Jenkins Credentials Provider.
    
3.  Create a "Pipeline" project in Jenkins pointing to the Jenkinsfile in this repo and click **Build Now**.
    

📈 Learning Outcomes
--------------------

Through this project, I gained hands-on experience in:

*   Managing **Terraform State** and provider authentication.
    
*   Writing complex **Jenkins Pipelines** as Code.
    
*   Automating cloud networking (VNets, Public IPs, and Security Rules).
    
*   Troubleshooting SSH-based deployment triggers in automated environments.
