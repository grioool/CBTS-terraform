output "backend_url" {
  value = google_cloud_run_service.backend.status[0].url
}

output "database_instance" {
  value = google_sql_database_instance.postgres.name
}

output "summaries_bucket" {
  value = google_storage_bucket.bucket.name
}
