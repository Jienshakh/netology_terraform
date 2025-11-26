output "id" {
  description = "The ID of the MySQL cluster"
  value       = yandex_mdb_mysql_cluster.mysql.id
}

output "name" {
  description = "The name of the MySQL cluster"
  value       = yandex_mdb_mysql_cluster.mysql.name
}

output "fqdn" {
  description = "The fully qualified domain name of the MySQL cluster"
  value       = "c-${yandex_mdb_mysql_cluster.mysql.id}.rw.mdb.yandexcloud.net"
}

output "hosts" {
  description = "List of host FQDNs in the MySQL cluster"
  value       = [for host in yandex_mdb_mysql_cluster.mysql.host : host.fqdn]
}

output "network_id" {
  description = "The ID of the network to which the MySQL cluster belongs"
  value       = yandex_mdb_mysql_cluster.mysql.network_id
}

output "environment" {
  description = "The deployment environment of the MySQL cluster"
  value       = yandex_mdb_mysql_cluster.mysql.environment
}


output "resources" {
  description = "The resources allocated to the MySQL cluster"
  value = {
    resource_preset_id = yandex_mdb_mysql_cluster.mysql.resources[0].resource_preset_id
    disk_type_id       = yandex_mdb_mysql_cluster.mysql.resources[0].disk_type_id
    disk_size          = yandex_mdb_mysql_cluster.mysql.resources[0].disk_size
  }
}

