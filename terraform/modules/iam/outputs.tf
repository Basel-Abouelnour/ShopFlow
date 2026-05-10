###############################################################################
# outputs.tf
###############################################################################

output "iam_group_names" {

  description = "Created IAM group names"

  value = [
    for group in aws_iam_group.groups :
    group.name
  ]
}

output "iam_group_arns" {

  description = "Created IAM group ARNs"

  value = {
    for name, group in aws_iam_group.groups :
    name => group.arn
  }
}

###############################################################################
# EC2 ROLE OUTPUTS
###############################################################################

output "ec2_role_name" {

  description = "EC2 IAM role name"

  value = aws_iam_role.ec2_role.name
}

output "ec2_role_arn" {

  description = "EC2 IAM role ARN"

  value = aws_iam_role.ec2_role.arn
}

###############################################################################
# INSTANCE PROFILE OUTPUTS
###############################################################################

output "instance_profile_name" {

  description = "EC2 instance profile name"

  value = aws_iam_instance_profile.ec2_profile.name
}

output "instance_profile_arn" {

  description = "EC2 instance profile ARN"

  value = aws_iam_instance_profile.ec2_profile.arn
}

###############################################################################
# ATTACHED POLICIES OUTPUTS
###############################################################################

output "group_policy_attachments" {

  description = "Policies attached to IAM groups"

  value = {
    for key, attachment in aws_iam_group_policy_attachment.attachments :
    key => attachment.policy_arn
  }
}

output "ec2_role_attached_policies" {

  description = "Policies attached to EC2 role"

  value = [
    for attachment in aws_iam_role_policy_attachment.ec2_attachments :
    attachment.policy_arn
  ]
}