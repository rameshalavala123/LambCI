### Generic LB Terraform module

This module wraps aws_lb resource to automatically pull correct subnet
IDs and set required tags. You are supposed to managed listeners, target
groups etc outside of this module.

Module returns three outputs: `id`, `dns_name` and `zone_id`.

#### Example usage

```
module "my-lb" {
   source              = "git::ssh://git@gitlab.rmsrohan.com/cloud/terraform-lb.git"
   security_group_ids  = [ "${module.gitlab-elb-sg.security_group_id}" ]
   vpc_id              = "vpc-1b72647c"
   subnet_type         = "private"
   product             = "devops"
   environment         = "production"
   cost_center         = "15607-61"
   owner               = "devops@rmsrohan.com"
   role                = "gitlab"
   expiration_date     = "20/06/18"
   idle_timeout        = 3600
}
```
