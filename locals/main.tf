resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.id
  name  = local.default_name
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "super_long_name_test" {
  image = docker_image.nginx.id
  name  = substr(local.workspace.super_long_name, length(local.workspace.super_long_name) - 6, length(local.workspace.super_long_name))
  ports {
    internal = 80
    external = 8080
  }
}
