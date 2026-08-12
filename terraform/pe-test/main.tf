data "nutanix_clusters" "clusters" {}

output "clusters" {
  value = data.nutanix_clusters.clusters
}
