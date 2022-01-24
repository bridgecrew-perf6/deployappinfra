variable "region" {
  default     = "us-east-2"
  description = "AWS region for the services to deploy"
}

variable "instance_type" {
  description = "Instance type to be used"
  type        = string
  default = "t2.micro"
}
