module "vpc"{
    source ="./modules/vpc"
    vpc_cidr="${var.vpc_cidr}"
    hostname="${var.hostname}"
    tagname_vpc="${var.tagname_vpc}"
    public_subnet_cidr= "${var.public_subnet_cidr}"
    private_subnet_cidr="${var.private_subnet_cidr}"
    availability_zones_public="${var.availability_zones_public}"
    #availability_zones_private="${var.availability_zones_private}"
    tagname_publicsub="${var.tagname_publicsub}"
    tagname_privatesub="${var.tagname_privatesub}"
    tagname_gw="${var.tagname_gw}"
    tagname_rt="${var.tagname_rt}"
    map_public_ip="${var.map_public_ip}"
}

module "instance" {
    source = "./modules/ec2"
    subnet_id = "${module.vpc.public-subnet_id}"
    security_group=["${module.securitygroup.sg_id}"]
    key_name="${var.key_name}"
    instance_type="${var.instance_type}"
    ami="${var.ami}"
    tag_ins="${var.tag_ins}"
}
module "securitygroup" {
    source="./modules/security-group"
    vpc_id="${module.vpc.vpc_id}"
    tag_sg="${var.tag_sg}"
}
module "elb"{
    source="./modules/elb"
    vpc_id="${module.vpc.vpc_id}"
    #instance_id="${module.instance.instance_id}"
    target_id="${module.instance.instance_id}"
    port="${var.port}"
    protocol="${var.protocol}"
    balancer_type="${var.balancer_type}"
    #elb="${module.elb.elb_id}"
    subnet_id="${module.vpc.public-subnet_id}"
    cross_zone="${var.cross_zone}"
    protection="${var.protection}"
}