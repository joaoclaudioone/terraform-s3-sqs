data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_default" {
  statement {
    effect = "Allow"

    actions = var.s3_actions

    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "iam_notif_policy" {
  count = var.create_sqs ? 1 : 0
  statement {
    effect = "Allow"

    principals {
        type = "Service"
        identifiers = var.sqs_principals
        }

    actions = var.sqs_actions

    resources = [
      "arn:aws:sqs:*:*:${var.project_name}-queue",
    ]

    condition {
        test = "ArnEquals"
        variable = "aws:SourceArn"
        values = [aws_s3_bucket.bucket.arn]
    }
  }
}