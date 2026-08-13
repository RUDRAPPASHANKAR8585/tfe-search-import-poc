module "s3" {
  for_each = local.s3_buckets

  source = "./s3"

  bucket_name = each.value.bucket_name

  force_destroy = each.value.force_destroy

  enable_versioning = each.value.enable_versioning

  object_ownership = each.value.object_ownership

  block_public_acls = each.value.block_public_acls

  ignore_public_acls = each.value.ignore_public_acls

  block_public_policy = each.value.block_public_policy

  restrict_public_buckets = each.value.restrict_public_buckets

  enable_transfer_acceleration = each.value.enable_transfer_acceleration

  enable_requester_pays = each.value.enable_requester_pays
}

locals {
  s3_buckets = {
    unmanaged1 = {
      bucket_name                     = "tfe-search-import-1-poc"
      force_destroy                   = false
      enable_versioning               = false
      object_ownership                = "BucketOwnerEnforced"
      block_public_acls               = true
      ignore_public_acls              = true
      block_public_policy             = true
      restrict_public_buckets         = true
      enable_transfer_acceleration    = false
      enable_requester_pays           = false
    }

    unmanaged2 = {
      bucket_name                     = "tfe-search-import-2-poc"
      force_destroy                   = false
      enable_versioning               = false
      object_ownership                = "BucketOwnerEnforced"
      block_public_acls               = true
      ignore_public_acls              = true
      block_public_policy             = true
      restrict_public_buckets         = true
      enable_transfer_acceleration    = false
      enable_requester_pays           = false
    }
  }
}
