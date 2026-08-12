data "nutanix_cluster" "cluster" {
  name = "Lux"
}

data "nutanix_subnet" "subnet" {
  subnet_name = "LAB-NETWORK"
}

resource "nutanix_virtual_machine" "vm" {
  name         = "terraform-test-vm01"
  cluster_uuid = data.nutanix_cluster.cluster.id

  num_vcpus_per_socket = 1
  num_sockets          = 1
  memory_size_mib      = 1024

  disk_list {
    disk_size_bytes = 20 * 1024 * 1024 * 1024

    device_properties {
      device_type = "DISK"

      disk_address = {
        adapter_type = "SCSI"
        device_index = "0"
      }
    }
  }

  nic_list {
    subnet_uuid = data.nutanix_subnet.subnet.id
  }
}

output "vm_uuid" {
  value = nutanix_virtual_machine.vm.id
}
