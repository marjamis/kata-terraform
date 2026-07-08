ephemeral "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "temporary_password" {
  name             = "temporary_password"
  type             = "SecureString"
  value_wo         = ephemeral.random_password.password.result
  value_wo_version = 1
  overwrite        = true
}

