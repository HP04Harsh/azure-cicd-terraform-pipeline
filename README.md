Mega Automation Project
=======================

Overview
--------

The Mega Automation Project is a complete end-to-end DevOps implementation that automates infrastructure provisioning and application deployment on Microsoft Azure using Jenkins and Terraform. The project demonstrates how modern DevOps practices can be used to build a fully automated pipeline from code commit to production deployment.

Objective
---------

The primary objective of this project is to design a CI/CD pipeline that eliminates manual intervention by automating infrastructure creation, configuration, and application deployment in a cloud environment.

Workflow
--------

The workflow begins when code is pushed to GitHub. Jenkins detects the change and triggers a pipeline execution. The pipeline uses Terraform to provision Azure infrastructure, including a virtual machine, networking components, and security configurations. During the provisioning phase, Apache is installed automatically on the VM using a startup script.

Once the infrastructure is successfully created, Jenkins connects to the virtual machine using SSH and deploys the application files (HTML and CSS) to the Apache web server. The deployed application becomes accessible through the public IP address of the virtual machine.

Tech Stack
----------

The project leverages Terraform for infrastructure as code, Jenkins for CI/CD automation, Microsoft Azure as the cloud provider, and Apache as the web server. Secure authentication is implemented using an Azure Service Principal, while SSH key-based authentication is used for secure communication with the virtual machine.

Key Features
------------

This project includes automated infrastructure provisioning, secure authentication using Service Principal and SSH keys, a fully automated CI/CD pipeline, and seamless deployment of a static web application to a cloud-hosted server.

Prerequisites
-------------

To execute this project, the following prerequisites are required: an active Azure account, a configured Jenkins server, Terraform installed on the system, Git for version control, and an SSH key pair for secure access.

Execution
---------

After configuring the required credentials in Jenkins, the pipeline can be triggered either manually or automatically through a GitHub push event. Upon successful execution, the pipeline provisions all required resources, deploys the application, and makes it accessible via a public URL.

Learning Outcomes
-----------------

This project provides hands-on experience with real-world DevOps challenges, including Terraform authentication using Service Principal, Jenkins pipeline structuring, environment variable management, and secure deployment practices in a cloud environment.

Author
------

Harsh Pardhi
