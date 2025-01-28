terraform {
  backend "s3" {
    bucket = "tf_state"
#    key = ""
    region = "us-west-2"
    dynamodb_table = "tf_state_locks"
    encrypt = true
  }
}