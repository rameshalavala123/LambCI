output "instance_ids" {
  value = ["${aws_instance.ec2_instance.*.id}"]
}

output "private_ips" {
  value = ["${aws_instance.ec2_instance.*.private_ip}"]
}

output "public_ips" {
  value = ["${aws_eip.eip.*.public_ip}"]
}

output "subnet_id" {
  value = "${element(data.aws_subnet_ids.subnets.ids, 0)}"
}
