variable "iam_groups" {

  description = "IAM groups and their managed policies"

  type = map(object({
    policies = list(string)
  }))

  default = {

    Developers = {
      policies = [
        "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
        "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
      ]
    }

    Operators = {
      policies = [
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
        "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
      ]
    }

    Viewers = {
      policies = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess"
      ]
    }

    Admins = {
      policies = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
      ]
    }
  }
}

variable "ec2_role_name" {
  type    = string
  default = "ec2-ecr-cloudwatch-role"
}
variable "ec2_managed_policies" {

  type = list(string)

  default = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
}