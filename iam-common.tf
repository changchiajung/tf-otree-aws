data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["codedeploy.amazonaws.com", "codepipeline.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["codedeploy.amazonaws.com", "codepipeline.amazonaws.com", "ec2.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}
