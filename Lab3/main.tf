 provider "google" {
  credentials = file("D:\\GCP\\Terraform\\starlit-effect-341904-1857b82a3a6d.json")
  ## INSERT YOUR PROJECT ID HERE!!
 
}

module "gcs-static-website-bucket" {
  source = "./modules/gcs-static-website-bucket"
  name       = var.name
  project_id = var.project_id
  #credentials = file("D:\\GCP\\Terraform\\starlit-effect-341904-1857b82a3a6d.json")
  location   = "us-east1"
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]
}