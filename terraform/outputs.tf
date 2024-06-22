# Purpose: Define the outputs for the Terraform configuration

# Output the service account email
output "service_account_email" {
  description = "The email of the service account created for Cloud Run"
  value       = google_service_account.cloud_run_sa.email
}

# Output the Docker repository URL
output "docker_repository_url" {
  description = "The URL of the Docker repository in Google Artifact Registry"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.container_repository.repository_id}"
}

# Output the service account key
output "service_account_key" {
  description = "The JSON key for the service account"
  value       = google_service_account_key.cloud_run_sa_key.private_key
  sensitive   = true
}
