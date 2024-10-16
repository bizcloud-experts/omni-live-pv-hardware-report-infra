variable "env" {
  type     = string
  nullable = false
}

variable "region" {
  type     = string
  nullable = false
}

variable "aws_account_number" {
  type     = string
  nullable = false
}

variable "created_by" {
  type     = string
  nullable = false
}

variable "pv_hardware_reports_bucket" {
  type     = string
  nullable = false
}

variable "recipient_emails" {
  type = string
  nullable = false
}

variable "athena_db_name" {
  type = string
  nullable = false
}

variable "sns_subscription_email_addresses" {
  type = list(string)
  nullable = false
  description = "List of email addresses for SNS subscription"
}