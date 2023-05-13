output "private_subnets" {
  value = module.vpc.private_subnets
}

output "private_subnet_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "setup_kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
}

output "external_dns_role_arn" {
  value = module.external_dns_irsa.iam_role_arn
}

output "route53_zone_name" {
  value = module.route53_zones.route53_zone_name
}

output "route53_zone_name_servers" {
  value = module.route53_zones.route53_zone_name_servers
}
