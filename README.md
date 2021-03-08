# S3-SQS
Módulo terrafomr que cria um bucket S3 opcionalmente pode criar uma fila SQS em que o bucket vai postar uma mensagem cada vez que um objeto for criado.

## Exemplos de uso
No diretório exemplo é possível ver uma chamada para o módulo com parâmetros básicos. 


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| project_name | Prefix of bucket and SQS | `string` | n/a | yes |
| acl | ACL for the bucket | `string` | `"private"` | no |
| versioning | Enable/disable versioning | `bool` | `false` | no |
| tags | Tags for resources | `map(string)` | n/a | yes |
| sqs_queue_prefix | Prefix values that will be used to filter S3 events | `list` | empty | no |
| sqs_queue_suffix | Values that will be used to filter S3 events | `list` | empty | no |
| s3_actions | Allowed actions for S3 policy | `list` | `"s3:*"` | no |
| sqs_actions | Allowed actions for SQS policy | `list` | `"SQS:SendMessage"` | no |
| sqs_principals | Allowed principals for SQS policy | `list` | `"s3.amazonaws.com"` | no |
| create_sqs | If true will create SQS Resources | `bool` | `true` | no |
| delay_seconds | The time in seconds that the delivery of all messages in the queue will be delayed | `number` | `60` | no |
| max_message_size | The limit of how many bytes a message can contain before Amazon SQS rejects it | `number` | `1024` | no |
| message_retention_seconds | The number of seconds Amazon SQS retains a message  | `number` | `172800` | no |
| receive_wait_time_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning | `number` | `20` | no |


## Outupus

| Name | Description |
|------|-------------|
| bucket_arn | Arn of the created bucket |
| sqs_arn | Arn of the created SQS Queue |