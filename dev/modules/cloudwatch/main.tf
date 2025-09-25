

resource "aws_cloudwatch_dashboard" "demo-dashboard" {
  dashboard_name = "demo-dashboard-${var.service_id}"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = var.cpu_widget_position.type
        x      = var.cpu_widget_position.x
        y      = var.cpu_widget_position.y
        width  = var.cpu_widget_position.width
        height = var.cpu_widget_position.height

        properties = {
          metrics = [
            [
              "AWS/${var.service_name}",
              var.typs_of_metrics.first_metrics,
              var.type_mantioned,
              "${var.service_id}"
            ]
          ]
          period = var.period
          stat   = var.stat
          region = var.region
          title  = "${var.service_id}-${var.service_name}-${var.typs_of_metrics.first_metrics}"
        }
      },
      {
        type   = var.networkin_widget_position.type
        x      = var.networkin_widget_position.x
        y      = var.networkin_widget_position.y
        width  = var.networkin_widget_position.width
        height = var.networkin_widget_position.height

        properties = {
          markdown = var.markdown
        }
      },
      {
        type   = var.text_widget_position.type
        x      = var.cpu_widget_position.x
        y      = var.text_widget_position.y
        width  = var.text_widget_position.width
        height = var.text_widget_position.height

        properties = {
          metrics = [
            [
              "AWS/${var.service_name}",
              var.typs_of_metrics.second_metrics, 
               var.type_mantioned , 
              "${var.service_id}"
            ]
          ]
          period = var.period
          stat   = var.stat
          region = var.region 
          title  = "${var.service_id} - ${var.typs_of_metrics.second_metrics}"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm" {
  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.typs_of_metrics.first_metrics 
  namespace                 = "AWS/${var.service_name}"
  period                    = var.period
  statistic                 = var.stat
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  insufficient_data_actions = []
}

# x → column position (horizontal placement)

# y → row position (vertical placement)

# width → how many grid columns the widget spans

# height → how many grid rows the widget spans