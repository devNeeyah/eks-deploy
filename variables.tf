variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "os_image" {
    default = "*****"
}

variable "key" {
    default = "****"
}

variable "instance-type" {
    default = "t2.small"
}
variable "vpc-cidr" {
    default = "10.10.0.0/16"  
}
variable "subnet1-cidr" {
    default = "10.10.1.0/24"
  
}
variable "subnet_az" {
    default =  "us-east-1b" 
}
