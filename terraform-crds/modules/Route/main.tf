resource "kubernetes_manifest" "http_route" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1"
    kind       = "HTTPRoute"
    metadata = {
      name      = var.app_route_name
      namespace = var.app_route_namespace
    }
    spec = {
      hostnames = var.app_route_host
      parentRefs = [{
        name      = var.gateway_name
        namespace = var.gateway_namespace
      }]
      rules = [
        for service in var.app_route_rules : {
          matches = [{
            path = {
              type  = service.path_type
              value = service.path_value
            }
          }]
          backendRefs = [{
            name = service.service_name
            namespace = service.service_namespace
            port = service.service_port
          }]
        }
      ]
    }
  }
}

resource "kubernetes_manifest" "reference_grant_cd" {
  manifest = {
    "apiVersion" = "gateway.networking.k8s.io/v1beta1"
    "kind"       = "ReferenceGrant"
    "metadata" = {
      "name"      = var.grant_route_name
      "namespace" = var.grant_route_namespace
    }
    "spec" = {
      "from" = [
        {
          "group"     = "gateway.networking.k8s.io"
          "kind"      = "HTTPRoute"
          "namespace" = var.app_route_namespace
        }
      ]
      "to" = [
        {
          "group" = ""
          "kind"  = "Service"
        }
      ]
    }
  }
}
