variable "aws_region" {}

variable "cluster_name" {}

variable "key_name" {}

variable "k8s_version" {}

variable "cluster_vpc" {}

variable "private_subnet_1a" {}

variable "private_subnet_1c" {}

variable "eks_cluster" {}

variable "eks_cluster_sg" {}

variable "nodes_instances_sizes" {}

variable "auto_scale_options" {}

variable "auto_scale_cpu" {}

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