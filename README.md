# DevOps CI/CD-GitOps Workflow

This repository demonstrates a complete CI/CD pipeline using **DevOps** and **GitOps** practices. It integrates tools like GitHub Actions, Argo CD, Kubernetes, Helm, Terraform, Ansible, and KEDA to automate code build, deployment, and infrastructure reconciliation. For the Observability part, Prometheus & Grafana is being used.

## 🧰 Tools & Technologies

- **Jenkins & GitHub Actions** – for CI part
- **Argo CD** – GitOps agent for continuous delivery
- **Kubernetes** – container orchestration
- **Helm** – templating and managing Kubernetes manifests
- **Ansible** – installing some post-k8s-installation tools like Gateway API CRDs, etc
- **Terraform** – installing important tools like Jenkins & Kubernetes Gateway API on k8s
- **Prometheus & Grafana** – For Observability
- **KEDA** – used as HPA with Prometheus metric scaler

## 🛠️ Workflow Overview

1. **Code Commit**: Developer pushes code and Helm manifests to GitHub.
2. **CI (GitHub Actions & Jenkins)**:
   - Build Docker image
   - Push to container registry (e.g., Docker Hub)
   - Update Helm chart values with image tag
3. **GitOps (Argo CD)**:
   - Watches the Git repo for changes
   - Syncs manifests to Kubernetes cluster
4. **Deployment**:
   - Kubernetes reconciles the desired state
   - Application is deployed/updated
5. **Monitoring & Rollback**:
   - Argo CD UI helps with tracking changes and rolling back if needed.
6. **Observability & Scaling**:
   - Prometheus, Grafana helps in the monitoring part, I've also added some Prometheus rules. KEDA is being used with Prometheus scaler for service HPA.