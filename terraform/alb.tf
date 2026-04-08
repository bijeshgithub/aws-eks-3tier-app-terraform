resource "helm_release" "alb_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = module.eks.cluster_name
  }

  set {
    name = "region"
    value = "us-east-1"
  }

  set {
    name  = "vpcId"
    value = "aws_vpc.main.id"
  }
  

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  depends_on = [module.eks]
}
