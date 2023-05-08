variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "ap-northeast-1"
}

# variable "instance_type" {
#     description = "EC2 Instance Type"
#     type = string
#     default = "t2.micro"
# }

# variable "ami_id" {
#     description = "AMI Image ID"
#     type = string
#     default = "ami-01b32aa8589df6208"
# }

# variable "instance_type_list" {
#   description = "EC2 Instance Type"
#   type = list(string)
#   default = [ "t2.micro", "t3.micro", "t3.small" ]
# }
variable "instance_type_env" {
  description = "EC2 Instance Type Env"
  type = map(string)
  default = {
    "web_server" = "t2.micro"
    "ap_server"  = "t3.micro"
  }
}