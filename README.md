# terraform-modules

##########
# WEBACL #
##########

resource "aws_wafv2_web_acl" "waf_wix_connector_service" {
  count       = var.environment == "legacy-sandbox-prod" || var.environment == "legacy-prod" ? 1 : 0
  
  name        = "wix-connector-service-webacl"
  description = "WAF Pagamentos Digitais - WIX Connector Service"
  tags        = var.tags
  
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = format("wix-connector-service-%s", var.environment)
    sampled_requests_enabled   = true
  }

##################################
# WIX Rate Limit per path Rule 1 #
##################################

  rule {
    name     = "wix-rate-limit-by-path-refund"
    priority = 0

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = lookup(var.rate_limit_refund, var.environment)
        aggregate_key_type = "IP"
        scope_down_statement {
          and_statement {
            statement {
              byte_match_statement {
                search_string = "post"
                field_to_match {
                  method {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "EXACTLY"
              }
            }
            statement {
              byte_match_statement {
                search_string = "/wix/refund"
                field_to_match {
                  uri_path {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "STARTS_WITH"
              }
            }
          }
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "wix-rate-limit-by-path-refund-rule"
      sampled_requests_enabled   = false
    }
  }

##################################
# WIX Rate Limit per path Rule 2 #
##################################

    rule {
    name     = "wix-rate-limit-by-path-sale"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = lookup(var.rate_limit_sale, var.environment)
        aggregate_key_type = "IP"
        scope_down_statement {
          and_statement {
            statement {
              byte_match_statement {
                search_string = "post"
                field_to_match {
                  method {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "EXACTLY"
              }
            }
            statement {
              byte_match_statement {
                search_string = "/wix/sale"
                field_to_match {
                  uri_path {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "STARTS_WITH"
              }
            }
          }
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "wix-rate-limit-by-path-refund-sale"
      sampled_requests_enabled   = false
    }
  }

##################################
# WIX Rate Limit per path Rule 3 #
##################################
 
   rule {
    name     = "wix-rate-limit-by-path-connect"
    priority = 2

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = lookup(var.rate_limit_connect, var.environment)
        aggregate_key_type = "IP"
        scope_down_statement {
          and_statement {
            statement {
              byte_match_statement {
                search_string = "post"
                field_to_match {
                  method {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "EXACTLY"
              }
            }
            statement {
              byte_match_statement {
                search_string = "/wix/connect"
                field_to_match {
                  uri_path {}
                }
                text_transformation {
                  priority = 0
                  type     = "LOWERCASE"
                }
                positional_constraint = "STARTS_WITH"
              }
            }
          }
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "wix-rate-limit-by-path-connect-rule"
      sampled_requests_enabled   = false
    }
  }
}

######################
# WIX Whitelist Rule #
######################
#
#  rule {
#    name     = "wix-connector-service-ip-whitelist"
#    priority = 0
#
#    action {
#      allow {}
#    }
#
#    statement {
#      ip_set_reference_statement {
#        arn = aws_wafv2_ip_set.wix-connector-service-ip-whitelist.arn
#      }
#    }
#
#    visibility_config {
#      cloudwatch_metrics_enabled = true
#      metric_name                = "wix-connector-service-ip-whitelist"
#      sampled_requests_enabled   = true
#    }
#  }
#
#######################
## WIX Whitelist Rule #
#######################
#
#  rule {
#    name     = "pagseguro_ip_whitelist"
#    priority = 1
#
#    action {
#      allow {}
#    }
#
#    statement {
#      ip_set_reference_statement {
#        arn = aws_wafv2_ip_set.pagseguro_ip_whitelist.arn
#      }
#    }
#
#    visibility_config {
#      cloudwatch_metrics_enabled = true
#      metric_name                = "pagseguro_ip_whitelist-wix"
#      sampled_requests_enabled   = true
#    }
#  }
#
#
###############$$$#######
# Allow by Path Rules 2 #
##################$$$####

#rule {
#    name     = "wix-connector-service-allow-by-path-I"
#    priority = 2
#
#    action {
#      allow {}
#    }
#    statement {
#      or_statement {
#        statement {
#          byte_match_statement {
#            field_to_match {
#              uri_path {}
#            }
#            search_string         = "(/refund"
#            positional_constraint = "STARTS_WITH"
#            text_transformation {
#              type     = "NONE"
#              priority = 0
#            }
#          }
#        }
#        statement {
#          byte_match_statement {
#            field_to_match {
#              uri_path {}
#            }
#            search_string         = "/sale"
#            positional_constraint = "STARTS_WITH"
#            text_transformation {
#              type     = "LOWERCASE"
#              priority = 0
#            }
#          }
#        }
#      }
#    }
#    visibility_config {
#      cloudwatch_metrics_enabled = true
#      metric_name                = "wix-connector-service-allow-by-path"
#      sampled_requests_enabled   = true
#    }
#  } 


################
# WAFV2 IP Set #
################

resource "aws_wafv2_ip_set" "wix-connector-service-ip-whitelist" {
  name               = "wix-connector-service-ip-whitelist"
  description        = "Whitelist WIX IPs"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.ip_whitelist
  tags               = var.tags
}

resource "aws_wafv2_ip_set" "pagseguro_ip_whitelist" {
  name               = "pagseguro-ips-whitelist"
  description        = "Whitelist dos IPs do PagSeguro"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.pagseguro_ip_whitelist
  tags               = var.tags
}
#########################################
# WAFV2 WEB ACL Association > Custom ALB#
#########################################

resource "aws_wafv2_web_acl_association" "main" {
  resource_arn = lookup (var.arn_custom_domain,var.environment)
  web_acl_arn  = lookup (var.wafregional_web_acl_name,var.environment)
}

resource "aws_wafv2_web_acl_logging_configuration" "main" {
 
  log_destination_configs = [module.cloudwatch_log_group_aws_wafv2_logs.main[0].arn]
  resource_arn            = lookup(var.wafregional_web_acl_name,var.environment)
}
