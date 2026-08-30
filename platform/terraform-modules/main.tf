variable "service_name" {
  type        = string
  description = "Name of the application service"
}

resource "aws_s3_bucket" "app" {
  bucket = "${var.service_name}-platform-demo"

  tags = {
    ManagedBy = "Platform"
    Service   = var.service_name
  }
}

output "bucket_name" {
  value = aws_s3_bucket.app.bucket
}