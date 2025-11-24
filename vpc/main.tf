module "vpc-prod" {
  source       = "./modules/vpc"
  env_name     = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}
/*
module "vpc-dev" {
  source       = "./modules/vpc"
  env_name     = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}
*/
### S3 bucket

# To always have a unique bucket name in this example
resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=master"

  bucket_name = "simple-bucket-${random_string.unique_id.result}"
  max_size    = 1073741824
  versioning  = {
    enabled = true
  }
}
