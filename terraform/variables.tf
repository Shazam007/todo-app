# Purpose: Define the variables that will be used in the Terraform configuration.

variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "flash-project-424708"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "europe-north1"
}

variable "service_name" {
  description = "Name of cloud run service"
  type        = string
  default     = "todo-cloud-run-service-v2"
}

variable "initial_image_url" {
  description = "Initial image to act as placeholder"
  type        = string
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}
