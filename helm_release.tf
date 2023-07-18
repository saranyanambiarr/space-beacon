#provider "kubectl" {
#  host                   = var.eks_cluster_endpoint
#  cluster_ca_certificate = base64decode(var.eks_cluster_ca)
#  token                  = data.aws_eks_cluster_auth.main.token
#  load_config_file       = false
#}

provider "helm" {
  kubernetes {
    config_path = pathexpand(local.kubeconfig)
  }
}

resource "helm_release" "spacebeacon" {
  name       = "spacebeacon"
  chart      = "space-beacon"
  repository = "C:/Users/Saranya/Desktop/MAYD/spacebeacon"
}