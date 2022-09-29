resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_volume" "super_long_name_test" {
  name = substr(local.workspace.super_long_name, length(local.workspace.super_long_name) - 6, length(local.workspace.super_long_name))
}

resource "docker_container" "loop_through_string_set" {
  image = docker_image.nginx.id
  name  = "${local.default_name}-loop_through_string_set"
  command = concat([
    "test",
    "test1",
    "test2",
  ], local.workspace.members)
}

resource "docker_volume" "loop_through_list_test" {
  for_each = { for x in local.workspace.names : lookup(x, "name", "default_name") => x... }
  name     = each.key
}
