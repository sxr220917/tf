output "instance_publicip" {
  #output public ip
  #value = aws_instance.myweb_server.public_ip
  description = "EC2 ips"
  value       = [for instance in aws_instance.myweb_server2 : instance.public_ip]
}
#输出所有可用区域
output "instance_availability_zones" {
  value = data.aws_availability_zones.aws_cli_azones.names
}
output "instance_ami" {
  value = aws_instance.myweb_server2[*].ami
}
#通过map方式输出内网ip，创建每个实例和ip的映射
output "instance_privateip" {
#   value = aws_instance.myweb_server2.private_ip
value = { for instance in aws_instance.myweb_server2 : instance.id => instance.public_ip }
}
output "instance_instance_type" {
  value = aws_instance.myweb_server2[*].instance_type
}
#使用lookup函数创建nametag的映射
output "instance_tags" {
  value = { for instance in aws_instance.myweb_server2 : instance.id => lookup(instance.tags, "Name") }
}
