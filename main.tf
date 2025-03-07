# Cloud Storage for file uploads and summaries
# resource "google_storage_bucket" "uploads" {
#   name     = "cbts-bucket"
#   location = var.region
# }

# resource "google_storage_bucket" "summaries" {
#   name     = "terraform-cbts-summaries-bucket"
#   location = var.region
# }

# Cloud Run for the FastAPI backend
# resource "google_cloud_run_service" "backend" {
#   name     = "terraform-cbts-backend"
#   location = var.region

#   template {
#     spec {
#       containers {
#         image = "gcr.io/${var.project_id}/terraform-cbts-backend:latest"
#         env {
#           name  = "DB_USER"
#           value = google_sql_user.users.name
#         }
#         env {
#           name  = "DB_PASSWORD"
#           value = var.db_password
#         }
#         env {
#           name  = "DB_NAME"
#           value = google_sql_database.database.name
#         }
#         env {
#           name  = "DB_IP"
#           value = google_sql_database_instance.postgres.public_ip_address
#         }
#         env {
#           name  = "GEMINI_KEY"
#           value = var.gemini_key
#         }
#       }
#     }
#   }

#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
# }

# Cloud SQL (PostgreSQL) for the database
# resource "google_sql_database_instance" "postgres" {
#   name             = "terraform-cbts-postgres-instance"
#   database_version = "POSTGRES_13"
#   region           = var.region

#   settings {
#   tier = "db-f1-micro"
#   ip_configuration {
#     ipv4_enabled = true
#   }
# }

# }

resource "google_sql_database" "database" {
  name     = "terraform-cbts-db"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "users" {
  name     = "terraform-cbts-user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}

# IAM roles for admin access
resource "google_project_iam_member" "admin_monitoring_viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:854061077838-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "admin_logging_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = "serviceAccount:854061077838-compute@developer.gserviceaccount.com"
}

# Billing access for admin
resource "google_project_service" "billing" {
  service = "cloudbilling.googleapis.com"
}

resource "google_billing_account_iam_member" "admin_billing_viewer" {
  billing_account_id = var.billing_account_id
  role               = "roles/billing.viewer"
  member             = "serviceAccount:854061077838-compute@developer.gserviceaccount.com"
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "sqladmin" {
  service = "sqladmin.googleapis.com"
}
