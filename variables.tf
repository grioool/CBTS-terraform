variable "gcp_private_key_file_path" {
  description = "The GCP private key" 
  type        = string
  default     = "service-account.json"
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default = "direct-airfoil-451800-d5"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "europe-central2"
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "billing_account_id" {
  description = "The GCP billing account ID"
  type        = string
}

variable "gemini_key" {
  description = "API key for Gemini"
  type        = string
  sensitive   = true
}