resource "aws_codedeploy_app" "backend_server_codedeploy" {
  compute_platform = "Server"
  name             = var.codedeploy_application_name
}

resource "aws_codedeploy_deployment_group" "backend_deployment_group" {
  app_name              = aws_codedeploy_app.backend_server_codedeploy.name
  deployment_group_name = "${aws_codedeploy_app.backend_server_codedeploy.name}-deployment-group"
  service_role_arn      = aws_iam_role.code_deploy_role.arn

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  ec2_tag_set {
    ec2_tag_filter {
      type  = var.codedeploy_ec2_tag.type
      key   = var.codedeploy_ec2_tag.key
      value = var.codedeploy_ec2_tag.value
    }
  }

}
