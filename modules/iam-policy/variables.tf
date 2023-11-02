variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the iam-policy"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "createdBy" {
  type        = string
  description = "Who created this resource"
}

variable "application" {
  type        = string
  description = "Name of the application"
}