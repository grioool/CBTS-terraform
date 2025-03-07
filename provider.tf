provider "google" {
  credentials = file("C:/Users/Emil Łasocha/Desktop/CC/terraform_newest/direct-airfoil-451800-d5-56d7a33ff437.json")
  project = var.project_id
  region  = var.region
}
provider "google-beta" {
  credentials = file("C:/Users/Emil Łasocha/Desktop/CC/terraform_newest/direct-airfoil-451800-d5-56d7a33ff437.json")
  project = var.project_id
  region  = var.region
}