resource "tls_private_key" "tls_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.private_key_name
  public_key = tls_private_key.tls_pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.tls_pk.private_key_pem}' > ./${var.private_key_file_name}"
  }

  tags = var.module_tags
}


resource "aws_instance" "backend_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.ec2_key_pair.key_name

  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  iam_instance_profile = var.ec2_code_deploy_role_name

  user_data = var.user_data_script

  tags = merge(
    var.module_tags,
    {
      Name = var.backend_server_name
    }
  )
}
