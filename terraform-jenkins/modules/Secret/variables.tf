variable "name" {
  description = "The name of the secret"
  type = string
}

variable "namespace" {
  description = "jenkins secret namespace"
  type = string
}

variable "service_account_name" {
  description = "jenkins service account"
  type = string
}