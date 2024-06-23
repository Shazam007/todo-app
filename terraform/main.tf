# Configuration of the Google provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# To enable the required Google Cloud services - this will enable/disable the required services in whole project scope

# resource "google_project_service" "required_services" {
#   for_each = toset([
#     "run.googleapis.com",
#     "cloudbuild.googleapis.com",
#     "container.googleapis.com",
#     "artifactregistry.googleapis.com",
#     "cloudresourcemanager.googleapis.com"
#   ])
#   project = var.project_id
#   service = each.key
# }

# Service account to be used by Cloud Run service
module "cloud_run_service_account" {
  source = "./modules/service_account"
  project_id = var.project_id
}

# Artifact Registry repository to store Docker images
module "artifact_registry" {
  source = "./modules/artifact_registry"
  project_id = var.project_id
  region = var.region
  repository_id = "todo-app-repository-v2"
}

# Cloud Run service to deploy the application in CICD pipeline
module "cloud_run_service" {
  source = "./modules/cloud_run"
  project_id = var.project_id
  region = var.region
  service_name = var.service_name
  initial_image_url = var.initial_image_url
  service_account_email = module.cloud_run_service_account.email
}
