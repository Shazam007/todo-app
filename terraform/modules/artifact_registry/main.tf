resource "google_artifact_registry_repository" "container_repository" {
  location      = var.region
  repository_id = var.repository_id
  format        = "DOCKER"
  description   = "Container repository to store images of todo-app v2"
}

