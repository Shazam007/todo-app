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
#     "artifactregistry.googleapis.com"
#   ])
#   project = var.project_id
#   service = each.key
# }

# Service account to be used by Cloud Run service
resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-sa"
  display_name = "Cloud Run Service Account"
}

# Assigning roles to the service account
resource "google_project_iam_member" "cloud_run_sa_roles" {
  for_each = toset([
    "roles/run.admin",
    "roles/run.invoker",
    "roles/cloudbuild.builds.editor",
    "roles/artifactregistry.admin",
    "roles/iam.serviceAccountUser",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.cloud_run_sa.email}"
  project = var.project_id
}

# Artifact Registry repository to store Docker images
resource "google_artifact_registry_repository" "container_repository" {
  location      = var.region
  repository_id = "todo-app-repository"
  format        = "DOCKER"
  description   = "container repository to store images of todo-app"
}

# Service account key to be used by Cloud Run service
resource "google_service_account_key" "cloud_run_sa_key" {
  service_account_id = google_service_account.cloud_run_sa.name
  keepers = {
    last_rotation = timestamp()
  }
}

