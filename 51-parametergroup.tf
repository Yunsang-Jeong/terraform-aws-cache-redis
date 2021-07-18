resource "aws_elasticache_parameter_group" "this" {
  name = join("-", compact(["paramg", local.name_tag_middle, var.replication_group_id]))
  family = var.parameter_group_family
  description = var.parameter_group_description

  dynamic "parameter" {
    for_each = var.parameter_group_values
    content {
      name = parameter.value["name"]
      value = parameter.value["value"]
    }
  }

  tags = merge(
    var.global_additional_tag,
    { Name = join("-", compact(["paramg", local.name_tag_middle, var.replication_group_id])) }
  )
}


