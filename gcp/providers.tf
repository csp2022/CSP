terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.20.0"
    }
  }
}

provider "google" {
  #credentials = file("*.json") # to hard code credentials file
  project = "josephproject"
  region = "us-west2"
}

