output "network_id" {
  value = yandex_vpc_network.vpc_dev_network.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.vpc_dev_subnet.id
}

output "subnet_zone" {
  value = yandex_vpc_subnet.vpc_dev_subnet.zone
}



