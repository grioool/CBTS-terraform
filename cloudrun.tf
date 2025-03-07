resource "google_cloud_run_service" "backend" {
  name     = "terraform-cbts-backend"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/terraform-cbts-backend:latest"
        env {
          name  = "DB_USER"
          value = google_sql_user.users.name
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
        env {
          name  = "DB_NAME"
          value = google_sql_database.database.name
        }
        env {
          name  = "DB_IP"
          value = google_sql_database_instance.postgres.public_ip_address
        }
        env {
          name  = "GEMINI_KEY"
          value = var.gemini_key
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
