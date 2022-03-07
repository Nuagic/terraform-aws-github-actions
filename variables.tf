variable "env" {
  description = "Environment name"
  type        = string
}

variable "env_secrets" {
  description = "Environment level secrets map"
  type        = map(string)
  default     = {}
}

variable "owner" {
  type        = string
  description = "Github Owner"
}

variable "repo" {
  type        = string
  description = "Github repository"
}

variable "oauthtoken" {
  type        = string
  description = "Github Oauth token"
  sensitive   = true
}

variable "create_aksk" {
  description = "Create AWS Access Key & Secret Key"
  type        = bool
  default     = true
}

variable "aws_iam_user_name" {
  description = "Name to use for aws_iam_user. Default to gh-OWNER-REPO-ENV"
  type        = string
  default     = null
}

