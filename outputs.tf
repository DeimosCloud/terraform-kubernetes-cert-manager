output "issuer" {
  value       = local.issuer_name
  description = "Name of the Issuer to be used in annotations"
}

output "cert_manager_namespace" {
  description = "the kubernetes namespace of the cert-manager release"
  value       = helm_release.cert_manager.namespace
}

output "cert_issuer_namespace" {
  description = "the kubernetes namespace of the cert-issuer release"
  value       = helm_release.cert_issuer.namespace
}

output "cert_manager_release_name" {
  description = "name of the Cert Manager release"
  value       = helm_release.cert_manager.name
}

output "cert_issuer_release_name" {
  description = "name of the cert-issuer release"
  value       = helm_release.cert_issuer.name
}
