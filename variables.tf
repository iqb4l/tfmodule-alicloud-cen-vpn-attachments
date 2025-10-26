variable "cen_id" {
  type        = string
  description = "ID of the CEN instance"
}

variable "transit_router_id" {
  type        = string
  description = "ID of the Transit Router"
}

variable "route_table_id" {
  type        = string
  description = "ID of the Transit Router Route Table"
}

variable "vpn_attachments" {
  description = "Map of VPN Gateway attachments to connect to CEN Transit Router"
  type = map(object({
    vpn_gateway_id             = string
    vpn_owner_id               = string
    attachment_name            = string
    description                = optional(string)
    auto_publish_route_enabled = optional(bool)
    charge_type                = optional(string)
  }))
  default = {}
}

variable "enable_route_table_association" {
  description = "Enable route table association for VPN attachments"
  type        = bool
  default     = true
}

variable "enable_route_table_propagation" {
  description = "Enable route table propagation for VPN attachments"
  type        = bool
  default     = true
}
