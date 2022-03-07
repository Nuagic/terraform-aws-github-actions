output "aws_iam_user" {
  description = "aws_iam_user name"
  value       = var.create_aksk ? aws_iam_user.this[0].name : null
}

