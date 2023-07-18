output "cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS Control Plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

#output "load_balancer_hostname" {
#  value = kubernetes_service.flaskapp.status.0.load_balancer.0.ingress.0.hostname
#}

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks update-kubeconfig --region ap-south-1 update-kubeconfig --name ${module.eks.cluster_name}"
}