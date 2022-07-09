#########################################  AWS provider #################################
provider "aws"{
region = "${var.myregion}"
}

resource "null_resource" "cluster" {


  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    inline = [
      "pip install pymysql -t mom --upgrade --no-user",
    ]
  }
}
