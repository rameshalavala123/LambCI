/*output "module-security_group_id" {
  value = "${module.securitygroup.this_security_group_id}"
}

output "this_security_group_id" {
  description = "The ID of the security group"
  value       = ["${module.securitygroup.this_security_group_id}"]
}*/
/*
output "security-group_id" {
  value = "$(module.securitygroup.security_group_ids)"
}

/*
output "sg_id" {
  value = "${element(module.securitygroup.security_group_id, 0)}"
}
output "this_security_group_id" {
  description = "The ID of the security group"
  value       = "${element(concat(module.securitygroup.*.id, list("")), 0)}"
}
*/
output "module-alb-arn" {
  value = "$(module.my-alb.arn)"
}

output "module-instance_id" {
  value = "$(module.instance.instance_ids)"
}

output "bastion_public_ip" {
  value = "${module.instance.public_ips}"
}

output "module-vpc_id" {
  value = "${module.main.vpc_id}"
}
