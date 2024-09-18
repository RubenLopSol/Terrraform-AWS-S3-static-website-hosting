
output "website_endpoint" {
  value = "http://${aws_s3_bucket.bucket_1.bucket}.s3-website-${var.region}.amazonaws.com"
}
