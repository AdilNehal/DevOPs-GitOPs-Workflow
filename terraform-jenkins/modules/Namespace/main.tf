resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = {
      name = var.namespace
    }

    labels = {
      mylabel = var.namespace
    }

    name = var.namespace
  }
}