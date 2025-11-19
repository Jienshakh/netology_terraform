
resource "yandex_compute_disk" "disk_vm" {
  count    = 3
  name     = "disk-${count.index}"
  type     = var.disk_params.type
  zone     = var.disk_params.zone
  size     = var.disk_params.size
}


resource "yandex_compute_instance" "storage" {
  name     = "storage-vm"
  platform_id        = var.storage_resources.platform
  zone               = var.storage_resources.zone


  resources {
    cores         = var.storage_resources.cpu
    memory        = var.storage_resources.ram
    core_fraction = var.storage_resources.cores_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.storage_resources.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.storage_resources.serial_port
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

  dynamic "secondary_disk" {
    for_each = { for i, disk in yandex_compute_disk.disk_vm : i => disk }
    content {
      disk_id = secondary_disk.value.id
    }
  }

}
