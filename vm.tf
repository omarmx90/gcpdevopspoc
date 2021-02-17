# Creates a GCP VM Instance.
resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["http-server"]
  labels       = var.labels

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
metadata = {
		ssh-keys = "ubuntu:${file("id_rsa.pub")}"
	}
}

resource "google_compute_firewall" "default" {
  name    = "allow-jenkins"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}