resource "aws_cloudtrail" "test_cloud_trail" {
  name                          = "tf-trail"
  s3_bucket_name                = "${aws_s3_bucket.tf-s3test.id}"
  s3_key_prefix                 = "prefix"
  include_global_service_events = "${var.globalservice}"
  is_multi_region_trail         = "${var.multiregion}"
  event_selector {
    #read_write_type = "ReadOnly"
    read_write_type = "${var.type}"
    include_management_events = "${var.events}"
  }
}

resource "aws_s3_bucket" "tf-s3test" {
  bucket        = "tf-test-s3"
  force_destroy = "${var.destroy}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::tf-test-s3"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::tf-test-s3/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
		{
            "Sid": "1",
            "Effect": "Allow",
             "Action": [
                "s3:GetBucketLocation",
            "s3:GetBucketVersioning",
            "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket"
                ],
            "Principal": {
                "AWS": [
                    "arn:aws:iam::333641427962:root"
                ]
            },
                        "Resource": [
                "arn:aws:s3:::tf-test-s3/*",
                "arn:aws:s3:::tf-test-s3"
            ]
        }

    ]

}
POLICY
}