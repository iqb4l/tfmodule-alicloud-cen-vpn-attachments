output "transit_router_vpn_attachment_ids" {
  description = "Map of Transit Router VPN Attachment IDs"
  value = {
    for key, attachment in alicloud_cen_transit_router_vpn_attachment.this :
    key => attachment.id
  }
}

output "vpn_attachment_details" {
  description = "Complete details of Transit Router VPN Attachments"
  value = {
    for key, attachment in alicloud_cen_transit_router_vpn_attachment.this :
    key => {
      id                    = attachment.id
      status                = attachment.status
      transit_router_id     = attachment.transit_router_id
      vpn_id                = attachment.vpn_id
      resource_type         = attachment.resource_type
    }
  }
}

output "vpn_association_ids" {
  description = "Map of VPN route table association IDs"
  value = {
    for key, assoc in alicloud_cen_transit_router_route_table_association.vpn_associations :
    key => assoc.id
  }
}

output "vpn_propagation_ids" {
  description = "Map of VPN route table propagation IDs"
  value = {
    for key, prop in alicloud_cen_transit_router_route_table_propagation.vpn_propagations :
    key => prop.id
  }
}
