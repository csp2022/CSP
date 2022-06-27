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

module "storage"{
source = "./modules/storage"
}

module "computing"{
source = "./modules/computing"
myami = "${var.myami}"
mypublicsubnet = "${module.networking.mypublicsubnet}"
myprivatesubnet = "${module.networking.myprivatesubnet}"
mykp = "${module.security.mykp}"
mybastionsg = "${module.security.mybastionsg}"
mysmpdbsg = "${module.security.mysmpdbsg}"
}


