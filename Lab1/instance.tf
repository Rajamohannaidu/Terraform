
  provider "google" {
  credentials = file("D:\\GCP\\Terraform\\starlit-effect-341904-1857b82a3a6d.json")
  ## INSERT YOUR PROJECT ID HERE!!
  project = "starlit-effect-341904"
  region = "us-central1"
  zone = "us-central1-a"
}

  resource  "google_compute_instance" "terraform" {
    #project = "starlit-effect-341904"
    name =  "terraform"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
          image = "debian-cloud/debian-9"
        }
    }

    network_interface {
      network = "default"
      access_config{

      }
    }
}

