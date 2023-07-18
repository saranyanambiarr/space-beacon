locals {
  kubeconfig = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: ${data.aws_eks_cluster.cluster.endpoint}
    certificate-authority-data: ${data.aws_eks_cluster.cluster.certificate_authority[0].data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${local.cluster_name}"
EOF
}


output "kubeconfig" {
  value = local.kubeconfig
}