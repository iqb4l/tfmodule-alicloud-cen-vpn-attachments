# Attach VPN Gateways to CEN Transit Router
resource "alicloud_cen_transit_router_vpn_attachment" "this" {
  for_each = var.vpn_attachments
  
  cen_id                                = var.cen_id
  transit_router_id                     = var.transit_router_id
  vpn_id                                = each.value.vpn_gateway_id
  vpn_owner_id                          = each.value.vpn_owner_id
  auto_publish_route_enabled            = each.value.auto_publish_route_enabled
  charge_type                           = each.value.charge_type
  transit_router_attachment_name        = each.value.attachment_name
}

# Associate Route Tables for VPN Attachments
resource "alicloud_cen_transit_router_route_table_association" "vpn_associations" {
  for_each = var.enable_route_table_association ? alicloud_cen_transit_router_vpn_attachment.this : {}
  
  transit_router_route_table_id = var.route_table_id
  transit_router_attachment_id  = each.value.id
  
  depends_on = [alicloud_cen_transit_router_vpn_attachment.this]
}

# Propagate Routes for VPN Attachments
resource "alicloud_cen_transit_router_route_table_propagation" "vpn_propagations" {
  for_each = var.enable_route_table_propagation ? alicloud_cen_transit_router_vpn_attachment.this : {}
  
  transit_router_route_table_id = var.route_table_id
  transit_router_attachment_id  = each.value.id
  
  depends_on = [alicloud_cen_transit_router_vpn_attachment.this]
}
