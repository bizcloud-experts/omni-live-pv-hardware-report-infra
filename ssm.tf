resource "aws_ssm_parameter" "omni-pv-hardware-reports-bucket" {
  name  = "/omni-live-pv-hardware-report/${var.env}/athena-results/S3.bucketName"
  type  = "String"
  value = var.pv_hardware_reports_bucket

  tags = {
    Application = "PV Hardware Reports"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-live-pv-hardware-report/${var.env}/athena-results/S3.bucketName"
  }
}

resource "aws_ssm_parameter" "recipient-emails" {
  name  = "/omni-live-pv-hardware-report/${var.env}/recipient/emails"
  type  = "String"
  value = var.recipient_emails

  tags = {
    Application = "PV Hardware Reports"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-live-pv-hardware-report/${var.env}/recipient/emails"
  }
}

resource "aws_ssm_parameter" "lvlp-athena-db-name" {
  name  = "/omni-live-pv-hardware-report/${var.env}/athena/db.Name"
  type  = "String"
  value = var.athena_db_name

  tags = {
    Application = "PV Hardware Reports"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-live-pv-hardware-report/${var.env}/athena/db.Name"
  }
}

resource "aws_ssm_parameter" "sns-error-notification-arn" {
  name  = "/omni-live-pv-hardware-report/${var.env}/error-notification/sns.Arn"
  type  = "String"
  value = aws_sns_topic.omni-live-pv-hardware-reports-error-notification.arn

  tags = {
    Application = "PV Hardware Reports"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-live-pv-hardware-report/${var.env}/error-notification/sns.Arn"
  }
}
