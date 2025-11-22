/*
#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсети
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}
*/

module "marketing-vm" {
  source         = "git::https://github.com/jienshakh/yandex_compute_instance.git?ref=main"
  env_name       = "marketing" 
  network_id     = module.vpc-dev.network_id
  subnet_zones   = [module.vpc-dev.subnet_zone]
  subnet_ids     = [module.vpc-dev.subnet_id]
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
  network_id     = module.vpc-dev.network_id
  subnet_zones   = [module.vpc-dev.subnet_zone]
  subnet_ids     = [module.vpc-dev.subnet_id]
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

module "vpc-dev" {
  source                = "./modules/vpc"
  network_name          = "ex2-network"
  subnet_name           = "ex2-subnet"
  subnet_zone           = "ru-central1-a"
  subnet_cidr           = "10.0.1.0/24"
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


