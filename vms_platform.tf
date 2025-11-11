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

variable "vm_db_preemptible" {
  type        = bool
  default     = true
}

variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
}

