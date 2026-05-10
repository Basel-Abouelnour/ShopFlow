resource "aws_iam_group" "groups" {

  for_each = var.iam_groups

  name = each.key
}
resource "aws_iam_group_policy_attachment" "attachments" {

  for_each = merge([
    for group_name, group_data in var.iam_groups : {

      for policy_arn in group_data.policies :
      "${group_name}-${basename(policy_arn)}" => {

        group_name = group_name
        policy_arn = policy_arn
      }
    }
  ]...)

  group      = aws_iam_group.groups[each.value.group_name].name
  policy_arn = each.value.policy_arn
}
resource "aws_iam_role" "ec2_role" {

  name = var.ec2_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "ec2_attachments" {

  for_each = toset(var.ec2_managed_policies)

  role       = aws_iam_role.ec2_role.name
  policy_arn = each.value
}
resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.ec2_role_name}-profile"

  role = aws_iam_role.ec2_role.name
}
