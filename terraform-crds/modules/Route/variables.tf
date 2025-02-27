variable "app_route_name" {
  description = "Route Name"
  type     = string
}

variable "app_route_namespace" {
  description = "app_route namespace"
  type     = string
}

variable "app_route_rules" {
  description = "Route rules"
  type     = list(any)
}

variable "gateway_name" {
  description = "Gateway Name"
  type     = string
}

variable "gateway_namespace" {
  description = "gateway namespace"
  type     = string
}

variable "app_route_host" {
  description = "route host"
  type     = list(string)
}

variable "grant_route_name" {
  description = "Route Name"
  type     = string
}

variable "grant_route_namespace" {
  description = "app_route namespace"
  type     = string
}