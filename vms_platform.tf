###VM vars

variable "vm_web_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_web_platform_name" {
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
}

/*
variable "vm_web_cores" {
  type        = number
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  default     = 1
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
}
*/
variable "vm_web_preemptible" {
  type        = bool
  default     = true
}
/*
variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
}
*/
###DB vars

variable "vm_db_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_db_platform_name" {
  type        = string
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
}

/*
variable "vm_db_cores" {
  type        = number
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  default     = 2
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
}
*/

variable "vm_db_preemptible" {
  type        = bool
  default     = true
}
/*
variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
}
*/
### Resorces vars

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(any)
    default = {
      serial_port_enable = 1
      ssh_keys           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAJL3zKyzYWOD80ZP0VGTZ77fItgdDyzXLlFITM+wMXHRMtJTnQG1ETExeLV9T76yvzlFSPGXPG6cje4BrCrzA5Nx7hM6rATXGYXczaxyKjkF7CHJf1n1c1JZiBSg97DogAqJ9rdrneens7VUtqGIdm6KULt1+f9oPLhgR8cA1+zBIMgaKqsUjss2/pvTQt34jmgW0rcQL81/4v5UQn8P4EM1swp7+TR5Yg+fUOh4UXnCWeta1+ZOQq6Nv1LcigFJBIFtpZEJThEEdZuoAfEPJrqrqR3NR59FpzbkTjMiDJXCzbR6ojJ4ViVjiR51Ert6688FnVpVHvHgzSnSJode5"

    }
}
