terraform {
  required_version = ">= 0.12"

  required_providers {
    helm       = ">=1.2.3"
    kubernetes = ">=1.11.3"
  }
}
