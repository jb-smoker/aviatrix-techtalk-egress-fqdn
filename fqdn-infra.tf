data "aviatrix_gateway" "egress" {
  # gw_name = "avx-egress-gw"
  gw_name = "aws-us-east-2-egress-fqdn-agw"
}

resource "aviatrix_fqdn" "demo" {
  fqdn_tag            = "demo"
  fqdn_enabled        = true
  fqdn_mode           = "white"
  manage_domain_names = false

  gw_filter_tag_list {
    gw_name = data.aviatrix_gateway.egress.gw_name
  }
}

resource "aviatrix_fqdn_tag_rule" "tcp" {
  for_each      = local.egress_rules.tcp
  fqdn_tag_name = aviatrix_fqdn.demo.fqdn_tag
  fqdn          = each.key
  protocol      = "tcp"
  port          = each.value
  depends_on    = [aviatrix_fqdn.demo]
}

resource "aviatrix_fqdn_tag_rule" "udp" {
  for_each      = local.egress_rules.udp
  fqdn_tag_name = aviatrix_fqdn.demo.fqdn_tag
  fqdn          = each.key
  protocol      = "udp"
  port          = each.value
  depends_on    = [aviatrix_fqdn.demo]
}
