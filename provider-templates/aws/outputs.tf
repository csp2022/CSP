output "myaccount" {
  value = "${module.networking.myaccount}"
}

output "bastionhost_public_ip" {
  value = "${module.computing.bastionhost_public_ip}"
}

