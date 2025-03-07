resource "google_storage_bucket" "bucket" {
  name                        = "terraform-bucket"
  location                    = "EU"
  uniform_bucket_level_access = true
  hierarchical_namespace {
    enabled = true
  }
}

resource "google_storage_folder" "uploads_folder" {
  bucket = google_storage_bucket.bucket.name
  name   = "uploads/"
}

resource "google_storage_folder" "summaries_folder" {
  bucket = google_storage_bucket.bucket.name
  name   = "summaries/"
}
