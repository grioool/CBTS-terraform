variable "gcp_svc_key" {
  description = "The GCP private key" 
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
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