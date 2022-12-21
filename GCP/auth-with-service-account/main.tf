terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-363411"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}

resource "google_storage_bucket" "GCS1" {
    name = "bucket-from-tf-using-sa-raja"
    location      = "US"
}