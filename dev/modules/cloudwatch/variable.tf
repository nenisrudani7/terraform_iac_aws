variable "service_id" {
  type = string
}
variable "type_of_graph" {
  type = string
}

variable "cpu_widget_position" {
  type = object({
    type   = string
    x      = number
    y      = number
    width  = number
    height = number
  })
}

variable "service_name" {
  type = string
}

variable "type_mantioned" {
  type = string
}

variable "period" {
  type = number
}
variable "stat" {
  type = string
}

variable "region" {
  type = string
}




variable "networkin_widget_position" {
  type = object({
    type   = string
    x      = number
    y      = number
    width  = number
    height = number
  })
}

variable "markdown" {
  type = string
}
variable "text_widget_position" {
  type = object({
    type   = string
    x      = number
    y      = number
    width  = number
    height = number
  })
}

variable "typs_of_metrics" {
  type = object({
    first_metrics = string

    second_metrics = string
  })
}

# for alarm--------
variable "alarm_name" {
  type = string 
}

variable "comparison_operator" {
  type = string
}

variable "evaluation_periods" {
  type = number
}
variable "threshold" {
  type = number
}

variable "alarm_description" {
  type = string
}
