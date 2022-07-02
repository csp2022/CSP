output "mybastionhostnic" {
  value = "${aws_instance.mybastionhost.primary_network_interface_id}"
}

output "mybastionhost_public_ip" {
  value = "${aws_instance.mybastionhost.public_ip}"
}

output "mydbinstance" {
value = "${aws_instance.mydbinstance.id}"
}