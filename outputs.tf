output "bucket_name" {
  description = "The name of the bucket."
  value       = module.s3.bucket_name
}


output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
}

