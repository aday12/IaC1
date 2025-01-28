resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "tf_state_acl" {
  bucket = aws_s3_bucket.tf_state.id
  acl = private
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "enabled"
  }
}