# Docker Orchestration with Terraform

A professional Infrastructure as Code (IaC) project demonstrating how to automate the lifecycle of Docker containers using Terraform. This setup replaces manual `docker run` commands with a declarative configuration for better reproducibility and scaling.

## Overview

This repository uses the **Terraform Docker Provider** to:
*   Pull or reference local Docker images.
*   Provision and manage container resources.
*   Use **provisioners** (`local-exec`) to handle container health-check delays.
*   Manage networking and port mapping (External: 5000 -> Internal: 5000).

## Tech Stack

*   **IaC Tool:** [Terraform](https://www.terraform.io)
*   **Platform:** [Docker](https://www.docker.com)
*   **Provider:** `kreuzwerker/docker`
*   **Application:** Flask-based Python web service

## Prerequisites

Before running this project, ensure you have the following installed:
1.  **Docker Desktop** or **Docker Engine** (running)
2.  **Terraform CLI** (v1.0.0+)
3.  **Local Image:** Ensure your app image is built:
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
