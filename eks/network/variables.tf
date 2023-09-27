variable "cluster_name" {}

variable "aws_region" {}

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