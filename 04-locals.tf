# data.aws_caller_identity.this.account_id
data "aws_caller_identity" "this" {}

# data.aws_region.this.name
data "aws_region" "this" {}

locals {
  region_          = split("-", data.aws_region.this.name)
  region_s        = "${substr(local.region_[0], 0, 1)}${substr(local.region_[1], 0, 1)}${substr(local.region_[2], 0, 1)}"
  project_name    = var.name_tag_convention.project_name
  stage           = var.name_tag_convention.stage
  name_tag_middle = join("-", [local.region_s, local.project_name, local.stage])
}
