resource "yandex_vpc_network" "vpc_dev_network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "vpc_dev_subnet" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.vpc_dev_network.id
  v4_cidr_blocks           = [var.subnet_cidr]
}

