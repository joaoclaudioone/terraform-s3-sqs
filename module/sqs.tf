resource "aws_sqs_queue" "queue" {
  count = var.create_sqs ? 1 : 0

  name = "${var.project_name}-queue"
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
}

resource "aws_sqs_queue_policy" "notif_policy" {
  count = var.create_sqs ? 1 : 0

  queue_url = aws_sqs_queue.queue[count.index].id
  policy    = data.aws_iam_policy_document.iam_notif_policy[count.index].json
}

output "sqs_arn" {
  value = aws_sqs_queue.queue.*.arn  
}
