resource "aws_sns_topic" "omni-live-pv-hardware-reports-error-notification" {
  name = "omni-live-pv-hardware-reports-error-notification-${var.env}"

  tags = {
    Application = "PV Hardware Reports"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "omni-live-pv-hardware-reports-error-notification-${var.env}"
  }
}

resource "aws_sns_topic_subscription" "omni_live_pv_hardware_reports_error_notification_email" {
  count = length(var.sns_subscription_email_addresses)
  topic_arn = aws_sns_topic.omni-live-pv-hardware-reports-error-notification.arn
  protocol  = "email"
  endpoint  = var.sns_subscription_email_addresses[count.index]
}
