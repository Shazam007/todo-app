variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "repository_id" {
  description = "The repository ID for the Artifact Registry"
  type        = string
}
