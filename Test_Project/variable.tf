 variable "aws_access_key" {
 #default = "AKIAION5WJO73CNDPRAQ"
 default = "AKIAJNZE45HH3YVZYB7Q"
} 
variable "aws_secret_key" {
 #default = "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"
 default = "CD93Jop56yBgy4q7Xj0QCv9H9oaeECJw9CzhDaDF"
}
variable "aws_region" {
  default = "us-east-1"
}
#vpc
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "hostname" {
  default = "true"
}
variable "tagname_vpc" {
  default = "VPC_Test"
}
#subnet
variable "public_subnet_cidr" {
    #default = "10.0.1.0/24"
    #type="list"
    default = ["10.0.1.0/24","10.0.4.0/24"]
}
variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
    #type="list"
    #default = ["10.0.2.0/24","10.0.3.0/24"]
}
variable "availability_zones_public" {
  #default     = "us-east-1a"
  default     = ["us-east-1a", "us-east-1b"]
}
variable  "availability_zones_private" {
  default     =  "us-east-1b"
}
  variable "tagname_publicsub" {
  default = "Public_Subnet"
}
variable "tagname_privatesub" {
  default = "Private_Subnet"
}
variable "map_public_ip" {
  default = "true"
}
#IGW
variable "tagname_gw" {
  default = "IGW"
}
variable "tagname_rt" {
  default = "RT"
}
variable "key_name" {
  default = "Auto"
}
variable "tag_sg" {
  default = "TF_SG"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-6871a115"
}
variable "tag_ins" {
  default = "TF_Test"
}
#elb
variable "tagname_elb" {
  default = "Test_ELB"
}
variable "balancer_type" {
  default = "network"
}
variable "internal" {
  default = "true"
}
variable "cross_zone" {
  default = "true"
}
variable "protection" {
  default = "true"
}
variable "protocol" {
  default = "TCP"
}
variable "port" {
  default = "22"
}