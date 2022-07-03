output "mykp" {
  value = "${aws_key_pair.mykp.id}"
}

output "mybastionsg" {
  value = "${aws_security_group.mybastionsg.id}"
}

output "mysmpdbsg" {
  value = "${aws_security_group.mysmpdbsg.id}"
}

output "websg" {
value = "${aws_security_group.websg.id}"
}
