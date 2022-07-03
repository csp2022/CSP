#########################################  Importing  modules #################################
module "networking"{
source = "./modules/networking"
mycidr = "${var.mycidr}"
mybastionhostnic = "${module.computing.mybastionhostnic}"
}

module "security"{
source = "./modules/security"
myvpc = "${module.networking.myvpc}"
mypublicsubnet = "${module.networking.mypublicsubnet}"
myprivatesubnet = "${module.networking.myprivatesubnet}"
mypublickey = "${var.mypublickey}"
}

module "computing"{
source = "./modules/computing"
myami = "${var.myami}"
mypublicsubnet = "${module.networking.mypublicsubnet}"
lb-subnet2 = "${module.networking.lb-subnet2}"
myprivatesubnet = "${module.networking.myprivatesubnet}"
mykp = "${module.security.mykp}"
mybastionsg = "${module.security.mybastionsg}"
mysmpdbsg = "${module.security.mysmpdbsg}"
}

module "storage"{
source = "./modules/storage"
mydbinstance = "${module.computing.mydbinstance}"
}

module "databases"{
source = "./modules/databases"
mydbsubnetgroup = "${module.networking.mydbsubnetgroup}"
websg = "${module.security.websg}"
}
