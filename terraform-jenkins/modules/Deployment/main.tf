resource "kubernetes_service_v1" "jenkins_service" {

  metadata {
    name      = "${var.name}-service"
    namespace = var.namespace
    labels = {
      name = "${var.name}-service"
    }
  }

  spec {
    selector = {
      app = var.name
    }


    dynamic "port" {
      for_each = var.jenkins_ports
      content {
        name = port.value["name"]
        port = port.value["container_port"]
      }
    } 
  
    external_ips = var.external_ips
    type = var.type
  }
}

resource "kubernetes_deployment_v1" "jenkins_deployment" {
  
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = {
      name = var.name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {

        service_account_name = var.service_account_name
        
        container {
          image = var.image
          name  = var.name
          
          dynamic "port" {
            for_each = var.jenkins_ports
            content {
              name = port.value["name"]
              container_port = port.value["container_port"]
            }
          } 

          dynamic "volume_mount" {
            for_each = var.volume_mounts
            content {
              name       = volume_mount.value["name"]
              mount_path = volume_mount.value["mount_path"]
              sub_path   = volume_mount.value["sub_path"]
            }
          }
        }

				volume {
          name = "${var.name}-volume"
          persistent_volume_claim {
            claim_name = var.claim_name
          }
				}

        volume {
          name = "docker-socket"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
      }
    }
  }
  depends_on = [
    kubernetes_service_v1.jenkins_service
  ]
}