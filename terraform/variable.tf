variable "instance_name" {
  description = "instance name"
  type = string
  default = "eks-manager"
}

variable "instance_type" {
  default = "t3.medium"
}
variable "key_name" {
  default = "eks-manager"
}