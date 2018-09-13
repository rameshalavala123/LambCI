module "couldtrail"{
    source ="./s3bucket.tf"
    globalservice="${var.globalservice}"
    multiregion="${var.multiregion}"
    type="${var.type}"
    events="${var.events}"
    destroy="${var.destroy}"
}
