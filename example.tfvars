  apply_immediately = true

  ########################################
  # AWS ElastiCache for redis
  replication_group_id = "my-redis"
  replication_group_description = "Session clustering for web service"

  engine_version = "6.x"
  port = 6379

  node_type = "cache.t3.small"
  multi_az_enabled = true
  # availability_zones = []

  automatic_failover_enabled = true
  cluster_mode = {
    num_node_groups = 1
    replicas_per_node_group = 2
  }
  security_group_ids = [ ]
  ########################################

  ########################################
  # Parameter group
  parameter_group_family = "redis6.x"
  parameter_group_description = "Session clustering for web service"
  parameter_group_values = []
  ########################################

  ########################################
  # Subnet group
  subnet_group_description = "Session clustering for web service"
  subnet_ids = [ ]
  ########################################