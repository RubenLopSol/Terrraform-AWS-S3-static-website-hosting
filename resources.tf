resource "aws_s3_bucket" "bucket_1" {
  bucket = "web-bucket-ruben"

  tags = {
    Name = "Bucket_1"
  }
}
# Block public acces
resource "aws_s3_bucket_public_access_block" "bucket_1" {
  bucket = aws_s3_bucket.bucket_1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
# Upload content to bucket
resource "aws_s3_object" "index" {
  bucket       = "web-bucket-ruben"
  key          = "index.html"
  source       = "assets/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = "web-bucket-ruben"
  key          = "error.html"
  source       = "assets/error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style" {
  bucket       = "web-bucket-ruben"
  key          = "style.css"
  source       = "assets/style.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_website_configuration" "bucket_1" {
  bucket = aws_s3_bucket.bucket_1.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.bucket_1.id
  policy = <<EOF
  {
      "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	  "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "${aws_s3_bucket.bucket_1.arn}",
        "${aws_s3_bucket.bucket_1.arn}/*"
      ]
    }
  ]
  }
  EOF
}