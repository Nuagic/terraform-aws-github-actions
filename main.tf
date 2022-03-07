resource "github_repository_environment" "this" {
  environment = var.env
  repository  = var.repo
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_actions_environment_secret" "this" {
  for_each        = var.env_secrets
  environment     = github_repository_environment.this.environment
  repository      = github_repository_environment.this.repository
  secret_name     = each.key
  plaintext_value = each.value
}

resource "aws_iam_user" "this" {
  count = var.create_aksk ? 1 : 0
  name  = var.aws_iam_user_name != null ? var.aws_iam_user_name : "gh-${var.owner}-${var.repo}-${var.env}"
}

resource "aws_iam_access_key" "this" {
  count = var.create_aksk ? 1 : 0
  user  = aws_iam_user.this[0].name
}

resource "github_actions_environment_secret" "AWS_ACCESS_KEY_ID" {
  count           = var.create_aksk ? 1 : 0
  environment     = github_repository_environment.this.environment
  repository      = github_repository_environment.this.repository
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.this[0].id
  lifecycle {
    ignore_changes = [plaintext_value]
  }
}

resource "github_actions_environment_secret" "AWS_SECRET_ACCESS_KEY" {
  count           = var.create_aksk ? 1 : 0
  environment     = github_repository_environment.this.environment
  repository      = github_repository_environment.this.repository
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.this[0].secret
  lifecycle {
    ignore_changes = [plaintext_value]
  }
}
