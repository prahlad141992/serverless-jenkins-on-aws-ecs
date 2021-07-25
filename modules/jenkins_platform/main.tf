data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" selected {
  id = var.vpc_id
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}


resource "aws_security_group" efs_security_group {
  name        = "${var.name_prefix}-efs"
  description = "${var.name_prefix} efs security group"
  vpc_id      = var.vpc_id

  #ingress {
   # protocol        = "tcp"
    #security_groups = [aws_security_group.jenkins_controller_security_group.id]
    #from_port       = 2049
    #to_port         = 2049
  #}

  ingress {
    protocol        = "tcp"
    from_port       = 2049
    to_port         = 2049
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

