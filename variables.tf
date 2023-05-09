variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "os_image" {
    default = "ami-0889a44b331db0194"
}

variable "key" {
    default = "ghina-key"
}

variable "instance-type" {
    default = "t2.small"
}
variable "vpc-cidr" {
    default = "10.10.0.0/16"  
}
variable "subnet1-cidr" {
    default = "10.0.0.0/24"
  
}
variable "subnet_az" {
    default =  "us-east-1b" 
}