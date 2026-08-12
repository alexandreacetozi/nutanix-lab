terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 1.9"
    }
  }

  required_version = ">= 1.5"
}
