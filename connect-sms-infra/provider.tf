provider "aws" {
  region  = lookup(var.region, var.environment)
  profile = lookup(var.profile, var.environment)
}
