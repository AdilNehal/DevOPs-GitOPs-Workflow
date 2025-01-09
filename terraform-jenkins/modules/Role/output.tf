output "jenkins_service_account_name" {
    value = kubernetes_service_account.jenkins_ServiceAccount.metadata.0.name
}