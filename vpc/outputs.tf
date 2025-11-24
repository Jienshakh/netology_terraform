output "bucket_name" {
  description = "The name of the bucket."
  value       = module.s3.bucket_name
}

output "network_id" {
  value = module.vpc-prod.network_id
}

output "subnet_ids" {
  value = module.vpc-prod.subnet_ids
}

output "subnet_zones" {
  value = module.vpc-prod.subnet_zones
}
