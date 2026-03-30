terraform {
  backend "s3" {
    bucket         = "bijesh-s3-buckett"  # Change if the name already exists. 
    key            = "eks/terraform.tfstate"       
    region         = "us-east-1"                   
    encrypt        = true
  }
}
