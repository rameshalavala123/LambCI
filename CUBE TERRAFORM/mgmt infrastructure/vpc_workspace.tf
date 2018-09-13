module "workspace" {
  source      = "../modules/terraform-vpc-workspace"
  product     = "${var.product}"
  cost_center = "${var.cost_center}"
  owner       = "${var.owner}"
}

resource "aws_vpc_peering_connection" "connect" {
  peer_owner_id = "${var.aws_account_id}"
  peer_vpc_id   = "${module.workspace.vpc_id}"
  vpc_id        = "${module.main.vpc_id}"
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
