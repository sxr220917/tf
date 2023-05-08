resource "aws_instance" "myweb_server2" {
  ami                    = data.aws_ami.test_ami.id
  instance_type          = var.instance_type_env["web_server"]
  key_name               = "aws-cli-keypair-1"
  user_data              = file("${path.module}/ec2-userdata.sh")
  subnet_id              = "subnet-0766a586eec3fd444"
  vpc_security_group_ids = [aws_security_group.aws-cli-sg-web-server.id]
 
  #循环可用区数据源
  for_each = toset(data.aws_availability_zones.aws_cli_azones.names)
  #取得数据源赋予可用区属性
  availability_zone = each.key
  tags = {
    # 为启动的ec2加入索引
    "Name" = "awscli-ec2-terraform-${each.key}"
  }
}
