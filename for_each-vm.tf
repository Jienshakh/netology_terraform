resource "yandex_compute_instance" "database" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }
  
  name = each.value.vm_name
  platform_id = each.value.platform

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.cores_fraction 
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = each.value.serial_port
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

}
