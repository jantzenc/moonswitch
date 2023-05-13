variable "environment" {
  type    = string
  default = "Dev"
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc" {
  type = object({
    cidr                = string
    private_subnets     = list(string)
    public_subnets      = list(string)
    database_subnets    = list(string)
    elasticache_subnets = list(string)
  })
  default = {
    cidr                = "10.0.0.0/16"
    private_subnets     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
    public_subnets      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    database_subnets    = ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
    elasticache_subnets = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
  }
}
