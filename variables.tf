variable "region" {
  type    = string
  default = "us-east-1"
}

variable "profile" {
  type    = string
  default = "EC2_RW_Role"
}

variable "service-name" {
  type    = string
  default = "backend"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_ami" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "user_data_script" {
  description = "User data script for EC2 instance"
  type        = string
  default     = <<-EOF
                 #!/usr/bin/env bash
                 sudo apt-get -y update
                 sudo apt-get -y install ruby
                 sudo apt-get -y install wget
                 cd /home/ubuntu
                 wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
                 sudo chmod +x ./install
                 sudo ./install auto
                 EOF
}




variable "private_key_name" {
  type    = string
  default = "otree_ec2_key"
}

variable "private_key_file_name" {
  type    = string
  default = "otree_ec2_key.pem"
}

variable "cw_iam_user" {
  type    = string
  default = "tf_cloudwatch_user"
}

variable "backend_server_name" {
  type    = string
  default = "otree_server"
}

variable "ec2_code_deploy_role_name" {
  type    = string
  default = "tf-EC2CodeDeployRole"
}

variable "code_deploy_role_name" {
  type    = string
  default = "tf-CodeDeployRole"
}

variable "codedeploy_application_name" {
  type    = string
  default = "tf-otree-service-codedeploy"
}

variable "codedeploy_ec2_tag" {
  description = "Map for EC2 tag filter"
  type        = map(string)
  default = {
    type  = "KEY_AND_VALUE"
    key   = "service_name"
    value = "otree"
  }
}

variable "codepipeline_role_name" {
  type    = string
  default = "tf-CodepipelineRole"
}

variable "codepipeline_name" {
  type    = string
  default = "tf-otree-service-pipeline"
}

variable "codepipeline_bucket_name" {
  type    = string
  default = "tf-otree-service-s3"
}

variable "s3kmskey" {
  type    = string
  default = "alias/s3KmsKey"
}

variable "githubConnection_name" {
  type    = string
  default = "github-connection"
}

variable "codepipeline_repo_id" {
  type    = string
  default = "changchiajung/otreeGraph"
}

variable "codepipeline_repo_branch" {
  type    = string
  default = "heroku"
}

variable "module_tags" {
  description = "Common tags applied to every element"
  type        = map(string)
  default = {
    launched_by   = "Terraform"
    launched_user = "Ron"
    service_name  = "otree"
  }
}
