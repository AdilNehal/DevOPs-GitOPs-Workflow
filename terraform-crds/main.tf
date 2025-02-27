module "istio-gateway" {
  source = "./modules/Gateway"

  gateway_name = var.gateway_name
  gateway_namespace = var.gateway_namespace
  app_route_host = var.app_route_host[0]
}

module "istio-route" {
  source = "./modules/Route"

  gateway_name = var.gateway_name
  gateway_namespace = var.gateway_namespace
  app_route_name = var.app_route_name
  app_route_namespace = var.app_route_namespace
  app_route_rules = var.app_route_rules
  app_route_host = var.app_route_host
  grant_route_name = var.grant_route_name
  grant_route_namespace = var.grant_route_namespace

  depends_on = [ module.istio-gateway ]
}
