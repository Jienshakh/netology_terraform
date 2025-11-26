variable "name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "network_id" {
  type = string
}

variable "subnet_zones" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "ha" {
  type        = bool
  default     = false
}

variable "count_ha" {
  type        = number
  default     = 2
}

variable "resource_preset_id" {
  type        = string
  default     = "s1.micro"
}


variable "disk_type_id" {
  type        = string
  default     = "network-hdd"
}

variable "disk_size" {
  type        = number
  default     = 10
}

