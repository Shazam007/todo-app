variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "service_name" {
  description = "Name of cloud run service"
  type        = string
}

variable "initial_image_url" {
  description = "Initial image to act as placeholder"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to use for Cloud Run"
  type        = string
}
