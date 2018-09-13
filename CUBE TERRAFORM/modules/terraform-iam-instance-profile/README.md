### Generic IAM instance profile and role Terraform module

Module returns three outputs: `instance_ids`, `private_ips` and `public_ips`.

#### Example usage

```
module "my-iam-role" {
   source = "git::ssh://git@gitlab.rmsrohan.com/cloud/terraform-iam-instance-profile.git"
   role_name = "my-role"
   role_policy = "${file("my_policy.json")}"
   number_of_extra_policies = 2
   extra_policies = [
     "${aws_iam_policy.base-policies.arn}"
   ]
}
```
