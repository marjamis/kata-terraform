output "docker_name" {
  value = docker_container.loop_through_string_set_to_array.name
}

output "datasource_output" {
  value = data.docker_image.custom.name
}

output "datasource_output_via_consuming_resource" {
  value = docker_container.loop_through_string_set_to_array.image
}
