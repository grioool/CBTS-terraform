resource "google_sql_database_instance" "postgres" {
  name             = "terraform-cbts-postgres-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
    }
  }
}
resource "google_sql_database" "database" {
  name     = "terraform-cbts-db"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "users" {
  name     = "terraform-cbts-user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
