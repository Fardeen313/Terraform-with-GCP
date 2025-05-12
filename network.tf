resource "google_compute_network" "vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet" {
  name          = "custom-subnet"
  network       = google_compute_network.vpc.id
  region        = "us-central1"
  ip_cidr_range = "10.0.0.0/24"

}
resource "google_compute_firewall" "firewall-rules" {
  name    = "custom-firewalls"
  network = google_compute_network.vpc.id
  allow {
    protocol = "tcp"
    ports    = ["80", "86", "84", "8080","22"]
  }
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["fardeen"]
}