output "email" {
  value = google_service_account.cloud_run_sa.email
}

output "private_key" {
  value = google_service_account_key.cloud_run_sa_key.private_key
  sensitive = true
}