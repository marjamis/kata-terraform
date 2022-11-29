resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Name before move
# resource "docker_image" "n" {
#   name         = "nginx:latest"
#   keep_locally = false
# }

# Name after move
resource "docker_image" "nn" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_volume" "super_long_name_test" {
  name = substr(local.workspace.super_long_name, length(local.workspace.super_long_name) - 6, length(local.workspace.super_long_name))
}

resource "docker_container" "loop_through_string_set" {
  image = docker_image.nginx.image_id
  name  = "${local.default_name}-loop_through_string_set"
  command = concat([
    "test",
    "test1",
    "test2",
  ], local.workspace.members)
}

resource "docker_container" "loop_through_string_set_to_array" {
  image = data.docker_image.custom.name
  name  = "${local.default_name}-loop_through_string_set_to_array"
  command = [
    "test",
    "test1",
    "test2",
    "additional=[${local.workspace.members_again}]"
  ]
}

resource "docker_volume" "loop_through_list_test" {
  for_each = { for x in local.workspace.names : lookup(x, "name", "default_name") => x }
  name     = each.key
}

resource "docker_container" "source_destination_list" {
  for_each = { for index in local.workspace.source_destination_list : "${index.src}-${index.dest}" => index }

  image = docker_image.nginx.image_id
  name  = "${local.default_name}-${each.value.src}-${each.value.dest}"
}
