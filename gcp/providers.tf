terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.20.0"
    }
  }
}

provider "google" {
  project = "josephproject"
  region = "us-central1"
}

#resource "google_project" "my_project" {
#  name       = "myroject"
#  project_id = "myprojectid"
#}

