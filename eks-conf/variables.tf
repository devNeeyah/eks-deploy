# variable "sg_ids" {
# type = string
# }

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-07bb8c77cfc36f240", "subnet-0d9aea468c8dd7cbc"]
}

variable "vpc_id" {
   type = string
}
