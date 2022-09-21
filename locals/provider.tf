terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  # Required when the docker.sock file is in a non-standard location, such as MacOS and colima
  # host = "unix://<path>"
}
