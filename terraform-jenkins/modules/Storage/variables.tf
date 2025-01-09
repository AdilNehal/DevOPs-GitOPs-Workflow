variable "pv_name" {
  description = "persistent volume name"
  type        = string
}

variable "pv_labels" {
  description = "PV Labels"
  type        = map(any)
}

variable "pv_storage" {
  description = "PV Labels"
  type        = string
}

variable "pv_access_modes" {
  description = "Access modes of the jenkins Persistent Volume"
  type        = list(any)
}

variable "pv_mount_options" {
  description = "PV Mount Options"
  type        = list(any)
}

variable "pv_storage_class_name" {
  description = "Storage Class Name of the Jenkins Persistent Volume"
  type        = string
}

variable "pvc_name" {
  description = "Name of the jenkins Persistent Volume Claim"
  type        = string
}

variable "namespace" {
  description = "namespace to deploy"
  type        = string
}

variable "pvc_access_modes" {
  description = "Access modes of the Jenkins Persistent Volume Claim"
  type        = list(any)
}

variable "pvc_storage" {
  description = "Size of the Jenkins Persistent Volume Claim Storage"
  type        = string
}

variable "pv_persistent_volume_sources_path" {
  description = "Persistent Volume storage hostpath path"
  type        = string
}