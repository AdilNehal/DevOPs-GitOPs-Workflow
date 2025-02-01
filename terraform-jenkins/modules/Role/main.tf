resource "kubernetes_service_account" "jenkins_ServiceAccount" {
	metadata {
		name = "${var.name}-service-account"
		namespace = var.namespace
		labels = {
			name = var.name
		}
	}
}

resource "kubernetes_role" "jenkins_role" {
  metadata {
    name = "${var.name}-role"
    namespace = var.namespace
    labels = {
      name = var.name
    }
  }

	dynamic "rule" {
		for_each = var.rule
		content {
			api_groups = [rule.value["apiGroups"]]
			resources = [rule.value["resources"]]
			verbs = rule.value["verbs"]
		}
	}
}

resource "kubernetes_role_binding" "jenkins_role_binding" {
	metadata {
		name = "${var.name}-role-binding"
		namespace = var.namespace
		labels = {
			name = var.name
		}
	}

	role_ref {
		api_group = "rbac.authorization.k8s.io"
		kind = "Role"
		name = kubernetes_role.jenkins_role.metadata[0].name
	}

	subject {
		kind = "ServiceAccount"
		name = "${var.name}-service-account"
		namespace = var.namespace
	}
}