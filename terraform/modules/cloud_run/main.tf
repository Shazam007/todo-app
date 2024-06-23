resource "google_cloud_run_v2_service" "todo_app_service" {
  name     = var.service_name
  location = var.region

  template {
    containers {
      image = var.initial_image_url
    }
    service_account = var.service_account_email
  }

  lifecycle {
    ignore_changes = [
      template[0].containers[0].image
    ]
  }
}
