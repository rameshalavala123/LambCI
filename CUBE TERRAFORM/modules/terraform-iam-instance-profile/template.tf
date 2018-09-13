resource "aws_iam_role" "role" {
  name = "${var.role_name}"

  assume_role_policy = "${var.assume_role_policy == "" ? file("${path.module}/assume-role-policy.json") : var.assume_role_policy}"
}

resource "aws_iam_role_policy" "role-policy" {
  name   = "BasePolicy${var.role_name}"
  role   = "${aws_iam_role.role.id}"
  policy = "${var.role_policy}"
}

resource "aws_iam_role_policy_attachment" "extra-policies-attachment" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${element(var.extra_policies, count.index)}"
  count      = "${var.number_of_extra_policies}"
}
