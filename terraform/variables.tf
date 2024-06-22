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
