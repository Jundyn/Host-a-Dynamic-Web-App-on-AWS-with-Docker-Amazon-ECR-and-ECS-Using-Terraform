# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "dynsible-terraform-remote-state"
    key            = "rentzone-ecs/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
  }
}