output "aws_iam_user" {
  description = "aws_iam_user name"
  value       = var.create_aksk ? aws_iam_user.this[0].name : null
}

output "aws_access_key_id" {
  description = "AWS_ACCESS_KEY_ID"
  value       = var.create_aksk ? aws_iam_access_key.this[0].id : null
}

output "aws_secret_access_key" {
  description = "AWS_SECRET_ACCESS_KEY"
  value       = var.create_aksk ? aws_iam_access_key.this[0].secret : null
  sensitive   = true
}

