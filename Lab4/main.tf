provider "google" {
  project     = "starlit-effect-341904"
  region      = "us-central-1"
  credentials = file("D:\\GCP\\Terraform\\starlit-effect-341904-1857b82a3a6d.json")
}
resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "starlit-effect-341904"
  location    = "US"
  uniform_bucket_level_access = true
  force_destroy = true
}
terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}