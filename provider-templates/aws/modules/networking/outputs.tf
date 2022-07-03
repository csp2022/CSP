output "myaccount" {
  value = "${aws_vpc.myvpc.owner_id}"
}

output "myvpc" {
  value = "${aws_vpc.myvpc.id}"
}

output "lb-subnet2" {
  value = "${aws_subnet.lb-subnet2.id}"
}

output "mypublicsubnet" {
  value = "${aws_subnet.mypublicsubnet.id}"
}

output "myprivatesubnet" {
  value = "${aws_subnet.myprivatesubnet.id}"
}

output "mydbsubnetgroup" {
value = "${aws_db_subnet_group.mydbsubnetgroup.id}"
}
