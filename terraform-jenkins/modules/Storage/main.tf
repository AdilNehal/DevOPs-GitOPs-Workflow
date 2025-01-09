resource "kubernetes_persistent_volume_v1" "pv" {
    metadata {
        name = var.pv_name
        labels = var.pv_labels
    }
    spec {
    capacity = {
        storage = var.pv_storage
    }
    access_modes = var.pv_access_modes
    mount_options = var.pv_mount_options
    storage_class_name = var.pv_storage_class_name
    persistent_volume_source {
        host_path {
            path = var.pv_persistent_volume_sources_path
        }
    }
  }

}


resource "kubernetes_persistent_volume_claim_v1" "pvc" {
    metadata {
        name = var.pvc_name
        namespace = var.namespace
    }
    spec {
        access_modes = var.pvc_access_modes
        storage_class_name = var.pv_storage_class_name
        resources {
        requests = {
            storage = var.pvc_storage
        }
        }
        volume_name = var.pv_name
    }

    depends_on = [
        kubernetes_persistent_volume_v1.pv
    ]
}