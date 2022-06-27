output "myaccount" {
  value = "${module.networking.myaccount}"
}

output "mybastionhost_public_ip" {
  value = "${module.computing.mybastionhost_public_ip}"
}

