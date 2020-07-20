variable "tags" {
  description = "Tags to be passed to created instances"
  default     = {}
}

variable "module_depends_on" {
  description = "Resources that the module depends on, AKS, namespace creation etc"
  default     = null
}

variable "namespace" {
  description = "The namespace to deploy the cert-manager to kubernetes object"
  default     = "default"
}

variable "cert_manager_chart_version" {
  description = "The version of Cert-manager to install"
  default     = "v0.15.1"
}

variable "cert_manager_namespace" {
  description = "The namespace to deploy cert-manager and CRDs to"
  default     = null
}

variable "cert_manager_email" {
  description = "Email to be used for ACME"
}

variable "suffix" {
  description = "The suffix to use when creating resources"
  default     = null
}

# Staging Server
# server: https://acme-staging-v02.api.letsencrypt.org/directory
# Production Server
#  server: "https://acme-v02.api.letsencrypt.org/directory"
variable "acme_server" {
  description = "The acme server to use. ACME Production server: https://acme-v02.api.letsencrypt.org/directory and ACME Staging: https://acme-staging-v02.api.letsencrypt.org/directory"
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "ingress_class" {
  description = "The ingress class to monitor for ingress"
  default     = "nginx"
}
