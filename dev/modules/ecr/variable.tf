variable "repo_name"{
    type = string
    default = "flast-app-ecr"
}

variable "image_retention_count" {
  type = number
  default = 4
}