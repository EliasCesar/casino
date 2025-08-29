resource "aws_secretsmanager_secret" "secret" {
  name = var.secret_name
  description = var.secret_description
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.secret_string
}
