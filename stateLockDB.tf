resource "aws_dynamodb_table" "tf_state_locks" {
  hash_key = "UserId"
  attribute {
    name = "UserId"
    type = "S"
  }
  name = "state-locks"
  billing_mode = "PROVISIONED"
  read_capacity = 20
  write_capacity = 20
}

tags = {
  Name = "State Lock Table"

}