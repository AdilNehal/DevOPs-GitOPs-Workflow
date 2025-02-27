variable "gateway_name" {
  description = "Gateway Name"
  type     = string
  default  = "istio-ingress-gateway"
}

variable "gateway_namespace" {
  description = "gateway namespace"
  type     = string
  default  = "istio-system"
}

variable "app_route_name" {
  description = "Route Name"
  type     = string
  default  = "cicdroute"
}

variable "app_route_namespace" {
  description = "app_route namespace"
  type     = string
  default  = "ci"
}

variable "app_route_rules" {
  description = "route rules"
  type        = list(any)
  default     = [
    {
      path_type      = "PathPrefix",
      path_value     = "/jenkins",
      service_name   = "jenkins-service",
      service_namespace = "ci",
      service_port   = 8080
    },
    {
      path_type      = "PathPrefix",
      path_value     = "/sonarqube",
      service_name   = "quality-sonarqube",
      service_namespace = "ci",
      service_port   = 9000
    },
    {
      path_type      = "PathPrefix",
      path_value     = "/argocd",
      service_name   = "argocd-server",
      service_namespace = "argocd",
      service_port   = 81
    },
  ]
}

variable "app_route_host" {
  description = "route host"
  type        = list(string)
  default     = ["adil.homelab.com"]
}

variable "grant_route_name" {
  description = "Route Name"
  type     = string
  default  = "argocd-reference-grant"
}

variable "grant_route_namespace" {
  description = "cd_route namespace"
  type     = string
  default  = "argocd"
}