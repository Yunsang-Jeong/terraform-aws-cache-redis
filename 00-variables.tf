##################################################
# Shared
variable "name_tag_convention" {
  description = "The name tag convention of all resources."
  type = object({
    project_name   = string
    stage          = string
  })
  default = {
    project_name = "tf"
    stage        = "poc"
  }
}

variable "global_additional_tag" {
  description = "Additional tags for all resources."
  type        = map(string)
  default     = {}
}
##################################################


########################################
# Subnet group
variable "subnet_ids" {
  description = "The list of subnet id for cache node."
  type        = set(string)
}

variable "subnet_group_description" {
  description = "The description of the ElastiCache subnet group."
  type        = string
  default     = ""
}
########################################


########################################
# Parameter group
variable "parameter_group_family" {
  description = "The family of the ElastiCache parameter group."
  type        = string
}

variable "parameter_group_description" {
  description = "The description of the ElastiCache parameter group."
  type        = string
  default     = ""
}

variable "parameter_group_values" {
  description = "A list of ElastiCache parameter to apply"
  type        = set(object({
    name = string
    value = string
  }))
  default = []
}
########################################


########################################
# AWS Elasticache


##########
# Replication group
variable "replication_group_id" {
  description = "(req)"
  type        = string
}

variable "replication_group_description" {
  description = "(req)"
  type        = string
  default     = ""
}

variable "global_replication_group_id" {
  description = "(opt)"
  type        = string
  default     = null
}
##########


##########
# Redis
variable "engine_version" {
  description = "(opt) Version number of the cache engine to be used."
  type        = string
  default     = null
}

variable "port" {
  description = "(opt) The port number of on which each of the cache nodes will accept connections."
  type        = number
  default     = 6379
}
##########

##########
# Node
variable "node_type" {
  description = "(opt) The instance class used"
  type        = string
  default     = null
}

variable "multi_az_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "availability_zones" {
  description = "(optional)"
  type        = set(string)
  default     = null
}
##########

##########
# Cluster
variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
  type        = bool
  default     = false
}

variable "number_cache_clusters" {
  description = "The number of cache clusters (primary and replicas) this replication group will have."
  type        = number
  default     = null
}

variable "cluster_mode" {
  description = "Create a native Redis cluster. `automatic_failover_enabled` must be set to true."
  type = object(
    {
      num_node_groups         = number
      replicas_per_node_group = number
    }
  )
  default = null
}
##########

##########
# Snapshot
variable "snapshot_arns" {
  description = "A list of Amazon Resource Names (ARNs) that identify Redis RDB snapshot files stored in Amazon S3."
  type        = set(string)
  default     = null
}

variable "snapshot_name" {
  description = "The name of a snapshot from which to restore data into the new node group."
  type        = string
  default     = null
}


variable "snapshot_retention_limit" {
  # Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro cache nodes
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type        = number
  default     = null
}

variable "snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. (e.g. 05:00-09:00)"
  type        = string
  default     = null
}

variable "final_snapshot_identifier" {
  description = "The name of your final node group (shard) snapshot."
  type        = string
  default     = null
}

##########

##########
# Encryption
variable "kms_key_id" {
  description = "The ARN of the key that you wish to use if encrypting at rest."
  type        = string
  default     = null
}

variable "auth_token" {
  description = "The password used to access a password protected server."
  type        = string
  default     = null
}

variable "at_rest_encryption_enabled" {
  description = "Whether to enable encryption at rest."
  type        = bool
  default     = null
}

variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit."
  type        = bool
  default     = null
}
##########

##########
# Maintenance
variable "apply_immediately" {
  description = "(opt) Whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "(opt) Specifies the weekly time range for when maintenance on the cache cluster is performed"
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "(optional)"
  type        = bool
  default     = null
}
##########

variable "timeouts" {
  description = "How long to wait for a replication group to be."
  type = object(
    {
      create = string
      delete = string
      update = string
    }
  )
  default = null
}

variable "security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster."
  type        = set(string)
  default     = null
}

variable "notification_topic_arn" {
  description = "An ARN of an SNS topic to send ElastiCache notifications to."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
########################################