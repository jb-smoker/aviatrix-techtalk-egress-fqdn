# Software engineers modify this file only
locals {
  egress_rules = {
    tcp = {
      "*.aviatrix.com" = "443"
    }
    udp = {
    }
  }
}
