# Docker Orchestration with Terraform

A professional Infrastructure as Code (IaC) project demonstrating how to automate the lifecycle of Docker containers using Terraform. This setup replaces manual `docker run` commands with a declarative configuration for better reproducibility and scaling.

## Overview

This repository uses the **Terraform Docker Provider** to:

* Pull or reference local Docker images.
* Provision and manage container resources.
* Use **provisioners** (`local-exec`) to handle container health-check delays.
* Manage networking and port mapping (External: 5000 -> Internal: 5000).

## Detailed Description

This repository provides a production-ready Infrastructure as Code (IaC) solution for automating the provisioning and lifecycle management of Docker containers using [Terraform](https://www.terraform.io/). By leveraging the [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest) provider, this project enables declarative, repeatable, and scalable container orchestration, replacing manual `docker run` workflows with modern DevOps best practices.

### Key Features

**Automated Container Lifecycle:** Declaratively create, manage, and destroy Docker containers.

* **Image Management:** Pull or reference local Docker images as part of the workflow.
* **Startup Provisioning:** Execute startup-time provisioning logic (e.g., health-check delays) using `local-exec`.
* **Networking:** Configure container networking and port mappings (e.g., `5000:5000`).
* **State Management:** Ensure reproducibility and traceability through Terraform state files.

This approach is ideal for:

* Local development environments
* CI/CD runners
* Lightweight microservices
* Infrastructure automation learning paths

## Technology Stack

* **Infrastructure as Code:** Terraform (v1.x)
* **Container Platform:** Docker Engine / Docker Desktop
* **Provider:** kreuzwerker/docker
* **Application Runtime:** Python Flask web service

## Prerequisites

Before deploying, ensure the following are installed and configured:

1. **Docker Engine** or **Docker Desktop** (running and accessible)
2. **Terraform CLI** (version 1.0.0 or later)
3. **Local Docker Image** for the application:

    ```bash
    docker build -t pure_image .
    ```

## Deployment Guide

Follow these steps to deploy the containerized application using Terraform:

1. **Initialize Terraform** to download required providers:

    ```bash
    terraform init
    ```

2. **Preview the execution plan** to review proposed infrastructure changes:

    ```bash
    terraform plan
    ```

3. **Apply the configuration** to provision the Docker container:

    ```bash
    terraform apply
    ```

4. **Access the application** via the exposed port (default: [http://localhost:5000](http://localhost:5000)).

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs/)
- [kreuzwerker/docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest)

---
For questions or contributions, please open an issue or submit a pull request.

## Tech Stack

* **IaC Tool:** [Terraform](https://www.terraform.io)
* **Platform:** [Docker](https://www.docker.com)
* **Provider:** `kreuzwerker/docker`
* **Application:** Flask-based Python web service

## Local Setup Prerequisites

Before running this project, ensure you have the following installed:

1. **Docker Desktop** or **Docker Engine** (running)
2. **Terraform CLI** (v1.0.0+)
3. **Local Image:** Ensure your app image is built:

    ```bash
    docker build -t pure_image .
    ```

## Quick Start

1. **Initialize Terraform** (downloads providers):

   ```bash
   terraform init
    ```

2. **Plan the Deployment** (preview changes):

    ```bash
    terraform plan
    ```

3. **Apply the Configuration**:

    ```bash
    terraform apply
    ```

## Project Structure

* main.tf - Primary configuration for Docker resources and providers.
* .gitignore - Pre-configured to exclude sensitive .tfstate and .terraform directories.
* Dockerfile - Defines the application environment.
* src - stores main application code
* requirements.txt - dependencies file

