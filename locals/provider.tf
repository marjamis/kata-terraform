terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "docker" {
  # Required when the docker.sock file is in a non-standard location, such as MacOS and colima
  # host = "unix://<path>"
}
