# Usage:

```
module "lambda_function" {
  source              = "git::https://github.com/developer-productivity/aws-resources-modules.git//lambda_function"

  project             = "exemplo"
  environment         = "dev"
  tags                = {
                          BusinessUnit        = "Pagamentos Digitais"
                          ComplianceList      = ""
                          ComplianceRequired  = false
                          CriticalLevel       = 1
                          Email               = "l-pagseguro-berlim@uolinc.com"
                          EscalationList      = "l-pagseguro-berlim"
                          FilaIm              = "l-pagseguro-berlim"
                          Product             = "Exemplo"
                          Slack               = "berlim"
                          Team                = "Berlim"
                        }

  filename            = "./exemplo.zip"
  handler             = "exemplo.lambda_handler"
  role                = "arn:aws:iam::898139803216:role/exemplo"
  runtime             = "python2.7"
  timeout             = "15"
  vpc_config          = [{
                          subnet_ids          = [
                                                  "subnet-dd0fe480",
                                                  "subnet-eb3e8ea0"
                                                ]
                          security_group_ids  = [
                                                  "sg-095caf6dd3fd5f59b"
                                                ]
                        }]
  variables           = {
                          ENVIRONMENT = "dev"
                        }
  source_code_hash    = filebase64sha256("./exemplo.zip")
}
```

# Variables:

| Name                              | Type              | Required  | Default           |
|-----------------------------------|-------------------|-----------|-------------------|
| `executions`                      | number            | no        | 1                 |
| `project`                         | string            | yes       |                   |
| `environment`                     | string            | yes       |                   |
| `tags`                            | map(any)          | yes       |                   |
| `extra_tags`                      | map(any)          | no        |                   |
|-----------------------------------|-------------------|-----------|-------------------|
| `filename`                        | string            | no        |                   |
| `s3_bucket`                       | string            | no        |                   |
| `s3_key`                          | string            | no        |                   |
| `s3_object_version`               | string            | no        |                   |
| `function_name`                   | string            | no        | "${var.project}"  |
| `dead_letter_config`              | list(map(string)) | no        |                   |
| - `target_arn`                    | string            | yes       |                   |
| `tracing_config`                  | list(map(string)) | no        |                   |
| - `mode`                          | string            | yes       |                   |
| `handler`                         | string            | yes       |                   |
| `role`                            | string            | yes       |                   |
| `description`                     | string            | no        | "${var.project}"  |
| `layers`                          | list(string)      | no        |                   |
| `memory_size`                     | number            | no        | 128               |
| `runtime`                         | string            | yes       |                   |
| `timeout`                         | number            | no        | 3                 |
| `reserved_concurrent_executions`  | number            | no        | -1                |
| `publish`                         | bool              | no        | false             |
| `vpc_config`                      | list(map(any))    | no        |                   |
| - `subnet_ids`                    | list(string)      | yes       |                   |
| - `security_group_ids`            | list(string)      | yes       |                   |
| `variables`                       | map(string)       | no        |                   |
| `kms_key_arn`                     | string            | no        |                   |
| `source_code_hash`                | string            | no        |                   |
