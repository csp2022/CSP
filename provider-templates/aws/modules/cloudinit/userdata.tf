data "template_file" "appserver-userdata" {
  template = "${file("${path.module}/userdata.tpl")}"
}