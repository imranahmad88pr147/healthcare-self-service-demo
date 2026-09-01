variable "service_name" {
  type        = string
  description = "Name of the application service"

  validation {
    condition     = can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.service_name))
    error_message = "Service name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  type        = string
  description = "Deployment environment"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "owner" {
  type        = string
  description = "Team responsible for the service"

  validation {
    condition     = length(trimspace(var.owner)) > 0
    error_message = "Owner must not be empty."
  }
}

resource "aws_s3_bucket" "app" {
  bucket = "${var.service_name}-${var.environment}-platform-demo"

  tags = {
    ManagedBy   = "Platform"
    Service     = var.service_name
    Environment = var.environment
    Owner       = var.owner
  }
}

output "bucket_name" {
  value = aws_s3_bucket.app.bucket
}