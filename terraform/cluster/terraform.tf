terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  region = var.region

  profile = local.eks_account_profile_name

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = var.environment
    }
  }
}

provider "aws" {
  alias  = "route53_account"
  region = var.region

  profile = local.route53_account_profile_name

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = var.environment
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}