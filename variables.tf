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
  description = "VPC network&subnet name"
}


### DB vars

variable "each_vm" {
  type = list(object({  
    vm_name         = string
    cpu             = number
    ram             = number
    disk_volume     = number 
    cores_fraction  = number
    platform        = string
    preemptible     = bool
    serial_port     = bool
  }))
  
  default = [
    {
      vm_name         = "main" 
      cpu             = 2
      ram             = 1
      disk_volume     = 10
      cores_fraction  = 20 
      platform        = "standard-v3"
      preemptible     = true
      serial_port     = true
    },
    {
      vm_name         = "replica"
      cpu             = 2
      ram             = 1
      disk_volume     = 11
      cores_fraction  = 20
      platform        = "standard-v3"
      preemptible     = true
      serial_port     = true
    }
  ]
}

### WEB vars

variable "web_resources" {
  type            = map(any)
  default = {
    zone            = "ru-central1-a"
    cpu             = 2
    ram             = 1
    cores_fraction   = 20
    platform        = true
    preemptible     = true
    serial_port     = true
  }
}
