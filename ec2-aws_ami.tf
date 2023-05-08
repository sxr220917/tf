data "aws_ami" "test_ami" {
  #newest
  most_recent = true
  #amazon 官方认证
  owners = [ "amazon" ]

  # 镜像文件名称过滤
  filter {
    name = "name"
    values = [ "amzn-ami-hvm-*x86_64-gp2" ]
  }

  # 根设备过滤条件
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
}