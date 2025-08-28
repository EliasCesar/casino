terraform {
  backend "s3" {
    bucket = "casino-states-tf"
    key        = "casin/dev/terraform.tfstate"
    region     = "ca-central-1"
    encrypt    = true
    kms_key_id = "arn:aws:kms:ca-central-1:472025302115:key/0c06141d-a642-4a71-958b-c657b81de0f9"
  }
}
