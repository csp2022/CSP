#resource "google_project" "my_project" {
#  name       = "myroject"
#  project_id = "myprojectid"
#}


resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  auto_create_subnetworks = "false"
  mtu                     = 1460
}

resource "google_compute_subnetwork" "mysubnet" {
  name          = "mysubnet"
  ip_cidr_range = "10.0.1.0/24"
  #region        = "us-west2"
  network       = google_compute_network.myvpc.id
}


resource "google_compute_firewall" "myfw" {
  name    = "myfw"
  network = google_compute_network.myvpc.name
  allow {
    protocol = "tcp"
    ports    = ["22","80","443"]
  }
source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "myinstance" {
  name         = "myinstance"
  machine_type = "e2-medium"
  zone         = "us-west2-a"

  boot_disk {
    initialize_params {
      size  = "200"               
      type  = "pd-ssd"
      image = "debian-11-bullseye-v20220519"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
      // Ephemeral public IP
    }
}

metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}
