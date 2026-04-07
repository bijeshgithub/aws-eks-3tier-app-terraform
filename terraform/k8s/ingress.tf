resource "kubernetes_ingress_v1" "app" {
  metadata {
    name      = "app-ingress"
    namespace = kubernetes_namespace.app.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class"            = "alb"
      "alb.ingress.kubernetes.io/scheme"       = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"  = "ip"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/api/*"

          backend {
            service {
              name = kubernetes_service.backend.metadata[0].name
              port {
                number = 5000
              }
            }
          }
        }

        path {
          path = "/*"

          backend {
            service {
              name = kubernetes_service.frontend.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
