# Specify the provider (AWS in this case)
provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

# Generate a random string for the S3 bucket name
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Create an S3 bucket with a random name
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-${random_string.bucket_suffix.result}"

  acl = "private" # Adjust the ACL as needed (private, public-read, public-read-write, etc.)

  # Tags for the S3 bucket
  tags = {
    Name      = "ExampleBucket"
    yor_name  = "example_bucket"
    yor_trace = "4b210fa7-c042-423c-a817-925f95b66541"
  }
}

# Output the name of the created S3 bucket
output "s3_bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}
