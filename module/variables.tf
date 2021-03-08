variable "project_name" {
    description = "Project Name"
    type = string
}

variable "acl" {
    description = "ACL for the bucket"
    type = string
    default = "private"
}

variable "versioning" {
    description = "Enable/disable versioning"
    type = bool
    default = false
}

variable "tags" {
    description = "Tags for resources"
    type = map(string)
}

variable "sqs_queue_prefix" {
    description = "Prefix values that will be used to filter S3 events"
    type = list
    default = []
}

variable "sqs_queue_suffix" {
    description = "Suffix values that will be used to filter S3 events"
    type = list
    default = []
}

variable "s3_actions" {
    description = "Allowed actions for S3 policy"
    type = list
    default = ["s3:*"]
}

variable "sqs_actions" {
    description = "Allowed actions for SQS policy"
    type = list
    default = ["SQS:SendMessage"]
}

variable "sqs_principals" {
    description = "Allowed principals for SQS policy"
    type = list
    default = ["s3.amazonaws.com"]
}

variable "create_sqs" {
    description = "If true will create SQS Resources"
    type = bool
    default = true
}

variable "delay_seconds" {
    description = "The time in seconds that the delivery of all messages in the queue will be delayed"
    type = number
    default = 60
}

variable "max_message_size" {
    description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
    type = number
    default = 1024
}

variable "message_retention_seconds" {
    description = "value"
    type = number
    default = 172800
  
}

variable "receive_wait_time_seconds" {
    description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning"
    type = number
    default = 20
}