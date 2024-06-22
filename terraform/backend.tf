# Purpose: Define the backend configuration for the Terraform state file.

terraform {
  backend "gcs" {
    bucket  = "todo-app-tfstate-bucket"
  }
}