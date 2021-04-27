locals {
  egress_rules = {
    tcp = {
      "*.aviatrix.com" = "443"
      "*.google.com"   = "443"
    }
    udp = {
      "dns.google.com" = "53"
    }
  }
}
