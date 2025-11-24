/*
data "terraform_remote_state" "vpc" {
  backend = "s3"
  
  config = {
    bucket = "my-terraform-states"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
*/

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/network.tfstate"
  }
}


module "marketing-vm" {
  source         = "git::https://github.com/jienshakh/yandex_compute_instance.git?ref=main"
  env_name       = "marketing" 
  network_id     = data.terraform_remote_state.vpc.outputs.network_id
  subnet_zones   = data.terraform_remote_state.vpc.outputs.subnet_zones
  subnet_ids     = data.terraform_remote_state.vpc.outputs.subnet_ids
  instance_name  = "marketing-vm"
  instance_count = 2
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytic-vm" {
  source         = "git::https://github.com/jienshakh/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = data.terraform_remote_state.vpc.outputs.network_id
  subnet_zones   = data.terraform_remote_state.vpc.outputs.subnet_zones
  subnet_ids     = data.terraform_remote_state.vpc.outputs.subnet_ids
  instance_name  = "analytics-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    project = "analytics",
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  
  vars = {
    username           = var.username
    ssh_public_key     = file(var.ssh_public_key)
    packages           = jsonencode(var.packages)
  }

}

/*
### Vault

data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

resource "vault_generic_secret" "example" {
  path = "secret/foo"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

*/
