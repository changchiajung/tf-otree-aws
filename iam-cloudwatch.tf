resource "aws_iam_user" "cloudwatch_user" {
  name = var.cw_iam_user
  tags = var.module_tags
}

resource "aws_iam_user_policy_attachment" "cloudwatch_log_policy_attachment" {
  user       = aws_iam_user.cloudwatch_user.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "cloudwatch_policy_attachment" {
  user       = aws_iam_user.cloudwatch_user.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}


resource "aws_iam_access_key" "cloudwatch_iam_access_key" {
  user = aws_iam_user.cloudwatch_user.name
}


