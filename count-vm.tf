resource "yandex_compute_instance" "web" {
  count              = 2
  name               = "web-${count.index + 1}"
  platform_id        = var.web_resources.platform
  zone               = var.web_resources.zone

  depends_on = [
    yandex_compute_instance.database
  ]


  resources {
    cores         = var.web_resources.cpu
    memory        = var.web_resources.ram
    core_fraction = var.web_resources.cores_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.web_resources.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.web_resources.serial_port
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

}


