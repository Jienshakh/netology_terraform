[0m[1mdata.template_file.cloudinit: Reading...[0m[0m
[0m[1mdata.template_file.cloudinit: Read complete after 0s [id=5b28eb6679ba7f1d6393df2e8a18699ed32a8dde0d4d5b6cd098f79460ab846d][0m
[0m[1mmodule.marketing-vm.data.yandex_compute_image.my_image: Reading...[0m[0m
[0m[1mmodule.analytic-vm.data.yandex_compute_image.my_image: Reading...[0m[0m
[0m[1mmodule.vpc-prod.yandex_vpc_network.vpc_network: Refreshing state... [id=enpte32lkkovoiusj2bl][0m
[0m[1mmodule.marketing-vm.data.yandex_compute_image.my_image: Read complete after 1s [id=fd8i7c7nvr9nenblcdu0][0m
[0m[1mmodule.analytic-vm.data.yandex_compute_image.my_image: Read complete after 1s [id=fd8i7c7nvr9nenblcdu0][0m
[0m[1mmodule.vpc-prod.yandex_vpc_subnet.vpc_subnet["ru-central1-a"]: Refreshing state... [id=e9bj16ir3ohl165h65hi][0m
[0m[1mmodule.vpc-prod.yandex_vpc_subnet.vpc_subnet["ru-central1-b"]: Refreshing state... [id=e2lce07uk21ehdsqf5c6][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # module.analytic-vm.yandex_compute_instance.vm[0][0m will be created
[0m  [32m+[0m[0m resource "yandex_compute_instance" "vm" {
      [32m+[0m[0m allow_stopping_for_update = true
      [32m+[0m[0m created_at                = (known after apply)
      [32m+[0m[0m description               = "TODO: description; {{terraform yyy managed}}"
      [32m+[0m[0m folder_id                 = (known after apply)
      [32m+[0m[0m fqdn                      = (known after apply)
      [32m+[0m[0m gpu_cluster_id            = (known after apply)
      [32m+[0m[0m hardware_generation       = (known after apply)
      [32m+[0m[0m hostname                  = "analytics-analytics-vm-0"
      [32m+[0m[0m id                        = (known after apply)
      [32m+[0m[0m labels                    = {
          [32m+[0m[0m "project" = "analytics"
        }
      [32m+[0m[0m maintenance_grace_period  = (known after apply)
      [32m+[0m[0m maintenance_policy        = (known after apply)
      [32m+[0m[0m metadata                  = {
          [32m+[0m[0m "serial-port-enable" = "1"
          [32m+[0m[0m "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqrsLQiHlWWUqZSYjBnUrFsYXL/tn0w72UBj4tjjb4G
                
                package_update: true
                package_upgrade: false
                packages: ["vim","nginx"]
            EOT
        }
      [32m+[0m[0m name                      = "analytics-analytics-vm-0"
      [32m+[0m[0m network_acceleration_type = "standard"
      [32m+[0m[0m platform_id               = "standard-v1"
      [32m+[0m[0m status                    = (known after apply)
      [32m+[0m[0m zone                      = "ru-central1-a"

      [32m+[0m[0m boot_disk {
          [32m+[0m[0m auto_delete = true
          [32m+[0m[0m device_name = (known after apply)
          [32m+[0m[0m disk_id     = (known after apply)
          [32m+[0m[0m mode        = (known after apply)

          [32m+[0m[0m initialize_params {
              [32m+[0m[0m block_size  = (known after apply)
              [32m+[0m[0m description = (known after apply)
              [32m+[0m[0m image_id    = "fd8i7c7nvr9nenblcdu0"
              [32m+[0m[0m name        = (known after apply)
              [32m+[0m[0m size        = 10
              [32m+[0m[0m snapshot_id = (known after apply)
              [32m+[0m[0m type        = "network-hdd"
            }
        }

      [32m+[0m[0m metadata_options (known after apply)

      [32m+[0m[0m network_interface {
          [32m+[0m[0m index          = (known after apply)
          [32m+[0m[0m ip_address     = (known after apply)
          [32m+[0m[0m ipv4           = true
          [32m+[0m[0m ipv6           = (known after apply)
          [32m+[0m[0m ipv6_address   = (known after apply)
          [32m+[0m[0m mac_address    = (known after apply)
          [32m+[0m[0m nat            = true
          [32m+[0m[0m nat_ip_address = (known after apply)
          [32m+[0m[0m nat_ip_version = (known after apply)
          [32m+[0m[0m subnet_id      = "e9bj16ir3ohl165h65hi"
        }

      [32m+[0m[0m placement_policy (known after apply)

      [32m+[0m[0m resources {
          [32m+[0m[0m core_fraction = 5
          [32m+[0m[0m cores         = 2
          [32m+[0m[0m memory        = 1
        }

      [32m+[0m[0m scheduling_policy {
          [32m+[0m[0m preemptible = true
        }
    }

[1m  # module.marketing-vm.yandex_compute_instance.vm[0][0m will be created
[0m  [32m+[0m[0m resource "yandex_compute_instance" "vm" {
      [32m+[0m[0m allow_stopping_for_update = true
      [32m+[0m[0m created_at                = (known after apply)
      [32m+[0m[0m description               = "TODO: description; {{terraform yyy managed}}"
      [32m+[0m[0m folder_id                 = (known after apply)
      [32m+[0m[0m fqdn                      = (known after apply)
      [32m+[0m[0m gpu_cluster_id            = (known after apply)
      [32m+[0m[0m hardware_generation       = (known after apply)
      [32m+[0m[0m hostname                  = "marketing-marketing-vm-0"
      [32m+[0m[0m id                        = (known after apply)
      [32m+[0m[0m labels                    = {
          [32m+[0m[0m "project" = "marketing"
        }
      [32m+[0m[0m maintenance_grace_period  = (known after apply)
      [32m+[0m[0m maintenance_policy        = (known after apply)
      [32m+[0m[0m metadata                  = {
          [32m+[0m[0m "serial-port-enable" = "1"
          [32m+[0m[0m "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqrsLQiHlWWUqZSYjBnUrFsYXL/tn0w72UBj4tjjb4G
                
                package_update: true
                package_upgrade: false
                packages: ["vim","nginx"]
            EOT
        }
      [32m+[0m[0m name                      = "marketing-marketing-vm-0"
      [32m+[0m[0m network_acceleration_type = "standard"
      [32m+[0m[0m platform_id               = "standard-v1"
      [32m+[0m[0m status                    = (known after apply)
      [32m+[0m[0m zone                      = "ru-central1-a"

      [32m+[0m[0m boot_disk {
          [32m+[0m[0m auto_delete = true
          [32m+[0m[0m device_name = (known after apply)
          [32m+[0m[0m disk_id     = (known after apply)
          [32m+[0m[0m mode        = (known after apply)

          [32m+[0m[0m initialize_params {
              [32m+[0m[0m block_size  = (known after apply)
              [32m+[0m[0m description = (known after apply)
              [32m+[0m[0m image_id    = "fd8i7c7nvr9nenblcdu0"
              [32m+[0m[0m name        = (known after apply)
              [32m+[0m[0m size        = 10
              [32m+[0m[0m snapshot_id = (known after apply)
              [32m+[0m[0m type        = "network-hdd"
            }
        }

      [32m+[0m[0m metadata_options (known after apply)

      [32m+[0m[0m network_interface {
          [32m+[0m[0m index          = (known after apply)
          [32m+[0m[0m ip_address     = (known after apply)
          [32m+[0m[0m ipv4           = true
          [32m+[0m[0m ipv6           = (known after apply)
          [32m+[0m[0m ipv6_address   = (known after apply)
          [32m+[0m[0m mac_address    = (known after apply)
          [32m+[0m[0m nat            = true
          [32m+[0m[0m nat_ip_address = (known after apply)
          [32m+[0m[0m nat_ip_version = (known after apply)
          [32m+[0m[0m subnet_id      = "e9bj16ir3ohl165h65hi"
        }

      [32m+[0m[0m placement_policy (known after apply)

      [32m+[0m[0m resources {
          [32m+[0m[0m core_fraction = 5
          [32m+[0m[0m cores         = 2
          [32m+[0m[0m memory        = 1
        }

      [32m+[0m[0m scheduling_policy {
          [32m+[0m[0m preemptible = true
        }
    }

[1m  # module.marketing-vm.yandex_compute_instance.vm[1][0m will be created
[0m  [32m+[0m[0m resource "yandex_compute_instance" "vm" {
      [32m+[0m[0m allow_stopping_for_update = true
      [32m+[0m[0m created_at                = (known after apply)
      [32m+[0m[0m description               = "TODO: description; {{terraform yyy managed}}"
      [32m+[0m[0m folder_id                 = (known after apply)
      [32m+[0m[0m fqdn                      = (known after apply)
      [32m+[0m[0m gpu_cluster_id            = (known after apply)
      [32m+[0m[0m hardware_generation       = (known after apply)
      [32m+[0m[0m hostname                  = "marketing-marketing-vm-1"
      [32m+[0m[0m id                        = (known after apply)
      [32m+[0m[0m labels                    = {
          [32m+[0m[0m "project" = "marketing"
        }
      [32m+[0m[0m maintenance_grace_period  = (known after apply)
      [32m+[0m[0m maintenance_policy        = (known after apply)
      [32m+[0m[0m metadata                  = {
          [32m+[0m[0m "serial-port-enable" = "1"
          [32m+[0m[0m "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqrsLQiHlWWUqZSYjBnUrFsYXL/tn0w72UBj4tjjb4G
                
                package_update: true
                package_upgrade: false
                packages: ["vim","nginx"]
            EOT
        }
      [32m+[0m[0m name                      = "marketing-marketing-vm-1"
      [32m+[0m[0m network_acceleration_type = "standard"
      [32m+[0m[0m platform_id               = "standard-v1"
      [32m+[0m[0m status                    = (known after apply)
      [32m+[0m[0m zone                      = "ru-central1-b"

      [32m+[0m[0m boot_disk {
          [32m+[0m[0m auto_delete = true
          [32m+[0m[0m device_name = (known after apply)
          [32m+[0m[0m disk_id     = (known after apply)
          [32m+[0m[0m mode        = (known after apply)

          [32m+[0m[0m initialize_params {
              [32m+[0m[0m block_size  = (known after apply)
              [32m+[0m[0m description = (known after apply)
              [32m+[0m[0m image_id    = "fd8i7c7nvr9nenblcdu0"
              [32m+[0m[0m name        = (known after apply)
              [32m+[0m[0m size        = 10
              [32m+[0m[0m snapshot_id = (known after apply)
              [32m+[0m[0m type        = "network-hdd"
            }
        }

      [32m+[0m[0m metadata_options (known after apply)

      [32m+[0m[0m network_interface {
          [32m+[0m[0m index          = (known after apply)
          [32m+[0m[0m ip_address     = (known after apply)
          [32m+[0m[0m ipv4           = true
          [32m+[0m[0m ipv6           = (known after apply)
          [32m+[0m[0m ipv6_address   = (known after apply)
          [32m+[0m[0m mac_address    = (known after apply)
          [32m+[0m[0m nat            = true
          [32m+[0m[0m nat_ip_address = (known after apply)
          [32m+[0m[0m nat_ip_version = (known after apply)
          [32m+[0m[0m subnet_id      = "e2lce07uk21ehdsqf5c6"
        }

      [32m+[0m[0m placement_policy (known after apply)

      [32m+[0m[0m resources {
          [32m+[0m[0m core_fraction = 5
          [32m+[0m[0m cores         = 2
          [32m+[0m[0m memory        = 1
        }

      [32m+[0m[0m scheduling_policy {
          [32m+[0m[0m preemptible = true
        }
    }

[1m  # module.vpc-prod.yandex_vpc_subnet.vpc_subnet["ru-central1-d"][0m will be created
[0m  [32m+[0m[0m resource "yandex_vpc_subnet" "vpc_subnet" {
      [32m+[0m[0m created_at     = (known after apply)
      [32m+[0m[0m folder_id      = (known after apply)
      [32m+[0m[0m id             = (known after apply)
      [32m+[0m[0m labels         = (known after apply)
      [32m+[0m[0m name           = "production-ru-central1-d"
      [32m+[0m[0m network_id     = "enpte32lkkovoiusj2bl"
      [32m+[0m[0m v4_cidr_blocks = [
          [32m+[0m[0m "10.0.3.0/24",
        ]
      [32m+[0m[0m v6_cidr_blocks = (known after apply)
      [32m+[0m[0m zone           = "ru-central1-d"
    }

[1mPlan:[0m 4 to add, 0 to change, 0 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
