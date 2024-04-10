module "ssm_parameter" {
  source      = "git::https://github.com/developer-productivity/aws-resources-modules.git//ssm_parameter"

  name            = lookup(var.ssm_parameter_name, var.environment)
  project         = var.project
  environment     = var.environment
  overwrite       = false
  type            = "SecureString"
  value           = ""
  tags            = var.tags
}