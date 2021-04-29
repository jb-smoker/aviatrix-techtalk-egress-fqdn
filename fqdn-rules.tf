# Software engineers modify this file only
locals {
  egress_rules = {
    tcp = {
      "*.aviatrix.com"      = "443"
      "*.stackoverflow.com" = "443"
      "epsn.com"            = "443"
    }
    udp = {
      "dns.google.com" = "53"
    }
  }
}
