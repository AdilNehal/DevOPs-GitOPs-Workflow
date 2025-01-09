output "pvc" {
  value = kubernetes_persistent_volume_claim_v1.pvc.metadata
}