variable "name" {
	description = "Name of the Role"
	type        = string
}

variable "rule" {
	description = "Role Rules"
	type        = list
}

variable "namespace" {
  description = "Jenkins worload namespace"
  type     = string
}

