#resource "google_project" "my_project" {
#  name       = "myroject"
#  project_id = "myprojectid"
#}

resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  auto_create_subnetworks = "false"
  mtu                     = 1460
}
