variable "name" {
  description = "Jenkins worload name"
  type     = string
}

variable "namespace" {
  description = "Jenkins worload namespace"
  type     = string
}

variable "jenkins_ports" {
  description = "Jenkins Port"
  type        = list
}


variable "type" {
  description = "Jenkins service type"
  type     = string
  default  = "NodePort"
}

variable "image" {
  description = "Jenkins service image"
  type     = string
}

variable "volume_mounts" {
  description = "Volume Mounts of the jenkins"
  type        = list
}

variable "claim_name" {
  description = "pvc name"
  type     = string
}

variable "service_account_name" {
  description = "jenkins service account name"
  type     = string  
}

variable "external_ips" {
  description = "External IPs"
  type     = list(string)
  default  = [ "172.16.116.129" ]
}