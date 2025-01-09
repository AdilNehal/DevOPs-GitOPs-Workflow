module "namespace" {
  source    = "./modules/Namespace"

  namespace = var.namespace
}

module "pv" {
  source = "./modules/Storage"

  namespace                         = var.namespace
  pv_labels                         = var.jenkins_pv_labels
  pv_mount_options                  = var.jenkins_pv_mount_options
  pv_name                           = var.jenkins_pv_name
  pv_storage                        = var.jenkins_pv_storage
  pv_access_modes                   = var.jenkins_pv_access_modes
  pv_storage_class_name             = var.jenkins_pv_storage_class_name
  pv_persistent_volume_sources_path = var.jenkins_pv_persistent_volume_sources_path
  pvc_name                          = var.jenkins_pvc_name
  pvc_storage                       = var.jenkins_pvc_storage
  pvc_access_modes                  = var.jenkins_pvc_access_modes

  depends_on = [
    module.namespace
  ]
}

module "role" {
  source = "./modules/Role"

  namespace = var.namespace
  name      = var.jenkins_name
  rule      = var.jenkins_role_rules
}

module "secret" {
  source = "./modules/Secret"

  namespace = var.namespace
  name      = var.jenkins_name
  service_account_name = module.role.jenkins_service_account_name
}

module "jenkins" {
  source = "./modules/Deployment"

  namespace          = var.namespace
  image              = var.jenkins_image
  name               = var.jenkins_name
  jenkins_port       = var.jenkins_port
  jnlp_port          = var.jnlp_port
  volume_mounts      = var.jenkins_volumes_mounts
  claim_name         = var.jenkins_pvc_name
  service_account_name = module.role.jenkins_service_account_name

  depends_on = [
    module.pv,
    module.secret,
    module.role
  ]
}

