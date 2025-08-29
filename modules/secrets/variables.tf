variable "secret_name" {
  type    = string
  description = "Name of the secret"
}

variable "secret_description" {
  type    = string
  description = "Description of the secret"
  default = "Managed by Terraform"
}

variable "secret_string" {
  type    = string
  description = "Secret value to store"
}

variable "tags" {
  type = map(string)
  description = "Tags for the secret"
  default = {}
}
