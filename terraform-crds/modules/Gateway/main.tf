resource "kubernetes_secret" "domain_secret" {
  metadata {
    name = "${var.gateway_name}-domain-secret"
    namespace = var.gateway_namespace
  }

  data = {
    "tls.crt" = file("${path.module}/self-signed/mydomain.crt")
    "tls.key" = file("${path.module}/self-signed/mydomain.key")
  }

  type = "kubernetes.io/tls"
}


resource "kubernetes_manifest" "istio_gateway" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1"
    kind       = "Gateway"
    metadata = {
      name      = var.gateway_name
      namespace = var.gateway_namespace
    }
    spec = {
      gatewayClassName = "istio"
      listeners = [{
        name     = "https"
        protocol = "HTTPS"
        port     = 443
        hostname = var.app_route_host  
        tls = {
          mode = "Terminate"
          certificateRefs = [{
            kind = "Secret"
            group = ""
            name = "${var.gateway_name}-domain-secret"  
          }]
        }
        allowedRoutes = {
          namespaces = {
            from = "All"
          }
        }
      }]
    }
  }
}
