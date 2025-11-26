data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/network.tfstate"
  }
}

module "mysql" {
  source = "./modules/mysql-cluster"

  # Общие настройки
  name         = "my-mysql-cluster"
  environment  = "prod"
  network_id   = data.terraform_remote_state.vpc.outputs.network_id
  subnet_zones = data.terraform_remote_state.vpc.outputs.subnet_zones
  subnet_ids   = data.terraform_remote_state.vpc.outputs.subnet_ids
  
  # Другие настройки
  ha                  = false
  count_ha            = 2
}
