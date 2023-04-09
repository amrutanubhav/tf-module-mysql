locals {
  RDS_PASS = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["RDS_PASSWORD"]
  RDS_USER = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["RDS_USERNAME"]
}