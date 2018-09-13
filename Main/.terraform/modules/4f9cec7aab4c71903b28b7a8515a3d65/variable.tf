#vpc
variable "vpc_cidr" {
  default = ""
}
variable "hostname" {
  default = ""
}
variable "tagname_vpc" {
  default = ""
}
#subnet
variable "public_subnet_cidr" {
    #type="list"
    default = ["",""]
}
variable "private_subnet_cidr" {
    #type="list"
    default = ["",""]
}
variable "availability_zones_public" {
  default     = ["", ""]
}
variable "availability_zones_private" {
  default     =  ""
}
  variable "tagname_publicsub" {
  default = ""
}
variable "tagname_privatesub" {
  default = ""
}
#IGW
variable "tagname_gw" {
  default = ""
}
variable "tagname_rt" {
  default = ""
}