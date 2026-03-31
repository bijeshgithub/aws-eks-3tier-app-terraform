terraform {
  backend "s3" {
    bucket         = "bijesh-s3-bucket"
    key            = "eks/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    use_lockfile   = true
  }
}