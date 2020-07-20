# Cert-manager
A terraform module to setup Cert-Manager for issuing ACME Certificates to services running in cluster

## Usage

```hcl
# Kubernetes Provider settings for AKS
provider kubernetes {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  load_config_file       = false
}

# Kubernetes Provider settings for AKS
provider helm {
  kubernetes {
    host                   = module.aks.host
    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
    load_config_file       = false
  }
}

module "cert_manager" {
  source             = "../modules/cert_manager"
  cert_manager_email = var.cert_manager_email
  namespace          = "cert-manager"

  module_depends_on = [module.aks]
}

```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| helm | >=1.2.3 |
| kubernetes | >=1.11.3 |

## Providers

| Name | Version |
|------|---------|
| helm | >=1.2.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_server | The acme server to use. ACME Production server: https://acme-v02.api.letsencrypt.org/directory and ACME Staging: https://acme-staging-v02.api.letsencrypt.org/directory | `string` | `"https://acme-staging-v02.api.letsencrypt.org/directory"` | no |
| cert\_manager\_chart\_version | The version of Cert-manager to install | `string` | `"v0.15.1"` | no |
| cert\_manager\_email | Email to be used for ACME | `any` | n/a | yes |
| cert\_manager\_namespace | The namespace to deploy cert-manager and CRDs to | `any` | `null` | no |
| ingress\_class | The ingress class to monitor for ingress | `string` | `"nginx"` | no |
| module\_depends\_on | Resources that the module depends on, AKS, namespace creation etc | `any` | `null` | no |
| namespace | The namespace to deploy the cert-manager to kubernetes object | `string` | `"default"` | no |
| suffix | The suffix to use when creating resources | `any` | `null` | no |
| tags | Tags to be passed to created instances | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cert\_issuer\_namespace | the kubernetes namespace of the cert-issuer release |
| cert\_issuer\_release\_name | name of the cert-issuer release |
| cert\_manager\_namespace | the kubernetes namespace of the cert-manager release |
| cert\_manager\_release\_name | name of the Cert Manager release |
| issuer | Name of the Issuer to be used in annotations |
