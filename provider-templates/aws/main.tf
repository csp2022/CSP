#########################################  Importing  modules #################################
module "cloudinit"{
source = "./modules/cloudinit"
}

module "networking"{
source = "./modules/networking"
mycidr = "${var.mycidr}"
bastionhostnic = "${module.computing.bastionhostnic}"
}

module "security"{
source = "./modules/security"
myvpc = "${module.networking.myvpc}"
lb-subnet1 = "${module.networking.lb-subnet1}"
webapp-subnet1 = "${module.networking.webapp-subnet1}"
mypublickey = "${var.mypublickey}"
}

module "computing"{
source = "./modules/computing"
myami = "${var.myami}"
lb-subnet1 = "${module.networking.lb-subnet1}"
lb-subnet2 = "${module.networking.lb-subnet2}"
webapp-subnet1 = "${module.networking.webapp-subnet1}"
webapp-subnet2 = "${module.networking.webapp-subnet2}"
mykp = "${module.security.mykp}"
bastion-sg = "${module.security.bastion-sg}"
webapp-sg = "${module.security.webapp-sg}"
webapp-userdata = "${module.cloudinit.webapp-userdata}"
}

module "storage"{
source = "./modules/storage"
webapp-server-1 = "${module.computing.webapp-server-1}"
}

module "databases"{
source = "./modules/databases"
db-subnet-group = "${module.networking.db-subnet-group}"
db-sg = "${module.security.db-sg}"
}

