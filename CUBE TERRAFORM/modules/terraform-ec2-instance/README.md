### Generic EC2 instance Terraform module

Module returns three outputs: `instance_ids`, `private_ips` and `public_ips`.

If you need Windows instance, set "ami" to "windows". (Default is Windows 2012 R2 Edition)
If you need MSSQL instance, set "ami" to "mssql-dev" for MSSQL Developer Edition, "mssql-std" for MSSQL Standard Edition
Default is "linux".

#### Example usage

```
module "my-ec2-instance" {
   source              = "git::ssh://git@gitlab.rmsrohan.com/cloud/terraform-ec2-instance.git"
   vpc_id              = "vpc-1b72647c"
   subnet_type         = "private"
   iam_role            = "some-role-other-than-base"
   number_of_instances = 2
   product             = "devops"
   environment         = "production"
   cost_center         = "15607-61"
   owner               = "fsedevops@rmsrohan.com"
   role                = "gitlab"
   expiration_date     = "20/06/18"
}
```
