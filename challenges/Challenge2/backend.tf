terraform {
  backend "s3" {
    bucket         = "opentofu-state-backend" # Replace with your S3 bucket name
    key            = "terraform.tfstate" # Define the path and filename for your state file
    region         = "ap-south-1" # Replace with your AWS region
    encrypt        = true # Optional: Encrypt the state file at rest
    use_lockfile   = true # Enable S3 native state locking
  }
}
