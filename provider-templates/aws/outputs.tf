output "myaccount" {
  value = "${module.networking.myaccount}"
}

output "bastionhost_public_ip" {
  value = "${module.computing.bastionhost_public_ip}"
}

output "elb_dns_name" {
value = "${module.computing.elb_dns_name}"
}
