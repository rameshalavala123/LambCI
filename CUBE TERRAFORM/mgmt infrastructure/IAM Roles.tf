module "pnl-test-Admin-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-Admin"

  role_policy = "${file("${path.module}/policies/AdministratorAccess.json")}"

  number_of_extra_policies = 0

  extra_policies = []
}

module "pnl-test-audit-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-SecurityAudit"

  role_policy = "${file("${path.module}/policies/SecurityAudit.json")}"

  number_of_extra_policies = 0

  extra_policies = []
}

module "pnl-test-billing-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-billing"

  role_policy = "${file("${path.module}/policies/billing.json")}"

  number_of_extra_policies = 0

  extra_policies = []
}

module "pnl-test-dev-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-dev"

  role_policy              = "${file("${path.module}/policies/AmazonEC2FullAccess.json")}"
  number_of_extra_policies = 6

  extra_policies = [
    "${aws_iam_policy.RDSAccess.arn}",
    "${aws_iam_policy.ASFullAccess.arn}",
    "${aws_iam_policy.ContainerRegistry.arn}",
    "${aws_iam_policy.ContainerService.arn}",
    "${aws_iam_policy.VPCAccess.arn}",
    "${aws_iam_policy.S3Access.arn}",
  ]
}

module "pnl-test-secadmin-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-secadmin"

  role_policy              = "${file("${path.module}/policies/AWSWAFFullAccess.json")}"
  number_of_extra_policies = 7

  extra_policies = [
    "${aws_iam_policy.acmAccess.arn}",
    "${aws_iam_policy.IAMFAccess.arn}",
    "${aws_iam_policy.CloudTrailFAccess.arn}",
    "${aws_iam_policy.SCAccess.arn}",
    "${aws_iam_policy.VPCAccess.arn}",
    "${aws_iam_policy.KMSPUAccess.arn}",
    "${aws_iam_policy.IAMSSHAccess.arn}",
  ]
}

resource "aws_iam_policy" "IAMFAccess" {
  name        = "IAMFullAccess"
  description = "An IAM policy"

  policy = "${file("${path.module}/policies/IAMFullAccess.json")}"
}

resource "aws_iam_policy" "CloudTrailFAccess" {
  name        = "CloudTrailFullAccess"
  description = "A Cloudtrail policy"

  policy = "${file("${path.module}/policies/AWSCloudTrailFullAccess.json")}"
}

resource "aws_iam_policy" "SCAccess" {
  name        = "SecurityAuditAccess"
  description = "A SecurityAudit policy"

  policy = "${file("${path.module}/policies/SecurityAudit.json")}"
}

resource "aws_iam_policy" "KMSPUAccess" {
  name        = "KeyManagementAccess"
  description = "A KeyManagement power user policy"

  policy = "${file("${path.module}/policies/AWSKeyManagementServicePowerUser.json")}"
}

resource "aws_iam_policy" "IAMSSHAccess" {
  name        = "IAMUserSSHKeysAccess"
  description = "A IAM user SSH Keys policy"

  policy = "${file("${path.module}/policies/IAMUserSSHKeys.json")}"
}

module "pnl-test-superuser-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-superuser"

  role_policy              = "${file("${path.module}/policies/AmazonS3FullAccess.json")}"
  number_of_extra_policies = 6

  extra_policies = [
    "${aws_iam_policy.RDSAccess.arn}",
    "${aws_iam_policy.ASFullAccess.arn}",
    "${aws_iam_policy.EC2Access.arn}",
    "${aws_iam_policy.ContainerRegistry.arn}",
    "${aws_iam_policy.ContainerService.arn}",
    "${aws_iam_policy.VPCAccess.arn}",
  ]
}

resource "aws_iam_policy" "VPCAccess" {
  name        = "VPCFullAccess"
  description = "A VPC policy"

  policy = "${file("${path.module}/policies/AmazonVPCFullAccess.json")}"
}

resource "aws_iam_policy" "RDSAccess" {
  name        = "RDSFullAccess"
  description = "A RDS policy"

  policy = "${file("${path.module}/policies/AmazonRDSFullAccess.json")}"
}

resource "aws_iam_policy" "ASFullAccess" {
  name        = "AutoScalingFullAccess"
  description = "A ASG policy"

  policy = "${file("${path.module}/policies/AutoScalingFullAccess.json")}"
}

resource "aws_iam_policy" "EC2Access" {
  name        = "EC2FullAccess"
  description = "A EC2 policy"

  policy = "${file("${path.module}/policies/AmazonEC2FullAccess.json")}"
}

resource "aws_iam_policy" "ContainerRegistry" {
  name        = "ContainerRegistryFullAccess"
  description = "A Container registry policy"

  policy = "${file("${path.module}/policies/AmazonEC2ContainerRegistryFullAccess.json")}"
}

resource "aws_iam_policy" "ContainerService" {
  name        = "ContainerServiceFullAccess"
  description = "A Container Service policy"

  policy = "${file("${path.module}/policies/AmazonEC2ContainerServiceFullAccess.json")}"
}

module "pnl-test-sysadmin-role" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-sysadmin"

  role_policy              = "${file("${path.module}/policies/AmazonEC2FullAccess.json")}"
  number_of_extra_policies = 9

  extra_policies = [
    "${aws_iam_policy.RDSAccess.arn}",
    "${aws_iam_policy.ASFullAccess.arn}",
    "${aws_iam_policy.ContainerRegistry.arn}",
    "${aws_iam_policy.ContainerService.arn}",
    "${aws_iam_policy.VPCAccess.arn}",
    "${aws_iam_policy.S3Access.arn}",
    "${aws_iam_policy.CloudtrailRAccess.arn}",
    "${aws_iam_policy.IAMRAccess.arn}",
    "${aws_iam_policy.acmAccess.arn}",
  ]
}

resource "aws_iam_policy" "S3Access" {
  name        = "S3FullAccess"
  description = "A S3 policy"

  policy = "${file("${path.module}/policies/AmazonS3FullAccess.json")}"
}

resource "aws_iam_policy" "CloudtrailRAccess" {
  name        = "CloudtrailreadAccess"
  description = "A Cloudtrail Read policy"

  policy = "${file("${path.module}/policies/AWSCloudTrailReadOnlyAccess.json")}"
}

resource "aws_iam_policy" "IAMRAccess" {
  name        = "IAMreadAccess"
  description = "An IAM Read policy"

  policy = "${file("${path.module}/policies/IAMReadOnlyAccess.json")}"
}

resource "aws_iam_policy" "acmAccess" {
  name        = "CertificateManagerFullAccess"
  description = "An Certificate Manager policy"

  policy = "${file("${path.module}/policies/AWSCertificateManagerFullAccess.json")}"
}

module "pnl-test-users" {
  source    = "../modules/terraform-iam-instance-profile"
  role_name = "pnl-test-users"

  role_policy = "${file("${path.module}/policies/CustomIAMPolicy.json")}"

  number_of_extra_policies = 0

  extra_policies = []
}
