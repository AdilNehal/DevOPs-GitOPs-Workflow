variable "namespace" {
  description = "namespace to deploy"
  type        = string
  default     = "ci"
}

variable "jenkins_pv_labels" {
  description = "PV Labels"
  type        = map(any)
  default     = {}
}

variable "jenkins_pv_mount_options" {
  description = "PV Mount Options"
  type        = list(any)
  default     = []
}

variable "jenkins_pv_name" {
  description = "Name of the jenkins Persistent Volume"
  type        = string
  default     = "jenkinspv"
}

variable "jenkins_pv_storage" {
  description = "Size of the jenkins Persistent Volume Storage"
  type        = string
  default     = "3Gi"
}

variable "jenkins_pv_access_modes" {
  description = "Access modes of the jenkins Persistent Volume"
  type        = list(any)
  default     = ["ReadWriteMany"]
}

variable "jenkins_pv_storage_class_name" {
  description = "Storage Class Name of the Jenkins Persistent Volume"
  type        = string
  default     = "manual"
}

variable "jenkins_pv_persistent_volume_sources_path" {
  description = "Persistent Volume storage hostpath path"
  type        = string
  default     = "/home/adil-nehal/jenkins-pv"
}

variable "jenkins_pvc_name" {
  description = "Name of the jenkins Persistent Volume Claim"
  type        = string
  default     = "jenkinspvc"
}

variable "jenkins_pvc_storage" {
  description = "Size of the Jenkins Persistent Volume Claim Storage"
  type        = string
  default     = "1Gi"
}

variable "jenkins_pvc_access_modes" {
  description = "Access modes of the Jenkins Persistent Volume Claim"
  type        = list(any)
  default     = ["ReadWriteMany"]
}

variable "jenkins_name" {
  description = "Jenkins Workload Name"
  type        = string
  default     = "jenkins"
}

variable "jenkins_image" {
  description = "Jenkins Image"
  type        = string
  default     = "jenkins/jenkins:lts"
}

variable "jenkins_ports" {
  description = "Jenkins Ports"
  type        = list(any)
  default     = [
    {
      container_port = 8080,
      name           = "http"
    },
    {
      container_port = 50000,
      name           = "jnlp"
    }
  ]
}

variable "jenkins_volumes_mounts" {
  description = "Jenkins Volumes"
  type        = list(any)
  default     = [
    {
      mount_path = "/var/jenkins_home",
      name       = "jenkins-volume",
      sub_path   = "jenkins"
    },
    {
      mount_path = "/var/run/docker.sock",
      name       = "docker-socket",
      sub_path   = ""
    }
  ]
}

variable "jenkins_role_rules" {
  description = "Jenkins role rules"
  type        = list(any)
  default     = [
    {
      apiGroups       = "",
      resources       = "pods",
      verbs           = ["create","delete","get","list","patch","update","watch"]
    },
    {
      apiGroups       = "",
      resources       = "pods/exec",
      verbs           = ["create","delete","get","list","patch","update","watch"]
    },
    {
      apiGroups       = "",
      resources       = "pods/log",
      verbs           = ["get","list","watch"]
    },
    {
      apiGroups       = "",
      resources       = "secrets",
      verbs           = ["get"]
    }
  ]
}
