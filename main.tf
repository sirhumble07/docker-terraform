# Specifying Docker provider
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      # This allows any 3.0.2 version that is 3.9.0 or higher
      version = "3.0.2"
    }
  }
}

# Defining Docker Image Data Source
resource "docker_image" "local_image" {
  name = "pure_image:latest"
  build {
   context = "." # Points to the folder where your Dockerfile is
  }
   # This forces a rebuild whenever ANY file in your directory changes
  triggers = {
   src_hash = sha1(join("", [for f in fileset("${path.module}/src", "**") : filesha1("${path.module}/src/${f}")]))
  }
}

# Defining the docker container resource
resource "docker_container" "pure_image" { 
  name = "pure_image"
  image = docker_image.local_image.image_id # This uses output from data source
  
  # Expose port 5000 for Flask app
  ports {
    internal = 5000
    external = 5000
  }
}

# Terraform provisioner to wait for Container to be Ready
resource "null_resource" "wait_for_container" {
  depends_on = [docker_container.pure_image]
  # Local-exec provisioner to wait for container to be ready
  provisioner "local-exec" {
    command = "sleep 15"
  }
}

