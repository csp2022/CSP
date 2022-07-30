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

resource "google_compute_address" "static" {
  name = "vm-public-address"
  region = "us-west2"
  depends_on = [ google_compute_firewall.myfw ]
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
      nat_ip = google_compute_address.static.address
    }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}

 provisioner "remote-exec" {
    connection {
      host        = google_compute_address.static.address
      type        = "ssh"
      user        = "gcp-user"
      timeout     = "500s"
      private_key = file("~/Downloads/mykp.pem")
    }
    inline = [
      "sudo apt update",

      "sudo apt install docker.io -y",

      "sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock",
      
      "sudo git clone https://github.com/csp2022/CSP.git && cd CSP/utils/flask",

      "sudo docker image build -t flask .",

      "sudo docker run -d --name flask -p 5001:5001 flask"
        ]
  }
}
