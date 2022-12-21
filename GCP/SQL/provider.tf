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