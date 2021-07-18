resource "aws_elasticache_subnet_group" "this" {
  name = join("-", compact(["subg", local.name_tag_middle, var.replication_group_id]))
  description = var.subnet_group_description
  subnet_ids = var.subnet_ids

  tags = merge(
    var.global_additional_tag, 
    { Name = join("-", compact(["subg", local.name_tag_middle, var.replication_group_id])) }
  )
}