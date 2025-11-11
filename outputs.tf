output "lesson4" {
  value = {
    web = {
      instance_name = yandex_compute_instance.web.name
      external_ip   = yandex_compute_instance.web.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.web.fqdn
    }
    database = {
      instance_name = yandex_compute_instance.database.name
      external_ip   = yandex_compute_instance.database.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.database.fqdn
    }
  }
}
