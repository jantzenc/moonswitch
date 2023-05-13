module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "vpc-${local.env_name}"
  cidr = var.vpc.cidr

  azs                 = [data.aws_availability_zones.azs.names[0], data.aws_availability_zones.azs.names[1], data.aws_availability_zones.azs.names[2]]
  private_subnets     = var.vpc.private_subnets
  public_subnets      = var.vpc.public_subnets
  database_subnets    = var.vpc.database_subnets
  elasticache_subnets = var.vpc.elasticache_subnets

  # Nat gateways
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false


  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  vpc_flow_log_tags = {
    Name = "vpc-${local.env_name}"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
}