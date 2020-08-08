terraform {
  backend "s3" {
    bucket = "awscommunity-eks-demo-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

