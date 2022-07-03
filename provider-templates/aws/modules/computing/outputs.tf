output "bastionhostnic" {
  value = "${aws_instance.bastionhost.primary_network_interface_id}"
}

output "bastionhost_public_ip" {
  value = "${aws_instance.bastionhost.public_ip}"
}

output "webapp-server-1" {
value = "${aws_instance.webapp-server-1.id}"
}