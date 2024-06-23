resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-sa-v2"
  display_name = "Cloud Run Service Account v2"
}

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

resource "google_service_account_key" "cloud_run_sa_key" {
  service_account_id = google_service_account.cloud_run_sa.name
  keepers = {
    last_rotation = timestamp()
  }
  lifecycle {
    ignore_changes = [
      keepers
    ]
  }
}
