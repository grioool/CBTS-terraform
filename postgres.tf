resource "google_sql_database_instance" "postgres" {
  name             = "terraform-cbts-postgres-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.private_network.self_link
      enable_private_path_for_google_cloud_services = true
    }
  }
  depends_on = [google_service_networking_connection.private_vpc_connection]
}
resource "google_sql_database" "database" {
  name     = "terraform-cbts-db"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "postgres_user" {
  name     = "terraform-cbts-user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
