 variable "aws_access_key" {
 #default = "AKIAION5WJO73CNDPRAQ"
 default = "AKIAJNZE45HH3YVZYB7Q"
} 
variable "aws_secret_key" {
 #default = "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"
 default = "CD93Jop56yBgy4q7Xj0QCv9H9oaeECJw9CzhDaDF"
}
variable "enable_deletion_protection" {
  default = false
}
variable "enable_cross_zone_load_balancing" {
  default = true
}
variable "load_balancer_type" {
  default = "network"
}
variable "protocol" {
  default = "TCP"
}
variable "port" {
  default = "22"
}
variable "ami" {
  default = "ami-04681a1dbd79675a5"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "healthy_threshold" {
  default = "5"
}
variable "healthy" {
  default = "5"
}
variable "threshold" {
  default = "5"
}

