variable "aws_region" {}

variable "cluster_name" {}

variable "k8s_version" {}

variable "cluster_vpc" {}

variable "private_subnet_1a" {}

variable "private_subnet_1c" {}

variable "tags" {
  type  = object({
            BusinessUnit        = string
            ComplianceList      = string
            ComplianceRequired  = bool
            CriticalLevel       = number
            Email               = string
            EscalationList      = string
            FilaIm              = string
            Product             = string
            Slack               = string
            Team                = string
            ApplicationRole     = string
          })
}

variable "extra_tags" {
  type    = map(any)
  default = {}
}

variable "project" {
  type  = string
}