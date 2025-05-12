resource "google_compute_instance" "apache" {
  name         = "my-vm"
  zone         = "us-central1-a"
  machine_type = "e2-micro"
  tags         = ["fardeen"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      type  = "pd-standard"
    }
  }
  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }
  metadata = {
    startup-script = file("E:/Terraform-with-GCP/init.sh")
  }
}
