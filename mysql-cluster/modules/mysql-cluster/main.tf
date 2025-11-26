//
// Create a new MDB High Availability MySQL Cluster.
//
resource "yandex_mdb_mysql_cluster" "mysql" {
  name        = var.name
  environment = var.environment
  network_id  = var.network_id
  version     = "8.0"	  

  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = var.disk_type_id
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each = (var.ha ? range(var.count_ha) : [1])
    content {
      zone             = element(var.subnet_zones, host.key)
      subnet_id        = element(var.subnet_ids, host.key)
      name             = "${var.name}-db-host-${host.key + 1}"
    }
  }

}

