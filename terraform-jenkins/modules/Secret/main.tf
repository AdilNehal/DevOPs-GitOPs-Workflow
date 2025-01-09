resource "kubernetes_secret" "jenkins_secret" {
  metadata {
    name = "${var.name}-secet-token"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/service-account.name" = var.service_account_name
    }
  }
  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}