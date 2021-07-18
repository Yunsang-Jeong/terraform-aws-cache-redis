resource "aws_elasticache_replication_group" "this" {
  apply_immediately = var.apply_immediately

  # Replication group
  replication_group_id = var.replication_group_id
  replication_group_description = var.replication_group_description
  global_replication_group_id = var.global_replication_group_id

  # Encryption
  auth_token = var.auth_token
  kms_key_id = var.kms_key_id
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  node_type = var.node_type
  port = var.port
  engine = "redis"
  engine_version = var.engine_version

  multi_az_enabled = var.multi_az_enabled
  availability_zones = var.availability_zones

  security_group_ids = var.security_group_ids
  subnet_group_name = aws_elasticache_subnet_group.this.name
  parameter_group_name = aws_elasticache_parameter_group.this.name
  
  # Maintenance
  maintenance_window = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  # Snapshot
  snapshot_window = var.snapshot_window
  snapshot_arns = var.snapshot_arns
  snapshot_name = var.snapshot_name
  snapshot_retention_limit = var.snapshot_retention_limit
  final_snapshot_identifier = var.final_snapshot_identifier


  automatic_failover_enabled = true
  number_cache_clusters = var.number_cache_clusters

  dynamic "cluster_mode" {
    for_each = var.cluster_mode == null ? toset([]) : toset([var.cluster_mode])
    content {
      num_node_groups = cluster_mode.value["num_node_groups"]
      replicas_per_node_group = cluster_mode.value["replicas_per_node_group"]
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? toset([]) : toset([var.timeouts])
    content {
      create = timeouts.value["create"]
      delete = timeouts.value["delete"]
      update = timeouts.value["update"]
    }
  }

  notification_topic_arn = var.notification_topic_arn

  tags = merge(
    var.global_additional_tag,
    var.tags,
    { Name = join("-", compact(["paramg", local.name_tag_middle, var.replication_group_id])) }
  )
}