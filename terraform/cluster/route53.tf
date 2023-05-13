module "route53_zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.10.2"

  zones = {
    klab = {
      domain_name = "klab.fourcerofive.com"
    }
  }
}

resource "aws_route53_record" "klab" {
  provider = aws.route53_account

  zone_id = "Z0846818RKHCRXHX0PX4"
  name    = "klab"
  type    = "NS"
  ttl     = 3600
  records = module.route53_zones.route53_zone_name_servers.klab
}
