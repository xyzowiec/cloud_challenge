resource "google_compute_instance" "dare-id-vm-6" {
  name         = "dareit-vm-tf-6"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = "echo 'Hello, World!' > /var/www/html/index.html"
}
lukasz_szalkiewicz@cloudshell:~/dare-it-6 (hazel-strand-377523)$ cat cloudsql.tf
resource "google_sql_database_instance" "cloudsql_instance" {
  name             = "dareit-for-database-6"
  database_version = "POSTGRES_13"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true