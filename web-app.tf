resource "aws_instance" "hw1" {
  ami           = "ami-0fa40e25bf4dda1f6"
  instance_type = "t2.micro"
#  security_groups = [aws_security_group.instances.name] need to configure this to enable ingress
  user_data = <<-EOF
  #!/bin/bash
  echo "Hello World" > index.html
  python3 -m http.server 8080 &
  EOF
}

resource "aws_instance" "hw2" {
  ami           = "ami-0fa40e25bf4dda1f6"
  instance_type = "t2.micro"
  #  security_groups = [aws_security_group.instances.name] need to configure this to enable ingress
  user_data = <<-EOF
  #!/bin/bash
  echo "Hello World2" > index.html
  python3 -m http.server 8080 &
  EOF
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "web-app-data"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "tf_state_acl" {
  bucket = aws_s3_bucket.app_bucket.id
  acl = private
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "enabled"
  }
}