output "aws_region" {
  value = var.region
}

output "cw_role_access_key" {
  value = aws_iam_access_key.cloudwatch_iam_access_key.id
}

output "cw_role_secret_access_key" {
  value     = aws_iam_access_key.cloudwatch_iam_access_key.secret
  sensitive = true
}

output "codedeploy_application_id" {
  value = aws_codedeploy_app.backend_server_codedeploy.id
}

output "codedeploy_deployment_group_id" {
  value = aws_codedeploy_deployment_group.backend_deployment_group.id
}

output "ec2_global_ips" {
  value = aws_instance.backend_server.public_ip
}
