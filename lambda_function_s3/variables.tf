##########
# GLOBAL #
##########

variable "executions" {
  type    = number
  default = 1
}

variable "project" {
  type  = string
}

variable "environment" {
  type  = string
}

variable "tags" {
  type = object({
    TopDomain       = string
    Domain          = string
    SubDomain       = string
    TopChannel      = string
    Channel         = string
    BusinessUnit    = string
    Product         = string
    Team            = string
    Slack           = string
    Email           = string
    CriticalLevel   = number
    ApplicationRole = string
  })
}

variable "extra_tags" {
  type    = map(any)
  default = {}
}


############
# FUNCTION #
############

variable "filename" {
  type    = string
  default = null
}

variable "s3_bucket" {
  type    = string
  default = null
}

variable "s3_key" {
  type    = string
  default = null
}

variable "s3_object_version" {
  type    = string
  default = null
}

variable "function_name" {
  type    = string
  default = ""
}

variable "dead_letter_config" {
  type    = list(map(string))
  default = []
}

variable "tracing_config" {
  type    = list(map(string))
  default = []
}

variable "handler" {
  type  = string
}

variable "role" {
  type  = string
}

variable "description" {
  type    = string
  default = ""
}

variable "layers" {
  type    = list(string)
  default = null
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "runtime" {
  type  = string
}

variable "timeout" {
  type    = number
  default = 3
}

variable "reserved_concurrent_executions" {
  type    = number
  default = -1
}

variable "publish" {
  type    = bool
  default = false
}

variable "vpc_config" {
  type    = list(object({
    subnet_ids = list(string)
    security_group_ids = list(string)
  }))
  default = []
}

variable "variables" {
  type    = map(string)
  default = {}
}

variable "kms_key_arn" {
  type    = string
  default = null
}

variable "source_code_hash" {
  type    = string
  default = ""
}
