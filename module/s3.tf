resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "${var.project_name}-"
  acl    = var.acl

  versioning {
    enabled = var.versioning
  }

  tags = merge(var.tags, {
    Name        = var.project_name
  },)
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_default.json
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  count = var.create_sqs ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  dynamic "queue" {
    for_each = [for i in var.sqs_queue_prefix : i if length(i) > 0]
    
    content {
      id            = queue.value["id"]
      queue_arn     = aws_sqs_queue.queue[count.index].arn
      events        = queue.value["events"]
      filter_prefix = queue.value["filter_prefix"]
    }
  }

  dynamic "queue" {
    for_each = [for i in var.sqs_queue_suffix : i if length(i) > 0]
    
    content {
      id            = queue.value["id"]
      queue_arn     = aws_sqs_queue.queue[count.index].arn
      events        = queue.value["events"]
      filter_suffix = queue.value["filter_suffix"]
    }
  }

}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}