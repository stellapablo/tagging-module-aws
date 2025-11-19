locals {
  common_list   = ["environment", "owner", "application", "application_repository", "iac_repository"]
  required_tags = ["KmsCustom", "EnableBackup"]

  lower_tags = {
    for tag_key, tag_value in var.tags : lower(tag_key) => tag_value
  }

  custom_tags = {
    for tag_key, tag_value in var.tags :
    tag_key => tag_value if !contains(local.common_list, lower(tag_key))
  }

  tags = merge(local.custom_tags, {
    environment            = coalesce(lookup(local.lower_tags, "environment", ""), "TF_NA")
    owner                  = coalesce(lookup(local.lower_tags, "owner", ""), "TF_NA")
    application            = coalesce(lookup(local.lower_tags, "application", ""), "TF_NA")
    application_repository = coalesce(lookup(local.lower_tags, "application_repository", ""), "TF_NA")
    iac_repository         = coalesce(lookup(local.lower_tags, "iac_repository", ""), "TF_NA")
  })
}
