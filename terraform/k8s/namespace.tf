resource "kubernetes_namespace" "app" {
  metadata {
    name = "three-tier"
  }
}
