### Generic EBS Volume Terraform module

Note that this module doesn't volume attachments. They should be created
separetely, see
https://www.terraform.io/docs/providers/aws/r/volume_attachment.html.

#### Example usage

```
module "my-volume" {
   source      = "git::ssh://git@gitlab.rmsrohan.com/cloud/terraform-ebs-volume.git"
   az          = "eu-central-1a"
   product     = "devops"
   environment = "production"
   cost_center = "15607-61"
   owner       = "devops@rmsrohan.com"
   role        = "gitlab-logs"
   size        = 120
   zone        = "private"
}

resource "aws_volume_attachment" "gitlab-logs-attachment" {
  device_name = "/dev/sdj"
  volume_id   = "${module.my-volume.ebs_volume_id}"
  instance_id = "${element(module.gitlab.instance_ids, 0)}"
}

```
