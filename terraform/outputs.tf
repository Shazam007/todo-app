# Purpose: Define the outputs for the Terraform configuration

# Output the service account email
output "service_account_email" {
  description = "The email of the service account created for Cloud Run"
  value       = module.cloud_run_service_account.email
}

# Output the Docker repository URL
output "docker_repository_url" {
  description = "The URL of the Docker repository in Google Artifact Registry"
  value       = module.artifact_registry.docker_repository_url
}

# Output the service account key
output "service_account_key" {
  description = "The JSON key for the service account"
  value       = module.cloud_run_service_account.private_key
  sensitive   = true
}
