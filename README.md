## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| github | >= 4.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| github | >= 4.12.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_iam\_user\_name | Name to use for aws\_iam\_user. Default to gh-OWNER-REPO-ENV | `string` | `null` | no |
| create\_aksk | Create AWS Access Key & Secret Key | `bool` | `true` | no |
| env | Environment name | `string` | n/a | yes |
| env\_secrets | Environment level secrets map | `map(string)` | `{}` | no |
| oauthtoken | Github Oauth token | `string` | n/a | yes |
| owner | Github Owner | `string` | n/a | yes |
| repo | Github repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_iam\_user | aws\_iam\_user name |

