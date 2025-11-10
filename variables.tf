###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAJL3zKyzYWOD80ZP0VGTZ77fItgdDyzXLlFITM+wMXHRMtJTnQG1ETExeLV9T76yvzlFSPGXPG6cje4BrCrzA5Nx7hM6rATXGYXczaxyKjkF7CHJf1n1c1JZiBSg97DogAqJ9rdrneens7VUtqGIdm6KULt1+f9oPLhgR8cA1+zBIMgaKqsUjss2/pvTQt34jmgW0rcQL81/4v5UQn8P4EM1swp7+TR5Yg+fUOh4UXnCWeta1+ZOQq6Nv1LcigFJBIFtpZEJThEEdZuoAfEPJrqrqR3NR59FpzbkTjMiDJXCzbR6ojJ4ViVjiR51Ert6688FnVpVHvHgzSnSJode5"
  description = "ssh-keygen -t ed25519"
}

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

variable "vm_web_preemptible" {
  type        = bool
  default     = true
}

variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
}
