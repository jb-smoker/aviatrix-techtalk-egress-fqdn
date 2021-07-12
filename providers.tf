provider "aviatrix" {
  controller_ip = "controller.aviatrixfan.cloud"
}

terraform {
  required_version = ">= 0.14"

  required_providers {
    aviatrix = {
      source  = "aviatrixsystems/aviatrix"
      version = "~> 2.19.4"
    }
  }

  # Matching config for terraform cloud
  backend "remote" {
    organization = "hoodbu"

    workspaces {
      name = "aviatrix-techtalk-egress-fqdn"
    }
  }
}
