resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  zone = "asia-southeast1-b"
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220920"
      size = 20
    }
    auto_delete = true
  }

  labels = {
    "env" = "tflearning"
  }

  scheduling {
    preemptible = false
    automatic_restart = false
  }

  service_account {
    email = "terraform-gcp@terraform-gcp-363411.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
  
}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 10
  zone = "asia-southeast1-b"
  type = "pd-ssd"
  }

  resource "google_compute_attached_disk" "adisk" {
    disk = google_compute_disk.disk-1.id
    instance = google_compute_instance.vm-from-tf.id
    
  }

