variable "username" {
  type    = string

}

variable "policy_name" {
  type    = string

}
variable "env" {
  type = string
  }

variable "iam_actions" {
  type = list(string)
}