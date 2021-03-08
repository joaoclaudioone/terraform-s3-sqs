variable "region" {
    description = "AWS Region"
    default = "us-east-1"
}

variable "tags" {
  description = "resources tags"
  default = {
    terraform = "true"
    project = "Example"
  }
}

variable "project_name" {
    description = "Project Name"
    default = "example"
}

variable "sqs_queue_suffix" {
    description = "Suffix values that will be used to filter S3 events"
    type = list
    default = [
        {
            id             = "jpg-creation-event"
            events         = ["s3:ObjectCreated:*"]
            filter_suffix  = ".jpg"
        },
        {
            id             = "log-creation-event"
            events         = ["s3:ObjectCreated:*"]
            filter_suffix  = ".log"
        }
    ]
}