provider "aws" {
  region  = var.region
}

module "sqs_bucket" {
  source = "../module"
  
  project_name     = var.project_name
  tags             = var.tags
  sqs_queue_suffix = var.sqs_queue_suffix
}

output "bucket_arn" {
  value = module.sqs_bucket.bucket_arn
}

output "sqs_arn" {
  value = module.sqs_bucket.sqs_arn
}