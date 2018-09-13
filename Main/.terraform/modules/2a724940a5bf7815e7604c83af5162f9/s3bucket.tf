resource "aws_cloudtrail" "test_cloud_trail" {
  #name                          = "tf-trail"
  name ="${var.cloudtrail}"
  #keep name as variable
  s3_bucket_name                = "${aws_s3_bucket.tf-s3test.id}"
  #s3_key_prefix                 = "prefix"
  s3_key_prefix ="${var.prefix}"
  include_global_service_events = "${var.globalservice}"
  is_multi_region_trail         = "${var.multiregion}"
  event_selector {
    #read_write_type = "ReadOnly"
    read_write_type = "${var.type}"
    include_management_events = "${var.events}"
  }
}

resource "aws_s3_bucket" "tf-s3test" {
  #bucket        = "tf-test-s3"
  bucket= "${var.bucket}"
  force_destroy = "${var.destroy}"
 policy="${file("${path.module}/s3-policy.json")}"
 
}
/*resource "aws_s3_bucket_policy" "policy" {
  bucket = "${aws_s3_bucket.policy.id}"
  policy="${file("${path.module}/s3-policy.json")}"
  }*/
